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

-- 수정일 추적용 컬럼 (사용자 수정/삭제 요청 기능에 사용)
ALTER TABLE public.parking_reviews ADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now();

-- 사용자의 수정/삭제 요청을 저장하는 테이블
create table public.parking_requests (
  id text primary key,
  review_id text references public.parking_reviews(id) on delete cascade,
  review_name text not null,
  request_type text not null,   -- '수정' 또는 '삭제'
  reason text not null,
  status text not null default '대기중',  -- '대기중' 또는 '처리완료'
  created_at timestamptz default now()
);
