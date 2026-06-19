-- Supabase parking_reviews 테이블 생성 SQL

create table public.parking_reviews (
  id text primary key,
  name text not null,
  url text not null,
  lat numeric,
  lon numeric,
  review text,
  mechanical text,
  entry text,
  spacing text,
  availability text,
  difficulty text,
  photos text,
  created_at timestamptz default now()
);
