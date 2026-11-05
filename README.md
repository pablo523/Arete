# Arelo

![Arelo](icons/arelo-logo.png)

**The discipline journal for traders.** Your trades, your rules and the days behind them in one place: a command center for today, a journal, analysis and live markets, with sleep, mood and habits feeding your coach.

**Open the app:** https://pablo523.github.io/Arete/ · **Landing page:** https://pablo523.github.io/Arete/landing.html · **Try the demo (no account):** https://pablo523.github.io/Arete/?demo=1

## Install on your phone

- **iPhone:** open the link in Safari → Share → *Add to Home Screen*.
- **Android:** open the link in Chrome → *Install app*.

## First start

A short guided intro: language, your name, what you trade, your style and a rule template, your focus, then the app opens on your dashboard with everything set up. The demo link opens a full sample journal (100 days of trades, a prop account, goals and notes) that is never saved.

## Home

The first page has no cards and also holds your day (habits, tasks, the week, quick-add, notes and links), so there is one home: a 24-hour session clock with your markets as rings, a big status line (green, yellow or red light) with one plain sentence, today's numbers, a 5-second log bar, your prop progress, today's trades, the week, the coach and a 30-day curve. Tap *My markets* to pick the sessions you trade (Sydney, Tokyo, Frankfurt, London, New York forex, NYSE/CME cash, crypto 24/7). Times are shown in your own time zone, and the page switches between before, during and after your sessions on its own.

## Academy

A learning section with courses built as step-by-step charts: Turtle Soup (from the original 20-day rule to the ICT and Romeo-style liquidity-sweep model: levels, time, the sweep, CISD/MSS confirmation, entry, stop and targets, and a full walkthrough), ICT foundations (structure, FVG, order blocks, premium/discount, power of three), Candle Range Theory, Silver Bullet and killzones. Each lesson has a chart you step through, a short read, key points and a check question. The Turtle Soup Masterclass has 17 lessons in five modules (foundation, timeframes, context, execution, mastery) with timeframe maps and pairs per trading style, the same setup shown on daily, 1H and 5m, daily bias, SMT divergence, risk and management, failed setups, a test after each module (with chart questions) and a 15-question final exam with a certificate at 80%. Courses with a setup can be added to your playbook with their checklist. Education only, not financial advice.

## Soup Training

In the Academy: 10 freshly generated charts per session. Tap the sweep candle, decide trade or no trade, pick the CISD line and the stop. About four in ten charts are traps (breakouts or sweeps that never confirm). Score, streak, perfect rounds and your best result are saved.

## Terminal layout

The app has one look, Classic: a sidebar with your sections on the left, today's light, clock and limits on the home page, and the analysis, journal and academy pages behind it. Behind everything runs your own equity curve as a glowing background: it is built from your trades, grows every time you log one, and ends in a pulsing dot where you are now (before your first trades it shows a calm placeholder curve). Other backgrounds can be picked under Profile → Background. The home clock comes in three styles plus the original: Ring (every market an arc on a 24-hour dial, with killzones and the London–New York overlap), Timeline (a timetable with one lane per market) and Orbits (one ring per market with a dot for now). Text fields (label inside, line, capsule) and icons (duotone, tiles, thin glow) can be switched the same way under Profile. Earlier looks (Home, and the older frames and themes) are kept on the `backup-v42-hemma` and `backup-v39-themes` branches.

**Import from a screenshot.** Take a screenshot of the History tab (Positions) in the MetaTrader 5 app and tap Screenshot next to the 5-second log, or Journal → From screenshot. Arelo reads every closed trade, flags the ones already in your journal, and lets you fix any field before saving. In the Claude version Claude reads the picture. In the app version it is read on your device, or by Claude if you deploy the optional `vision` function (`supabase/functions/vision`, keep JWT verification on and add an `ANTHROPIC_API_KEY` secret).

**Today's session.** A five-minute daily workout on the home page and in the Academy: three fresh charts to read, one theory question from the courses, one rule from your checklists, and today's bias, which you lock before the session and grade the next morning. It keeps a streak, XP, a level and your bias hit rate.

## Layout

Five sections: **Today** (command bar with today's light, result curve, quick log and check-in), **Journal**, **Analysis**, **Markets** and **More** (practice, league, accounts, tools, routine and the life modules). Today is a tiled desk with a draggable column split, plus a Chart tab that draws your account as a candlestick chart (day, week or month candles with crosshair, zoom, MA20, trade-count volume and mistake markers; click a candle to open that day) with a floating HUD and risk gauge, a session bar that switches the dashboard between before the open (routine first), in session (risk and logging only) and after the close (today's timeline), and a Timeline that tells the day as a story (sleep, plan, every trade with the running result, revenge-window and limit warnings, review). On desktop the journal is a list with a detail pane and a trade map (stop, entry, target, exit and the range while in the trade), browsable with the arrow keys. Analysis reads as a numbered report. Settings → Layout → Airy brings back the classic cards. Tools are split into three tabs: calculators, rules and limits, and import, sharing and reports. Trading mode is calm by default: no confetti on trades. Sidebar on desktop, bottom bar and a + button on the phone.

## What is inside

- **5-second log:** result, symbol, side and rules. Date, time, R, setup, emotion and notes are optional
- **Ask your journal:** plain-language questions like "win rate on Fridays after 15" or "best setup last 30 days", answered instantly with the trades behind the answer
- **Edge score:** profit factor, win/loss ratio, drawdown, win rate, recovery and consistency in one 0–100 score with a radar and your biggest lever
- **Reports:** pivot by setup, market, weekday, hour, hold time, R bucket, mistake and more, plus a scatter plot with any two axes
- **Exit analysis:** MAE/MFE (auto-filled from Replay for crypto), exit efficiency and a stop/target simulator
- **Journal filters and bulk edit:** period, market, setup, side, result, rules, mistake and text search, with summary stats and edit-all
- **Import preview:** CSV, Excel and MT5 HTML reports with a preview of columns, new trades and duplicates before anything is saved
- **MetaTrader 5 auto-import:** the read-only [Arelo Sync robot](mt5/AreloSync.mq5) sends every closed trade to your journal
- **Trust:** [privacy policy](privacy.html), [terms](terms.html), export all data, delete account, and error reports
- **Setup library:** classic setups (ORB, VWAP reclaim, break & retest, London breakout and more) added to your playbook in one tap
- **Notebook:** daily plan, weekly recap, trading plan and after-a-bad-day templates
- **Trade grades A–F, process goals with streaks, fee analysis, a customizable home and an options calculator** (payoff, breakevens, greeks)
- **Share a trade for feedback:** a link mentors and friends can open and comment on
- **Verified badge:** public profiles show how many trades were synced automatically from MetaTrader
- **Risk engine:** Kelly and simulated risk of ruin from your own trades
- **Coach that sees the whole person:** a green, yellow or red light every morning from sleep, mood and yesterday's rule breaks, plus patterns between your life and your results (AI coach in the Claude version)
- **Prop mode:** templates for common challenge types, live chance to pass (simulated from your own trades) and your max risk per trade today
- **Discipline league and mentors:** compete with friends on discipline, never money; mentors see a student's details only when the student allows it
- **Voice log:** say what happened and the trade is filled in
- **Replay:** watch a crypto trade play out candle by candle
- **Price alerts:** crypto alerts, live from Binance, while the app is open
- **What if?:** see what your result would have been if you had followed every rule, stopped after two losses, only taken your best setups and more
- **Practice mode:** a flight simulator for trading. Trade a random historical day candle by candle, with keyboard shortcuts, scored in R
- **Automatic rules:** max trades, pause after a loss, no trades near red news, max loss in R and more, checked on every trade
- **Trading home:** its own tab with a live strip (sessions, next red news), animated result curve in money or R, and a focus mode for market hours
- **Weekly story card:** a 9:16 image of your week in R and discipline, ready for Instagram or TikTok
- **Themes and backgrounds:** Graphite, Bone, Terminal, Amber and Midnight, plus 18 backgrounds
- **Public profile:** share discipline, win rate, average R and your R curve at `?u=your-name`. Never amounts
- Trading journal, playbook, accounts, statistics, Monte Carlo, tilt lock, weekly review, reports, position size calculator
- Markets: TradingView charts and prices, news and the ForexFactory calendar
- Habits, goals, weekly planning, money, training, books and films

## Supabase setup (accounts, sync, leagues, profiles, news)

1. **SQL:** Supabase → *SQL Editor → New query*. New project: paste [`supabase/setup.sql`](supabase/setup.sql) and run. Already ran it before: paste only [`supabase/v15-leagues.sql`](supabase/v15-leagues.sql) and run.
2. **News and calendar proxy:** Supabase → *Edge Functions → Deploy a new function → Via editor*. Name it exactly `feeds`, paste [`supabase/functions/feeds/index.ts`](supabase/functions/feeds/index.ts) and deploy. In the function's settings, turn **off** *Enforce JWT verification* (it only fetches public news).
3. **Trust and MT5 sync (v21):** SQL Editor → paste [`supabase/v21-trust-and-sync.sql`](supabase/v21-trust-and-sync.sql) → Run. Then *Edge Functions → Deploy a new function → Via editor*, name it exactly `ingest`, paste [`supabase/functions/ingest/index.ts`](supabase/functions/ingest/index.ts), deploy, and turn **off** *Enforce JWT verification* (the robot authenticates with the user's sync key).
4. **Trade sharing (v22):** SQL Editor → paste [`supabase/v22-sharing.sql`](supabase/v22-sharing.sql) → Run.
5. **Authentication → URL Configuration:** *Site URL* `https://pablo523.github.io/Arete/`, and the same under *Redirect URLs*.
6. Put the *Project URL* and *publishable* key in [`config.js`](config.js) (already done).

The publishable key is public by design. Row level security makes sure each person only reads and writes their own data. Never share the *service_role / secret* key.

See [LAUNCH.md](LAUNCH.md) for the launch plan.
