# Arelo

![Arelo](icons/arelo-logo.png)

**A trading journal and life coach in one.** Sleep, mood, habits, money, training and trades in the same app, so you can see what actually drives your results.

**Open the app:** https://pablo523.github.io/Arete/ · **Landing page:** https://pablo523.github.io/Arete/landing.html

## Install on your phone

- **iPhone:** open the link in Safari → Share → *Add to Home Screen*.
- **Android:** open the link in Chrome → *Install app*.

## What is inside

- **Coach that sees the whole person:** a green, yellow or red light every morning from sleep, mood and yesterday's rule breaks, plus patterns between your life and your results (AI coach in the Claude version)
- **Prop mode:** templates for common challenge types, live chance to pass (simulated from your own trades) and your max risk per trade today
- **Discipline league and mentors:** compete with friends on discipline, never money; mentors see a student's details only when the student allows it
- **Voice log:** say what happened and the trade is filled in
- **Replay:** watch a crypto trade play out candle by candle
- **Price alerts:** crypto alerts, live from Binance, while the app is open
- **Public profile:** share discipline, win rate, average R and your R curve at `?u=your-name`. Never amounts
- Trading journal, playbook, accounts, statistics, Monte Carlo, tilt lock, weekly review, reports, position size calculator
- Markets: TradingView charts and prices, news and the ForexFactory calendar
- Habits, goals, weekly planning, money, training, books and films

## Supabase setup (accounts, sync, leagues, profiles, news)

1. **SQL:** Supabase → *SQL Editor → New query*. New project: paste [`supabase/setup.sql`](supabase/setup.sql) and run. Already ran it before: paste only [`supabase/v15-leagues.sql`](supabase/v15-leagues.sql) and run.
2. **News and calendar proxy:** Supabase → *Edge Functions → Deploy a new function → Via editor*. Name it exactly `feeds`, paste [`supabase/functions/feeds/index.ts`](supabase/functions/feeds/index.ts) and deploy. In the function's settings, turn **off** *Enforce JWT verification* (it only fetches public news).
3. **Authentication → URL Configuration:** *Site URL* `https://pablo523.github.io/Arete/`, and the same under *Redirect URLs*.
4. Put the *Project URL* and *publishable* key in [`config.js`](config.js) (already done).

The publishable key is public by design. Row level security makes sure each person only reads and writes their own data. Never share the *service_role / secret* key.

See [LAUNCH.md](LAUNCH.md) for the launch plan.
