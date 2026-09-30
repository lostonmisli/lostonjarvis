-- Life Checklist database setup. Paste all of this into Supabase: SQL Editor -> New query -> Run.

create table if not exists public.docs (
  user_id    uuid        not null default auth.uid() references auth.users on delete cascade,
  path       text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, path)
);

-- Row Level Security: every account can only ever see and change its own rows.
alter table public.docs enable row level security;

drop policy if exists "read own"   on public.docs;
drop policy if exists "add own"    on public.docs;
drop policy if exists "change own" on public.docs;
drop policy if exists "delete own" on public.docs;
create policy "read own"   on public.docs for select using (auth.uid() = user_id);
create policy "add own"    on public.docs for insert with check (auth.uid() = user_id);
create policy "change own" on public.docs for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own" on public.docs for delete using (auth.uid() = user_id);

grant select, insert, update, delete on public.docs to authenticated;
