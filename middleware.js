import { ipAddress, next } from '@vercel/functions';

export const config = {
  matcher: '/admin.html',
};

const SUPABASE_URL = 'https://ltqzwqirrasinhomudsl.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_o3AZ3XxmMxx6Xk857kV3pw_ZDTRnbDy';

export default async function middleware(request) {
  const ip = ipAddress(request);

  try {
    const res = await fetch(`${SUPABASE_URL}/rest/v1/admin_allowed_ips?select=ip`, {
      headers: {
        apikey: SUPABASE_ANON_KEY,
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
      },
    });

    if (res.ok) {
      const allowed = (await res.json()).map((row) => row.ip);
      // 허용 목록이 비어있으면 아직 IP를 등록하지 않은 상태이므로 접근을 막지 않는다(초기 잠금 방지)
      if (allowed.length > 0 && !allowed.includes(ip)) {
        return new Response(null, { status: 404 });
      }
    }
  } catch {
    // Supabase 조회 실패 시에는 관리자 접속 장애를 막기 위해 통과시킨다
  }

  return next();
}
