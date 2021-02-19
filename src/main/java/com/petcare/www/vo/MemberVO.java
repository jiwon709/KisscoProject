package com.petcare.www.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String originalfile;	// 오리지널 파일명
	private String savedfile;		// 저장파일명

}
