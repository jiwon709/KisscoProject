package com.petcare.www.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.www.dao.MemberDAO;
import com.petcare.www.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	// 회원가입 (일반 or 카카오로인지 판별)
	public String joinMember(MemberVO member) {
		
		String kakao_id = (String)session.getAttribute("kakao_id");
		int cnt = 0;
		
		if(kakao_id == null) {	// session에 카카오 아이디가 들어있지 않으면 일반회원테이블 연결
			cnt = dao.joinMember(member); // dao, interface 카카오 정보넘길거 만들기
		}else {
			cnt = dao.kakaoJoinMember(member);
		}
		
		String page = null;
		if(cnt == 0) {
			page = "redirect:/member/joinForm"; // 회원가입 실패시 마이페이지로 이동
		}else {
			page = "redirect:/member/login"; //회원가입 성공 시 로그인 페이지로 이동
		}
		
		return page;
	}
	
	// 일반 로그인
	public String getMember(MemberVO member) {
		MemberVO loginCheck = dao.getMember(member.getMember_id());
		
		String page = "";
		// 검색된 값이 없거나, 검색된 값의 비밀번호와 입력한 비밀번호가 같아야 로그인
		if(loginCheck != null && loginCheck.getMember_pw().equals(member.getMember_pw())) {
			session.setAttribute("loginId", member.getMember_id()); // id session에 저장
			page = "redirect:/"; //홈으로 이동
		}else {
			page = "redirect:/member/login"; // 로그인실패시 로그인폼으로 이동
		}
		
		return page;
	}
	
	//카카오 회원가입여부 체크(id값 찾기)
	public String joinKakaoCheck() {
		String member_id = (String)session.getAttribute("kakao_id");
		
		MemberVO member = dao.joinKakaoCheck(member_id);
		
		System.out.println("MemberService 카카오 id 검색" + member);
		
		String page = null;
		
		if(member == null) {
			page = "redirect:/member/joinForm"; // db에 저장된 id 없으면 회원가입 폼으로 이동
		}else {
			page = "redirect:/"; // db에 저장된 id가 있을 때 홈으로 이동
		}
		
		return page;
	}
	
	//일반회원 마이페이지 --> 여기서 카카오, 일반 구분해서 검색해오기
	public MemberVO oneMember() {
		String kakao_id = (String)session.getAttribute("kakao_id");   // kakao_id
	    String member_id = (String)session.getAttribute("loginId");   // 일반회원가입
	    
	    MemberVO member = null;
	    
	    member = dao.oneMember(member_id);
	    
	    return member;
	}

	// 로그아웃
	public void logOut() {
		session.removeAttribute("loginId");
	}
}
