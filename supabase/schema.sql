-- Extensions (safe to run multiple times)
create extension if not exists "pgcrypto";
create extension if not exists pg_trgm;

-- Main table: public.mountains
create table if not exists public.mountains (
  id uuid primary key default gen_random_uuid(),
  name varchar not null,
  name_kana varchar,
  elevation int not null check (elevation >= 0),
  location varchar not null,
  prefecture varchar not null,
  description text,
  best_season varchar,
  difficulty_level varchar,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  latitude double precision,
  longitude double precision,
  photo_url varchar,
  constraint latitude_range check (latitude is null or (latitude between -90 and 90)),
  constraint longitude_range check (longitude is null or (longitude between -180 and 180)),
  constraint mountains_name_pref_unique unique (name, prefecture)
);

-- updated_at trigger
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end
$$;

drop trigger if exists set_mountains_updated_at on public.mountains;
create trigger set_mountains_updated_at
before update on public.mountains
for each row execute procedure public.set_updated_at();

-- Indexes
create index if not exists mountains_elevation_idx on public.mountains (elevation);
create index if not exists mountains_prefecture_idx on public.mountains (prefecture);
create index if not exists mountains_name_trgm_idx on public.mountains using gin (name gin_trgm_ops);
create index if not exists mountains_name_kana_trgm_idx on public.mountains using gin (name_kana gin_trgm_ops);
create index if not exists mountains_lat_lon_idx on public.mountains (latitude, longitude);

-- RLS policies
alter table public.mountains enable row level security;

-- Allow read for anon role (public client)
do $$
begin
  if not exists (
    select 1 from pg_policies where schemaname='public' and tablename='mountains' and policyname='Allow anon read mountains'
  ) then
    create policy "Allow anon read mountains"
    on public.mountains for select to anon using (true);
  end if;
end $$;

-- (Optional) Allow authenticated writes: uncomment if needed
-- create policy "Allow authenticated write mountains"
-- on public.mountains for all to authenticated
-- using (true) with check (true);
