-- Arelo v15: run this once in Supabase → SQL Editor → New query → Run.
-- (Only needed if you already ran setup.sql before. New projects: setup.sql has everything.)

-- =====================================================================
-- v15: discipline leagues, mentor view and public profiles
-- Safe to run more than once.
-- =====================================================================
create table if not exists public.teams(
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(name) between 1 and 40),
  code text unique not null,
  owner uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now());
create table if not exists public.team_members(
  team_id uuid not null references public.teams(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null default '',
  role text not null default 'member' check (role in ('owner','mentor','member')),
  share_detail boolean not null default false,
  stats jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (team_id,user_id));
create table if not exists public.team_details(
  team_id uuid not null references public.teams(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  detail jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (team_id,user_id));
alter table public.teams enable row level security;
alter table public.team_members enable row level security;
alter table public.team_details enable row level security;

create or replace function public.is_team_member(t uuid) returns boolean language sql stable security definer set search_path=public as
$$ select exists(select 1 from team_members where team_id=t and user_id=auth.uid()) $$;
create or replace function public.is_team_coach(t uuid) returns boolean language sql stable security definer set search_path=public as
$$ select exists(select 1 from team_members where team_id=t and user_id=auth.uid() and role in ('owner','mentor')) $$;

drop policy if exists "teams: members read" on public.teams;
create policy "teams: members read" on public.teams for select using (public.is_team_member(id));
drop policy if exists "teams: owner deletes" on public.teams;
create policy "teams: owner deletes" on public.teams for delete using (owner=auth.uid());

drop policy if exists "members: team reads" on public.team_members;
create policy "members: team reads" on public.team_members for select using (public.is_team_member(team_id));
drop policy if exists "members: update own" on public.team_members;
create policy "members: update own" on public.team_members for update using (user_id=auth.uid()) with check (user_id=auth.uid());
drop policy if exists "members: leave" on public.team_members;
create policy "members: leave" on public.team_members for delete using (user_id=auth.uid());
revoke update on public.team_members from authenticated, anon;
grant update (name, share_detail, stats, updated_at) on public.team_members to authenticated;

drop policy if exists "details: own or coach" on public.team_details;
create policy "details: own or coach" on public.team_details for select using (
  user_id=auth.uid() or (public.is_team_coach(team_id) and exists(
    select 1 from public.team_members m where m.team_id=team_details.team_id and m.user_id=team_details.user_id and m.share_detail)));
drop policy if exists "details: write own" on public.team_details;
create policy "details: write own" on public.team_details for insert with check (user_id=auth.uid() and public.is_team_member(team_id));
drop policy if exists "details: update own" on public.team_details;
create policy "details: update own" on public.team_details for update using (user_id=auth.uid()) with check (user_id=auth.uid());
drop policy if exists "details: delete own" on public.team_details;
create policy "details: delete own" on public.team_details for delete using (user_id=auth.uid());

create or replace function public.create_team(p_name text, p_disp text) returns uuid language plpgsql security definer set search_path=public as $$
declare t uuid; c text;
begin
  if auth.uid() is null then raise exception 'not signed in'; end if;
  loop c := upper(substr(md5(random()::text||clock_timestamp()::text),1,6)); exit when not exists(select 1 from teams where code=c); end loop;
  insert into teams(name,code,owner) values (left(trim(p_name),40),c,auth.uid()) returning id into t;
  insert into team_members(team_id,user_id,name,role) values (t,auth.uid(),left(coalesce(p_disp,''),40),'owner');
  return t;
end $$;
create or replace function public.join_team(p_code text, p_disp text) returns uuid language plpgsql security definer set search_path=public as $$
declare t uuid;
begin
  if auth.uid() is null then raise exception 'not signed in'; end if;
  select id into t from teams where code=upper(trim(p_code));
  if t is null then return null; end if;
  insert into team_members(team_id,user_id,name) values (t,auth.uid(),left(coalesce(p_disp,''),40)) on conflict do nothing;
  return t;
end $$;
create or replace function public.set_team_role(p_team uuid, p_user uuid, p_role text) returns void language plpgsql security definer set search_path=public as $$
begin
  if not exists(select 1 from teams where id=p_team and owner=auth.uid()) then raise exception 'only the owner can change roles'; end if;
  if p_role not in ('mentor','member') then raise exception 'bad role'; end if;
  update team_members set role=p_role where team_id=p_team and user_id=p_user and role<>'owner';
end $$;
revoke execute on function public.create_team(text,text), public.join_team(text,text), public.set_team_role(uuid,uuid,text) from public, anon;
grant execute on function public.create_team(text,text), public.join_team(text,text), public.set_team_role(uuid,uuid,text) to authenticated;
grant select, delete on public.teams to authenticated;
grant select, delete on public.team_members to authenticated;
grant select, insert, update, delete on public.team_details to authenticated;

create table if not exists public.public_profiles(
  slug text primary key check (slug ~ '^[a-z0-9][a-z0-9-]{2,29}$'),
  user_id uuid unique not null references auth.users(id) on delete cascade,
  name text not null default '',
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now());
alter table public.public_profiles enable row level security;
drop policy if exists "profiles: anyone reads" on public.public_profiles;
create policy "profiles: anyone reads" on public.public_profiles for select using (true);
drop policy if exists "profiles: own insert" on public.public_profiles;
create policy "profiles: own insert" on public.public_profiles for insert with check (user_id=auth.uid());
drop policy if exists "profiles: own update" on public.public_profiles;
create policy "profiles: own update" on public.public_profiles for update using (user_id=auth.uid()) with check (user_id=auth.uid());
drop policy if exists "profiles: own delete" on public.public_profiles;
create policy "profiles: own delete" on public.public_profiles for delete using (user_id=auth.uid());
grant select on public.public_profiles to anon, authenticated;
grant insert, update, delete on public.public_profiles to authenticated;
