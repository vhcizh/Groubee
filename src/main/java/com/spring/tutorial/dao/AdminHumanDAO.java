package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

//관리자 인사관리dao
public interface AdminHumanDAO {
	
	//인사관리 
	public List<CommonDTO> membersInfo();
	
	//개인정보 상세페이지
	public CommonDTO usersDetail(String id);
	
	//개인정보 수정
	public int usersUpdate(CommonDTO dto);
	
	//개인정보 삭제
	public int usersDelete(String id);
	
	//전체부서
	public List<DepartDTO> departsInfo();
	
	//부서 생성
	public int deaprtInsert(DepartDTO dto);
	
	//팀 생성
	public int teamInsert(TeamDTO dto);
	
	//팀 배정
	public int humanUpdate(TeamDTO dto);
	
	//팀배정 member
	public void ht_update(Map<String, Object> map);
	
	//부서삭제
	public int departUpdate(String depart_name);
	
	public List<TeamDTO> teamSelectbyDepart(); 
	
	//인사평가
	public int insertandupdate(Map<String, Object> map);
	
	//public int humanInsertaa(PersonnelDTO dto);
	

}
