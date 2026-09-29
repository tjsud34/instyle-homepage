-- INSTYLE 상담 신청 테이블 (Supabase > SQL Editor 에서 한 번만 실행)

CREATE TABLE consultations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,   -- 고유 번호 (자동 생성)
  name TEXT NOT NULL,                              -- 이름/담당자명
  email TEXT NOT NULL,                             -- 이메일
  phone TEXT,                                      -- 연락처
  situation TEXT,                                  -- 회사/브랜드, 생산 방식, 품목, 수량, 일정 (폼에서 묶어서 저장)
  goal TEXT,                                       -- 희망 일정
  message TEXT,                                    -- 문의 내용
  status TEXT DEFAULT 'pending',                   -- 처리 상태 (pending / done)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() -- 접수 시간 (자동)
);

-- 보안: 행 단위 보안(RLS) 켜기
ALTER TABLE consultations ENABLE ROW LEVEL SECURITY;

-- 누구나 폼 제출(추가)만 가능. 조회/수정/삭제는 허용하지 않음 (관리자 페이지는 Phase 5에서 별도 인증)
CREATE POLICY "Anyone can insert" ON consultations
  FOR INSERT WITH CHECK (true);
