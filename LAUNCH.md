# Arelo launch plan

## Positioning

**One line:** The trading journal that also looks at your sleep, mood and habits, and tells you how much you can risk today.

**Who it is for first:** funded and prop challenge traders (futures and forex), 18 to 35, who already journal a little and know their problem is discipline, not strategy.

**Why they switch:** every other journal shows what happened. Arelo shows *why* (sleep, tilt, overtrading) and stops the next mistake (tilt lock, prop coach, max risk today).

**Rule:** we never show or rank money. Discipline is the scoreboard. That makes sharing safe and honest.

## Free tier and Pro (suggestion)

| | Free | Pro (later) |
|---|---|---|
| Journal, stats, playbook, accounts | ✓ | ✓ |
| Coach light, prop coach, tilt lock | ✓ | ✓ |
| League, public profile, voice log | ✓ | ✓ |
| AI coach and weekly letter | | ✓ |
| Automatic broker sync | | ✓ |
| Phone alerts for all markets (push even when closed) | | ✓ |
| Replay for futures and forex | | ✓ |
| Mentor package (groups of 10+) | | ✓ |

Price idea: 99 kr / $9 per month, 790 kr / $79 per year. Mentors: 49 kr per student per month. Start everything free until there are 500 weekly active users, then turn on Pro.

## 30-day launch

**Week 1: foundation**
- Run the SQL and deploy the `feeds` function.
- 10 friends and your brother use it daily. Fix every small annoyance.
- Make your own public profile and put it in your bio.

**Week 2: content engine (start posting)**
- 1 short video per day (TikTok, Reels, Shorts), 20 to 40 seconds.
- Start one league with 5 to 10 traders you know. Post the weekly leaderboard (discipline only).

**Week 3: communities**
- Share in prop firm Discords, r/Daytrading, r/FuturesTrading, r/Forex and Swedish trading groups, as a free tool, not an ad. Show the prop coach screen.
- Offer 3 to 5 trading mentors a free league for their students.

**Week 4: launch day**
- Post on Product Hunt and Reddit the same day with the landing page.
- Pin a video: "I tracked my sleep against my trades for 30 days."

## 15 video ideas

1. "My trading app told me to sit out today. Here's why." (red light screen)
2. "I lost 3 trades in a row. Then my app locked me out." (tilt lock)
3. "How much can I risk today on my 50K challenge?" (prop coach)
4. "Logging a trade in 5 seconds with my voice"
5. "Replaying my worst trade candle by candle"
6. "Sleep vs P&L: 30 days of data"
7. "The trades I take within 20 minutes of a loss" (revenge stat)
8. "We compete on discipline, not money" (league leaderboard)
9. "My chance to pass this challenge is 68%. Here's how it's calculated." (Monte Carlo)
10. "3 rules that saved my funded account"
11. "What my trading journal says about my mornings"
12. "Day 1 vs day 30 of following my rules"
13. "Rate my R curve" (public profile)
14. "Things I do before the market opens" (habits + plan)
15. "The one question I ask before every trade"

**Format:** hook in the first 2 seconds, screen recording of the app on a phone, one number on screen, end with "free, link in bio."

## Numbers to watch every week

- Weekly active users and how many log at least 3 trades a week
- Day 7 retention (goal: 35%+)
- Leagues created and average members per league
- Public profiles created (each one is free marketing)
- Sign-ups from each video

## Before you grow big

- Check the name Arelo in the App Store, Google Play, domains (arelo.app / arelo.io) and trademarks (PRV, EUIPO) before spending on branding.
- Add a privacy policy and terms page (Supabase stores emails and journal data).
- Keep "not financial advice" visible.

## Market research (November 2026)

What the big journals do and where they leave gaps:

| | Price | Strong at | Weak at |
|---|---|---|---|
| TraderSync | $29.95–79.95/mo | 700+ broker syncs, Cypher AI questions, replay, native apps | Cypher capped at 5 questions/day on Pro, replay detail on top tier |
| TradeZella | $29–99/mo | Replay, playbooks, Zella score, prop firm sync | No free trial, no refunds, replay only on higher tiers, weak mobile |
| Edgewonk | ~$197/yr | Tiltmeter, alternative strategy testing, checklists | No replay, inconsistent auto-sync |
| Tradervue | Free–$49.95/mo | 100+ reports, trade sharing and mentoring | No AI, no replay, dated interface, no mobile app |

**Why traders quit journaling:** too many fields per trade, manual entry right after a loss, writing without ever rereading, no fixed review time.

**What Arelo now does about it:**
- 5-second log: result, symbol, side, rules. Everything else is optional.
- Ask your journal in plain language, free and uncapped, with the trades behind every answer.
- Coach that flags hold-time leaks (losers held longer than winners), sizing up after losses, and weak weekdays.
- Reread card in Routine that brings back old lessons and losing trades.
- Mobile first, which most competitors are not.

**Biggest remaining gap vs. paid tools:** automatic broker sync. That needs a server and is the natural core of a Pro plan.

Sources: daytradingtoolkit.com (best trading journals ranking, Cypher explained), traderssecondbrain.com (best trading journal app), daytradingz.com (TradeZella review), united-daytraders.com (is a trading journal necessary).
