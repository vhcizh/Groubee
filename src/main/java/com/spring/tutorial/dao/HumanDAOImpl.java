package com.spring.tutorial.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

//인사관리
@Repository
public class HumanDAOImpl implements HumanDAO{
	
	@Autowired
	SqlSession sqlSession;

	//기본정보
	@Override
	public CommonDTO selecthuman(String id) {
		System.out.println("dao -> 기본정보");
		
		CommonDTO dto  = sqlSession.selectOne("com.spring.tutorial.dao.HumanDAO.selecthuman", id);
		
		return dto;
		
	}

	//인사평가
	@Override
	public PersonnelDTO assessment(String id) {
		System.out.println("dao -> 인사평가");
		
		PersonnelDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.HumanDAO.assessment", id);
		
		return dto;
	}

	//직무 & 담당
	@Override
	public TeamDTO jobsfao(String id) {
		System.out.println("dao -> 직무 담당");
		TeamDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.HumanDAO.jobsfao", id);
		return dto;
	}

	//개인프로필
	@Override
	public CommonDTO myHuman(String id) {
		System.out.println(" dao -> 개인프로필");
		
		CommonDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.HumanDAO.myHuman", id);
		
		return dto;
	}
	

	@Override //사업부
	public List<DepartDTO> b_depart() {
		System.out.println("dao -> 사업부");
		List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.b_depart");
		return list;
	}
	//사업1팀
	@Override
	public List<TeamDTO> b_oneteam() {
		System.out.println("dao -> 사업1팀");
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.b_oneteam");
		return list;
	}
	//사업2팀
	@Override
	public List<TeamDTO> b_twoteam() {
		System.out.println("dao -> 사업1팀");
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.b_twoteam");
		return list;
	}


	@Override //경영부
	public List<DepartDTO> j_depart() {
		System.out.println("dao -> 경영지원부");
		List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.j_depart");
		return list;
	}
	//경영1팀
	@Override
	public List<TeamDTO> j_oneteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.j_oneteam");
		return list;
	}
	//경영2팀
	@Override
	public List<TeamDTO> j_twoteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.j_twoteam");
		return list;
	}
	

	@Override //개발부
	public List<DepartDTO> i_depart() {
		System.out.println("dao -> 개발부");
		List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.i_depart");
		return list;
	}
	//개발1
	@Override
	public List<TeamDTO> i_oneteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.i_oneteam");
		return list;
	}
	//개발2
	@Override
	public List<TeamDTO> i_twoteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.i_twoteam");
		return list;
	}
	//개발3
	@Override
	public List<TeamDTO> i_threeteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.i_threeteam");
		return list;
	}
	

	@Override //영업부
	public List<DepartDTO> o_depart() {
		List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.o_depart");
		return list;
	}
	//영업1팀
	@Override
	public List<TeamDTO> o_oneteam() {
		List<TeamDTO> list =sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.o_oneteam");
		return list;
	}
	//영업2팀
	@Override
	public List<TeamDTO> o_twoteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.o_twoteam");
		return list;
	}

	
	@Override //인사부
	public List<DepartDTO> p_depart() {
		 List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.p_depart");
		return list;
	}
	//인사1부
	@Override
	public List<TeamDTO> p_oneteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.p_oneteam");
		return list;
	}
	//인사2부
	@Override
	public List<TeamDTO> p_twoteam() {
		 List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.p_twoteam");
		return list;
	}
	//인사3부
	@Override
	public List<TeamDTO> p_threeteam() {
		List<TeamDTO> list =sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.p_threeteam");
		return list;
	}

	@Override //총무부
	public List<DepartDTO> c_depart() {
		List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.c_depart");
		return list;
	}
	//총무1팀
	@Override
	public List<TeamDTO> c_oneteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.c_oneteam");
		return list;
	}
	//총무2팀
	@Override
	public List<TeamDTO> c_twoteam() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.c_twoteam");
		return list;
	}

	//개인정보 수정
	@Override
	public void memberUpdate(CommonDTO dto) {
		System.out.println("dao -> 개인정보 수정");
		
		sqlSession.update("com.spring.tutorial.dao.HumanDAO.memberUpdate", dto);
		
	}

	//전체인사정보 
	@Override
	public List<CommonDTO> usersInfo() {
		System.out.println("dao -> 전체인사정보 ");
		
		List<CommonDTO> list = sqlSession.selectList("com.spring.tutorial.dao.HumanDAO.usersInfo");
		
		return list;
	}



}
