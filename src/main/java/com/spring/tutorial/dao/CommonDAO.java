package com.spring.tutorial.dao;

import java.util.Map;

import com.spring.tutorial.dto.CommonDTO;

public interface CommonDAO {
	// password 확인
	public String passwordCheck(String id);
	
	// 사원 등록 처리
	public int insertMember(CommonDTO dto);
	
	// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	public void sendEmail(String email, String key);
	
	// 사원 정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);
	
	// 퇴사 처리
	public int deleteMember(String id);
	
	// 사원 상세 페이지
	public CommonDTO getMemberDetail(String id);
	
	// 사원 수정 처리
	public int updateMember(CommonDTO dto);
	
	// 시큐리티 : 로그인 전 이메일 인증을 해야 하며, 1로 수정
	// 시큐리티
	public int selectKey(String key);
	   
	// 시큐리티
	public int updateGrade(String key);
	
	//사원정
}
