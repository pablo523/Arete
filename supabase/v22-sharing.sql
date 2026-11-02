-- Arelo v22: run once in Supabase -> SQL Editor -> New query -> Run.
-- "Share a trade for feedback": a public link per shared trade, comments from signed-in users,
-- and a public bucket for the shared chart screenshot.

create table if not exists public.shared_trades(
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  author text not null default '',
  trade jsonb not null,
  img text,
  created_at timestamptz not null default now());
alter table public.shared_trades enable row level security;
drop policy if exists "shared: anyone with link reads" on public.shared_trades;
drop policy if exists "shared: own insert" on public.shared_trades;
drop policy if exists "shared: own update" on public.shared_trades;
drop policy if exists "shared: own delete" on public.shared_trades;
create policy "shared: anyone with link reads" on public.shared_trades for select using (true);
create policy "shared: own insert" on public.shared_trades for insert with check (auth.uid() = user_id);
create policy "shared: own update" on public.shared_trades for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "shared: own delete" on public.shared_trades for delete using (auth.uid() = user_id);
grant select on public.shared_trades to anon, authenticated;
grant insert, update, delete on public.shared_trades to authenticated;

create table if not exists public.trade_comments(
  id bigserial primary key,
  share_id uuid not null references public.shared_trades(id) on delete cascade,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null default '' check (char_length(name) <= 60),
  body text not null check (char_length(body) between 1 and 1000),
  created_at timestamptz not null default now());
alter table public.trade_comments enable row level security;
drop policy if exists "comments: read" on public.trade_comments;
drop policy if exists "comments: signed-in add" on public.trade_comments;
drop policy if exists "comments: author or owner deletes" on public.trade_comments;
create policy "comments: read" on public.trade_comments for select using (true);
create policy "comments: signed-in add" on public.trade_comments for insert with check (auth.uid() = user_id);
create policy "comments: author or owner deletes" on public.trade_comments for delete using (
  auth.uid() = user_id or exists (select 1 from public.shared_trades s where s.id = share_id and s.user_id = auth.uid()));
grant select on public.trade_comments to anon, authenticated;
grant insert, delete on public.trade_comments to authenticated;
grant usage, select on sequence public.trade_comments_id_seq to authenticated;

insert into storage.buckets (id, name, public) values ('shared', 'shared', true) on conflict (id) do nothing;
drop policy if exists "Shared shots: upload own" on storage.objects;
drop policy if exists "Shared shots: delete own" on storage.objects;
drop policy if exists "Shared shots: update own" on storage.objects;
create policy "Shared shots: upload own" on storage.objects for insert with check (bucket_id = 'shared' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "Shared shots: update own" on storage.objects for update using (bucket_id = 'shared' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "Shared shots: delete own" on storage.objects for delete using (bucket_id = 'shared' and (storage.foldername(name))[1] = auth.uid()::text);
drop policy if exists "Shared shots: list own" on storage.objects;
create policy "Shared shots: list own" on storage.objects for select using (bucket_id = 'shared' and (storage.foldername(name))[1] = auth.uid()::text);
