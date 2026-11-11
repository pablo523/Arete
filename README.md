# Arelo

![Arelo](icons/arelo-logo.png)

**The discipline journal for traders.** Your trades, your rules and the days behind them in one place: a command center for today, a journal, analysis and live markets, with sleep, mood and habits feeding your coach.

**Open the app:** https://pablo523.github.io/Arete/ · **Landing page:** https://pablo523.github.io/Arete/landing.html · **Try the demo (no account):** https://pablo523.github.io/Arete/?demo=1

## Install on your phone

- **iPhone:** open the link in Safari → Share → *Add to Home Screen*.
- **Android:** open the link in Chrome → *Install app*.

## First start

A short guided intro where you mostly tap instead of type: language, your experience level, markets and instruments, account type (prop size and firm), setups, sessions, risk per trade, a rule template, your focus and an optional name. "Redo interview" in your profile runs the same interview again with your previous answers pre-selected. The app then opens on your dashboard with your instruments as quick-log chips, your sessions on the clock, matching playbooks and a course "Picked for you" in the Academy. The Swedish version keeps English trading terms (candle, wick, sweep, bias, FVG) and plain Swedish for everything else. The demo link opens a full sample journal (100 days of trades, a prop account, goals and notes) that is never saved.



## Version 61

- **Privé** is the new default look: deep black and near-white, monochrome with no gold. Greens and reds only for results. (Updated after v61: the gold was removed.)
  - Instrument Serif for the voice: greetings, page titles and the big amounts. Geist for everything else.
  - Today opens on a capital card with your net result all time in large gold serif, this year / this month / today, and your curve in gold.
  - Cards have a hairline gold edge and soft depth. Primary buttons are white, the sidebar is quiet with a light marker, and the logo is a dark tile with a white mark.
  - The landing page has the same look: a serif headline with gold italics, gold buttons, and new screenshots.
- Night and Graphite are still available in Profile → Colours.

## Version 60

- **Today is a dashboard:**
  - a search field in the top bar and a big greeting ("Hi Alex!") with today's result and the next session;
  - four key figures with an icon and a change versus the previous period: this week, win rate, rules followed and average R;
  - your curve (30D / 90D / All) next to the result per killzone or setup;
  - three cards: Strengths, To improve (costly mistakes, weak setups) and Next steps, a daily checklist where each step links to the right place;
  - the world clock, quick log, latest trades and "Your day".
- The sidebar marks the page you are on with a solid lilac pill.
- **The new logo everywhere:**
  - share images (trade card, month film, story);
  - the privacy and terms pages;
  - the landing-page screenshots, retaken in the new design;
  - the app splash colour.

## Version 59

- **New logo:** a black "A" on a white tile, with a lilac candle as the crossbar. It replaces the logo in the app, on the landing page, in the app icons (192, 512, Apple touch and maskable) and in the share image.
- **Night colours are now black, white and lilac:**
  - no orange left;
  - the world clock's sessions are grey, and open ones are lilac;
  - the button icons are neutral.

## Version 58

- **Night colours** are the default in the new layout:
  - deep ink with a violet cast, and panels one step lighter;
  - near-white bars and a white equity curve;
  - sky blue for gains, peach for losses, and a lilac accent;
  - the Plus Jakarta Sans typeface, with small-caps labels on figures;
  - a soft violet wash on the greeting card.
- Graphite with orange is still available in Profile → Colours.

## Version 57

- The normal system mouse pointer is back in the new layout. The custom pointer could lag or disappear.
- Cleaner still:
  - The header shows only the title (the market strip is covered by the world clock).
  - The sidebar has one action button.
  - Today has no status pill, two buttons in the hero, and no check-in in the coach card.
  - The week bars are neutral, and the Long/Short tags in lists are plain words.
  - "Your day" starts folded.
  - There is more space between cards.

## Version 56

- **A cleaner design.** Graphite surfaces that sit close to the background, one flat orange accent, and soft mint and coral for results. One typeface (Geist), sentence-case labels, and no glow.
- **Sidebar** in groups (Workspace, Performance, Learn) with a "Search or jump to ⌘K" field at the top.
- **Same card everywhere**, with one radius, one border and one heading style.
- **Today** is calmer:
  - a flat world clock;
  - "Green light" as a short line instead of a giant headline;
  - the day's numbers as four tiles.
- **Analysis** is rebuilt as one story, "Your edge, in numbers", with 30D / 90D / YTD / All:
  - key figures: net, win rate, profit factor, expectancy and max drawdown;
  - the equity curve and consistency (green days, best streak, best day);
  - **When you trade:** killzone, weekday and hour, in Swedish time;
  - **What you trade:** instrument, setup, long vs short and grade;
  - **How you trade:** rules kept vs broken, what each mistake costs, R distribution, and the biggest wins and losses.
  - Every chart ends with a plain sentence, such as "Thursday is your best day." or "62 % win rate when you follow your rules, 45 % when you don't."
  - The older charts, the AI coach and what-if are under "More charts".

## Version 55

- The Tide and Radar looks are gone; Arelo is Classic only. Classic has a **new layout**, and the original one is one tap away in Profile → Layout.
  - The desktop sidebar now floats, with a new set of icons in rounded tiles. The page you are on gets an orange tile.
  - On the phone, the nav is a floating dock with the same icons.
  - A new **card system**: Today is built from cards in a grid (world clock, readiness, quick log, prop, latest, week, coach, curve, your day), and the same cards are used across the app.
  - A **world clock** shows:
    - your time;
    - Sydney, Tokyo, London and New York, each with a small analogue dial that lights up in the market's colour when it is open;
    - the hour difference from you, and the time left or the next open time for each city;
    - the whole day as one timeline in your time, with session bars, killzones and a now marker. On days with no sessions, the next sessions are shown faded.

## Version 52

- **Your edge in numbers** (Analysis → Statistics): where you make and lose money by killzone, weekday, setup, instrument and side, with a weekday × killzone heat map in Swedish time. It shows how certain each finding is.
- **Prop guard:**
  - A live warning at 50 / 70 / 90 % of the daily loss limit or max drawdown.
  - Trading days left, and an estimate of when you reach the target at your pace.
  - A best-day share check for consistency rules.
  - Payouts minus fees per account and per firm.
  - Prop traders now log to their prop account by default.
- **Faster start:**
  - The app code is now a separate cached file (`app.js`), so the page paints at once.
  - The account library loads in the background.
  - Clock time-zone math is cached.
- **Tidvatten (Tide)** is a second complete look you can switch to in your profile (Theme), or try with `?look=tide`. It has:
  - petrol water that changes colour with the live session;
  - a 24-hour tide-line clock you can scrub, with the session open on the line;
  - no cards;
  - a floating buoy cursor with click ripples;
  - magnetic buttons and bobbing icons.

## Home

The first page has no cards and also holds your day (habits, tasks, the week, quick-add, notes and links), so there is one home: a 24-hour session clock with your markets as rings, a big status line (green, yellow or red light) with one plain sentence, today's numbers, a 5-second log bar, your prop progress, today's trades, the week, the coach and a 30-day curve. Tap *My markets* to pick the sessions you trade (Sydney, Tokyo, Frankfurt, London, New York forex, NYSE/CME cash, crypto 24/7). Times are shown in your own time zone, and the page switches between before, during and after your sessions on its own.

## Academy

A learning section with courses built as step-by-step charts: Turtle Soup (from the original 20-day rule to the ICT and Romeo-style liquidity-sweep model: levels, time, the sweep, CISD/MSS confirmation, entry, stop and targets, and a full walkthrough), ICT foundations (structure, FVG, order blocks, premium/discount, power of three), Candle Range Theory, Silver Bullet and killzones. Each lesson has a chart you step through, a short read, key points and a check question. The Turtle Soup Masterclass has 17 lessons in five modules (foundation, timeframes, context, execution, mastery) with timeframe maps and pairs per trading style, the same setup shown on daily, 1H and 5m, daily bias, SMT divergence, risk and management, failed setups, a test after each module (with chart questions) and a 15-question final exam with a certificate at 80%. Courses with a setup can be added to your playbook with their checklist. Education only, not financial advice.

## Soup Training

In the Academy: 10 freshly generated charts per session. Tap the sweep candle, decide trade or no trade, pick the CISD line and the stop. About four in ten charts are traps (breakouts or sweeps that never confirm). Score, streak, perfect rounds and your best result are saved.

## Terminal layout

The app has one look, Classic: a sidebar with your sections on the left, today's light, clock and limits on the home page, and the analysis, journal and academy pages behind it. Behind everything runs your own equity curve as a glowing background: it is built from your trades, grows every time you log one, and ends in a pulsing dot where you are now (before your first trades it shows a calm placeholder curve). Other backgrounds can be picked under Profile → Background. The home clock comes in three styles plus the original: Ring (every market an arc on a 24-hour dial, with killzones and the London–New York overlap), Timeline (a timetable with one lane per market) and Orbits (one ring per market with a dot for now). Text fields (label inside, line, capsule) and icons (duotone, tiles, thin glow) can be switched the same way under Profile. The Academy has a Pattern Lab: 30 concepts in four groups (candles; structure and liquidity; gaps and blocks; time levels in New York time), each with a definition, how to spot it, the common mistake and its source (ICT, Connors & Raschke, Steve Nison, Bill Williams, Al Brooks, Daye's Quarterly Theory). Every exercise is a freshly generated chart graded against the definition, so the practice never runs out; a mixed test weights the concepts you are weakest at and adds name-the-pattern questions, and each concept earns bronze, silver and gold. Five teacher-led courses walk through the theory step by step on charts that build up as you click: Time, AMD and Quarterly Theory (every key time in New York and Swedish time, the true day open, power of three, AMDX/XAMD, quarters and true opens from the year down to 90 minutes, news times), Order blocks in depth, FVG/IFVG and opening gaps (NWOG/NDOG), SMT and SSMT (two markets side by side), and Turtle Soup at pro level (true day open, Asian range, CISD and FVG entries, traps and a full day from 00:00 to target). Four more courses cover the craft around the setups: Risk and psychology (position size, R, expectancy, drawdowns and losing streaks, trade management, tilt, routine), Daily and weekly bias (top-down, draw on liquidity, the previous-day-range scenarios, invalidation), Passing a prop firm challenge (rules, static/EOD/intraday trailing drawdown, risk, consistency, a 50K plan) and Timeframes working together (one job per timeframe, wicks as lower-timeframe sweeps, 4H zone to 1m trigger). Earlier looks (Home, and the older frames and themes) are kept on the `backup-v42-hemma` and `backup-v39-themes` branches.

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
