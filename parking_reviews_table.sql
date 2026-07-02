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
  fee text default '',
  fee_photo text,
  created_at timestamptz default now()
);

-- 기존 테이블에 컬럼 추가할 경우:
-- ALTER TABLE public.parking_reviews ADD COLUMN fee text DEFAULT '';
-- ALTER TABLE public.parking_reviews ADD COLUMN fee_photo text;
