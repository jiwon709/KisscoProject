package com.petcare.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.www.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	// 일반 회원가입
	public int joinMember(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.joinMember(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 일반 로그인을 위한 검색
	public MemberVO getMember(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO result = null;
		try {
			result = mapper.getMember(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//카카오 회원가입여부 체크(id값 찾기)
	public MemberVO joinKakaoCheck(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO result = null;
		try {
			result = mapper.joinKakaoCheck(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 카카오 회원가입
	public int kakaoJoinMember(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.kakaoJoinMember(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		}

	//일반회원 마이페이지
	public MemberVO oneMember(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO result = null;
		try {
			result = mapper.oneMember(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;	
	}

}

	
	
