-- Arelo v21: run once in Supabase -> SQL Editor -> New query -> Run.
-- Adds: error reports, "delete my account", and MetaTrader 5 auto-import.

-- 1) Error reports (users can only add, never read others; you read them in the dashboard)
create table if not exists public.app_errors(
  id bigserial primary key,
  user_id uuid default auth.uid() references auth.users(id) on delete set null,
  msg text not null, stack text, view text, ua text, app text,
  created_at timestamptz not null default now());
alter table public.app_errors enable row level security;
drop policy if exists "errors: insert own" on public.app_errors;
create policy "errors: insert own" on public.app_errors for insert with check (auth.uid() = user_id);
grant insert on public.app_errors to authenticated;
grant usage, select on sequence public.app_errors_id_seq to authenticated;

-- 2) MetaTrader 5 sync: one secret key per user, and an inbox the robot writes to
create table if not exists public.ingest_tokens(
  token text primary key check (char_length(token) between 20 and 80),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  created_at timestamptz not null default now());
alter table public.ingest_tokens enable row level security;
drop policy if exists "tokens: own" on public.ingest_tokens;
create policy "tokens: own" on public.ingest_tokens for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
grant select, insert, delete on public.ingest_tokens to authenticated;

create table if not exists public.inbox(
  id bigserial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  trade jsonb not null,
  created_at timestamptz not null default now());
create index if not exists inbox_user on public.inbox(user_id);
alter table public.inbox enable row level security;
drop policy if exists "inbox: read own" on public.inbox;
drop policy if exists "inbox: delete own" on public.inbox;
create policy "inbox: read own" on public.inbox for select using (auth.uid() = user_id);
create policy "inbox: delete own" on public.inbox for delete using (auth.uid() = user_id);
grant select, delete on public.inbox to authenticated;
-- (only the "ingest" edge function, using the service role, can insert)

-- 3) Delete my account: removes every row the user owns and the login itself
create or replace function public.delete_my_account() returns void
language plpgsql security definer set search_path = public as $$
declare me uuid := auth.uid();
begin
  if me is null then raise exception 'not signed in'; end if;
  -- each table is optional, so this works even if some setup steps were skipped
  if to_regclass('public.inbox') is not null then delete from public.inbox where user_id = me; end if;
  if to_regclass('public.ingest_tokens') is not null then delete from public.ingest_tokens where user_id = me; end if;
  if to_regclass('public.public_profiles') is not null then execute 'delete from public.public_profiles where user_id = $1' using me; end if;
  if to_regclass('public.team_details') is not null then execute 'delete from public.team_details where user_id = $1' using me; end if;
  if to_regclass('public.team_members') is not null then execute 'delete from public.team_members where user_id = $1' using me; end if;
  if to_regclass('public.teams') is not null then execute 'delete from public.teams where owner = $1' using me; end if;
  delete from public.docs where user_id = me;
  update public.app_errors set user_id = null where user_id = me;
  delete from auth.users where id = me;
end $$;
revoke execute on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
