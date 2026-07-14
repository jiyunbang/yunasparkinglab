-- Supabase admin_allowed_ips 테이블 생성 SQL
-- 관리자 사이트(admin.html) IP 접속 제어에 사용되는 허용 IP 목록

create table public.admin_allowed_ips (
  id text primary key,
  ip text not null,
  memo text,
  created_at timestamptz default now()
);

-- 참고: 이 테이블이 비어있으면 middleware.js는 IP 제한을 적용하지 않습니다.
-- (배포 직후 자기 자신이 접속 못하게 잠기는 것을 방지하기 위함)
-- 관리자사이트 > IP 접속 제어 탭에서 본인 IP를 최소 1개 등록해야 제한이 활성화됩니다.
