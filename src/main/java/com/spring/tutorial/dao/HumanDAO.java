package com.spring.tutorial.dao;

import java.util.List;

import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

//인사관리
public interface HumanDAO {
	
	
	//기본정보
	public CommonDTO selecthuman(String id);
	
	//조직도 사업부
	public List<DepartDTO> b_depart(); 
	
	//조직도 사업1팀 
	public List<TeamDTO> b_oneteam();
	
	//조직도 사업2팀 
	public List<TeamDTO> b_twoteam();
	
	//조직도 경영부
	public List<DepartDTO> j_depart(); 
	
	//조직도 격영1팀 
	public List<TeamDTO> j_oneteam();
	
	//조직도격영2팀 
	public List<TeamDTO> j_twoteam();
	
	//조직도 개발부
	public List<DepartDTO> i_depart(); 
	
	//조직도 개발1팀 
	public List<TeamDTO> i_oneteam();
	
	//조직도 개발2팀 
	public List<TeamDTO> i_twoteam();
	
	//조직도 개발3팀 
	public List<TeamDTO> i_threeteam();
	
	//조직도 영업부
	public List<DepartDTO> o_depart(); 
	
	//조직도 영업1팀 
	public List<TeamDTO> o_oneteam();
	
	//조직도 영업2팀 
	public List<TeamDTO> o_twoteam();
	
	//조직도 인사부
	public List<DepartDTO> p_depart(); 
	
	//조직도 영업1팀 
	public List<TeamDTO> p_oneteam();
	
	//조직도 영업2팀 
	public List<TeamDTO> p_twoteam();
	
	//조직도 개발3팀 
	public List<TeamDTO> p_threeteam();
	
	//조직도 총무부
	public List<DepartDTO> c_depart(); 
	
	//조직도 총무1팀 
	public List<TeamDTO> c_oneteam();
	
	//조직도 총무2팀 
	public List<TeamDTO> c_twoteam();
	
	//인사평가
	public PersonnelDTO assessment(String id);
	
	//직무&담당
	public TeamDTO jobsfao(String id);
	
	//개인프로필
	public CommonDTO myHuman(String id);
	
	//개인정보 수정
	public void memberUpdate(CommonDTO dto);
	
	//전체인사정보 
	public List<CommonDTO> usersInfo();
	
	

}
