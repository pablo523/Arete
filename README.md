# Arete

**A personal command center for becoming a better version of yourself.**
Habits, tasks, money, training, reading, trading and goals in one place, with levels, seasons and a design that feels like an instrument, not a spreadsheet.

**Open the app:** https://pablo523.github.io/Arete/

## Install on your phone

- **iPhone:** open the link in Safari → Share → *Add to Home Screen*.
- **Android:** open the link in Chrome → *Install app* (or ⋮ → *Add to Home screen*).

It opens full screen and works offline.

## Your data

Everything you log stays **on your own device**. Nothing is sent to a server, and nobody else can see it.
Use **Profile → Save backup** now and then, and **Restore backup** to move to a new phone or computer.

## What is inside

- Personal interview that shapes the app around you
- Today dashboard, habits, weekly planning, morning mode and Sunday ritual
- Money: transactions, CSV import from your bank, budget, savings goals and a goal forecast
- Training program that progresses with you, sessions, personal bests, sleep and body trend
- Reading and watch lists, vision board, letters to your future self, decision journal
- Trading journal: pre-trade ticket (FOMO brake), analytics by setup, weekday and hour, backtest vs live, prop firm evaluation mode, CSV import
- Levels per life area, quarterly seasons with medals, unlocks, month film and share cards

## Accounts and sync (optional)

Arete works without accounts. To let people log in and sync between devices:

1. Create a free project at [supabase.com](https://supabase.com).
2. In the project: **SQL Editor → New query**, paste everything from [`supabase/setup.sql`](supabase/setup.sql) and press **Run**.
3. **Authentication → URL Configuration:** set *Site URL* to `https://pablo523.github.io/Arete/` and add the same address under *Redirect URLs*.
4. **Project Settings → API:** copy the *Project URL* and the *anon / publishable* key into [`config.js`](config.js).

The anon key is public by design. Row level security in `setup.sql` makes sure every person can only read and write their own data.

---

# Arete (svenska)

**En personlig kontrollpanel för att bli en bättre version av dig själv.**

**Öppna appen:** https://pablo523.github.io/Arete/

- **iPhone:** öppna länken i Safari → Dela → *Lägg till på hemskärmen*.
- **Android:** öppna länken i Chrome → *Installera app*.

All din data sparas **bara på din egen enhet**. Använd **Profil → Spara säkerhetskopia** då och då.
