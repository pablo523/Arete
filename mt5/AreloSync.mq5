//+------------------------------------------------------------------+
//|  AreloSync.mq5                                                    |
//|  Sends every closed trade to your Arelo journal.                  |
//|                                                                   |
//|  Setup (2 minutes):                                               |
//|  1. In Arelo: More > Tools and rules > Auto-import from MT5 >     |
//|     Create my sync key, and copy the key.                         |
//|  2. In MT5: File > Open Data Folder > MQL5 > Experts, put this    |
//|     file there, then restart MT5 (or right-click Experts >        |
//|     Refresh in the Navigator).                                    |
//|  3. Tools > Options > Expert Advisors: tick "Allow WebRequest for |
//|     listed URL" and add: https://nqbdylperlboanfmnslw.supabase.co |
//|  4. Drag "AreloSync" onto any chart, paste the key in SyncKey,    |
//|     and make sure "Algo Trading" is switched on.                  |
//|                                                                   |
//|  The robot never places, changes or closes trades. It only reads  |
//|  your closed trades and sends them to your own journal.           |
//+------------------------------------------------------------------+
#property copyright "Arelo"
#property version   "1.00"
#property description "Sends every closed trade to your Arelo journal. Read-only: it never trades."

input string SyncKey     = "";   // Sync key from Arelo
input string Endpoint    = "https://nqbdylperlboanfmnslw.supabase.co/functions/v1/ingest"; // Arelo address
input int    HistoryDays = 7;    // On start, also send closed trades from the last N days (0 = off)

//--- helpers
string Esc(string s)
  {
   StringReplace(s, "\\", "\\\\");
   StringReplace(s, "\"", "\\\"");
   return s;
  }

long ToUtc(datetime t)
  {
   // server time -> UTC seconds
   long offset = (long)TimeTradeServer() - (long)TimeGMT();
   return (long)t - offset;
  }

//--- build one JSON object for a closing deal, or "" if the deal does not close a position
string TradeJson(ulong deal)
  {
   if(!HistoryDealSelect(deal))
      return "";
   long entry = HistoryDealGetInteger(deal, DEAL_ENTRY);
   if(entry != DEAL_ENTRY_OUT && entry != DEAL_ENTRY_INOUT && entry != DEAL_ENTRY_OUT_BY)
      return "";
   long dtype = HistoryDealGetInteger(deal, DEAL_TYPE);
   if(dtype != DEAL_TYPE_BUY && dtype != DEAL_TYPE_SELL)
      return "";

   long     pos    = HistoryDealGetInteger(deal, DEAL_POSITION_ID);
   string   sym    = HistoryDealGetString(deal, DEAL_SYMBOL);
   double   vol    = HistoryDealGetDouble(deal, DEAL_VOLUME);
   double   cprice = HistoryDealGetDouble(deal, DEAL_PRICE);
   datetime ctime  = (datetime)HistoryDealGetInteger(deal, DEAL_TIME);
   double   profit = HistoryDealGetDouble(deal, DEAL_PROFIT);
   double   comm   = HistoryDealGetDouble(deal, DEAL_COMMISSION);
   double   swap   = HistoryDealGetDouble(deal, DEAL_SWAP);
   double   sl     = HistoryDealGetDouble(deal, DEAL_SL);
   double   tp     = HistoryDealGetDouble(deal, DEAL_TP);

   // a closing SELL closes a BUY position, and the other way around
   string   side   = (dtype == DEAL_TYPE_SELL) ? "buy" : "sell";
   datetime otime  = 0;
   double   oprice = 0, ocomm = 0;

   if(HistorySelectByPosition(pos))
     {
      int n = HistoryDealsTotal();
      for(int i = 0; i < n; i++)
        {
         ulong d = HistoryDealGetTicket(i);
         if(HistoryDealGetInteger(d, DEAL_ENTRY) == DEAL_ENTRY_IN)
           {
            otime  = (datetime)HistoryDealGetInteger(d, DEAL_TIME);
            oprice = HistoryDealGetDouble(d, DEAL_PRICE);
            ocomm  = HistoryDealGetDouble(d, DEAL_COMMISSION);
            side   = (HistoryDealGetInteger(d, DEAL_TYPE) == DEAL_TYPE_BUY) ? "buy" : "sell";
            break;
           }
        }
     }

   int dg = (int)SymbolInfoInteger(sym, SYMBOL_DIGITS);
   if(dg <= 0)
      dg = 5;

   string j = "{";
   j += "\"ticket\":\"" + IntegerToString((long)deal) + "\",";
   j += "\"symbol\":\"" + Esc(sym) + "\",";
   j += "\"type\":\"" + side + "\",";
   j += "\"volume\":" + DoubleToString(vol, 2) + ",";
   j += "\"open_time\":" + IntegerToString(otime > 0 ? ToUtc(otime) : 0) + ",";
   j += "\"close_time\":" + IntegerToString(ToUtc(ctime)) + ",";
   j += "\"open_price\":" + DoubleToString(oprice, dg) + ",";
   j += "\"close_price\":" + DoubleToString(cprice, dg) + ",";
   j += "\"sl\":" + DoubleToString(sl, dg) + ",";
   j += "\"tp\":" + DoubleToString(tp, dg) + ",";
   j += "\"profit\":" + DoubleToString(profit, 2) + ",";
   j += "\"commission\":" + DoubleToString(comm + ocomm, 2) + ",";
   j += "\"swap\":" + DoubleToString(swap, 2) + ",";
   j += "\"account\":\"" + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) + "\"";
   j += "}";
   return j;
  }

//--- POST a JSON array body to Arelo
bool Send(string items)
  {
   if(StringLen(SyncKey) < 20)
     {
      Print("Arelo: paste your sync key in the robot settings (SyncKey).");
      return false;
     }
   string body = "{\"token\":\"" + Esc(SyncKey) + "\",\"trades\":[" + items + "]}";
   char data[];
   int n = StringToCharArray(body, data, 0, WHOLE_ARRAY, CP_UTF8);
   if(n > 0)
      ArrayResize(data, n - 1); // drop the trailing zero
   char res[];
   string rh;
   ResetLastError();
   int code = WebRequest("POST", Endpoint, "Content-Type: application/json\r\n", 8000, data, res, rh);
   if(code == -1)
     {
      Print("Arelo: could not reach Arelo (error ", GetLastError(), "). Add https://nqbdylperlboanfmnslw.supabase.co under Tools > Options > Expert Advisors > Allow WebRequest.");
      return false;
     }
   Print("Arelo: sent. Server answered ", code, " ", CharArrayToString(res, 0, WHOLE_ARRAY, CP_UTF8));
   return code == 200;
  }

//--- send recent history on start
void SendHistory()
  {
   if(HistoryDays <= 0)
      return;
   datetime to = TimeCurrent() + 60;
   datetime from = to - (datetime)(HistoryDays * 86400);
   if(!HistorySelect(from, to))
      return;
   int n = HistoryDealsTotal();
   ulong tickets[];
   ArrayResize(tickets, n);
   for(int i = 0; i < n; i++)
      tickets[i] = HistoryDealGetTicket(i);

   string batch = "";
   int count = 0;
   for(int i = 0; i < n; i++)
     {
      string j = TradeJson(tickets[i]);
      if(j == "")
         continue;
      batch += (count > 0 ? "," : "") + j;
      count++;
      if(count == 100)
        {
         Send(batch);
         batch = "";
         count = 0;
        }
     }
   if(count > 0)
      Send(batch);
  }

//--- events
int OnInit()
  {
   if(StringLen(SyncKey) < 20)
      Print("Arelo: paste your sync key from Arelo in the robot settings.");
   else
      SendHistory();
   return(INIT_SUCCEEDED);
  }

void OnTradeTransaction(const MqlTradeTransaction &trans,
                        const MqlTradeRequest &request,
                        const MqlTradeResult &result)
  {
   if(trans.type != TRADE_TRANSACTION_DEAL_ADD)
      return;
   string j = TradeJson(trans.deal);
   if(j != "")
      Send(j);
  }
//+------------------------------------------------------------------+
