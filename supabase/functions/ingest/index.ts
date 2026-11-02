// Supabase Edge Function: "ingest"
// Receives closed trades from the Arelo Sync robot in MetaTrader 5 and puts
// them in the user's inbox. The robot authenticates with the user's secret
// sync key (created in Arelo → More → Tools and rules). Deploy with
// "Enforce JWT verification" turned OFF; the key is checked here instead.
import { createClient } from "jsr:@supabase/supabase-js@2";

const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};
const json = (b: unknown, s = 200) =>
  new Response(JSON.stringify(b), { status: s, headers: { ...cors, "content-type": "application/json" } });
const num = (v: unknown) => (typeof v === "number" && isFinite(v) ? v : Number(v) || 0);
const str = (v: unknown, n: number) => String(v ?? "").slice(0, n);

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  if (req.method !== "POST") return json({ error: "POST only" }, 405);
  let body: any;
  try { body = await req.json(); } catch { return json({ error: "bad json" }, 400); }
  const token = str(body?.token, 80).trim();
  if (token.length < 20) return json({ error: "missing key" }, 401);
  const trades = Array.isArray(body?.trades) ? body.trades.slice(0, 200) : [];
  if (!trades.length) return json({ ok: 0 });

  const sb = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!);
  const { data: tk } = await sb.from("ingest_tokens").select("user_id").eq("token", token).maybeSingle();
  if (!tk) return json({ error: "unknown key" }, 401);

  const rows = trades.map((t: any) => ({
    user_id: tk.user_id,
    trade: {
      ticket: str(t.ticket, 40), symbol: str(t.symbol, 30), type: str(t.type, 10),
      volume: num(t.volume), open_time: num(t.open_time), close_time: num(t.close_time),
      open_price: num(t.open_price), close_price: num(t.close_price), sl: num(t.sl), tp: num(t.tp),
      profit: num(t.profit), commission: num(t.commission), swap: num(t.swap), account: str(t.account, 30),
    },
  })).filter((r: any) => r.trade.ticket && r.trade.close_time > 0);
  if (!rows.length) return json({ ok: 0 });
  const { error } = await sb.from("inbox").insert(rows);
  if (error) return json({ error: "store failed" }, 500);
  return json({ ok: rows.length });
});
