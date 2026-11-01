-- Arete: run this once in Supabase → SQL Editor → New query → Run.
-- One row per user and document. Row level security makes sure every
-- person can only ever read and write their own rows.

create table if not exists public.docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  key        text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, key)
);

alter table public.docs enable row level security;

drop policy if exists "Own documents: read"   on public.docs;
drop policy if exists "Own documents: insert" on public.docs;
drop policy if exists "Own documents: update" on public.docs;
drop policy if exists "Own documents: delete" on public.docs;

create policy "Own documents: read"   on public.docs for select using (auth.uid() = user_id);
create policy "Own documents: insert" on public.docs for insert with check (auth.uid() = user_id);
create policy "Own documents: update" on public.docs for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Own documents: delete" on public.docs for delete using (auth.uid() = user_id);
