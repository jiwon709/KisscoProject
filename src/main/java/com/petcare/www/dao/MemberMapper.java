package com.petcare.www.dao;

import com.petcare.www.vo.MemberVO;

public interface MemberMapper {
	
	//일반 회원가입
	public int joinMember(MemberVO member);
	
	//일반 로그인을 위한 검색
	public MemberVO getMember(String member_id);
	
	//카카오 회원가입여부 체크(id값 찾기)
	public MemberVO joinKakaoCheck(String member_id);
	
	// 카카오 회원가입
	public int kakaoJoinMember(MemberVO member);
	
	// 일반회원 마이페이지
	public MemberVO oneMember(String member_id);

}
