package com.petcare.www.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.petcare.www.vo.MemberVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.petcare.www.kakao.kakao_restapi;
import com.petcare.www.service.MemberService;
import com.petcare.www.util.FileService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	private String uploadPath = "/boardfile"; // 파일저장을 위한 변수 
	
	// 로그인 페이지로 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String joinPick() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value="/login2", method=RequestMethod.POST)
	public String login2(MemberVO member) {
		
		String page = service.getMember(member);
		
		return page;
	}
	
	// 회원가입 폼으로 이동
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 회원가입 , 사진업로드
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberVO member, MultipartFile upload) {
		
		System.out.println("회원가입 넘어오는 값 체크: " + member);
		
		// 파일추가
		if(!upload.isEmpty()) {
	         //파일을 저장
	         String savedfile = FileService.saveFile(upload, uploadPath);
	         member.setSavedfile(savedfile); // 물리적 저장파일명
	         member.setOriginalfile(upload.getOriginalFilename()); 
	      }
		
		// 회원가입 후 마이페이지 이동
		String page = service.joinMember(member);
		
		return page;
	}
	
	// 마이페이지 이동
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(Model model, HttpSession session) throws Exception {
		MemberVO member = service.oneMember();
		model.addAttribute("memberInfo", member);

		return "member/mypage";
	}
	
	// 저장된 이미지 보여주기 위한 다운로드 로직
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public String fileDownload(HttpServletResponse response) {
		
		MemberVO member = service.oneMember(); // 이미지 다운위한 정보 받아오기
		
		String originalfile = new String(member.getOriginalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 저장된 파일경로 : 전체경로
		
		String fullPath = uploadPath + "/" + member.getSavedfile();
		System.out.println("MemberController : 이미지 다운로드 경로" + fullPath);
		
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			filein.close();
			fileout.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 일반 로그아웃
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut() {
		service.logOut();
		System.out.println("로그아웃");
		return "redirect:/"; // 홈으로 이동
	}
	
	// 카카오 로그아웃 --> 현재 토큰만 반환, 카카오 자체 로그아웃은 아님
	@RequestMapping(value="/kakaoLogOut", produces="application/json")
	public String kakaoLogOut(HttpSession session) {
	  session.removeAttribute("kakao_id");
      //kakao restapi 객체 선언
      kakao_restapi kr = new kakao_restapi();
      //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
      JsonNode node = kr.Logout(session.getAttribute("token").toString());
      //결과 값 출력
      System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
      
      return "redirect:/";
	}
	
}
