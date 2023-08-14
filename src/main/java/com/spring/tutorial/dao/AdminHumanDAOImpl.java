package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

@Repository
public class AdminHumanDAOImpl implements AdminHumanDAO{
	
	@Autowired
	SqlSession sqlSession;

	//관리자 전체인사정보
	@Override
	public List<CommonDTO> membersInfo() {
		System.out.println("관리자 dao -> membersInfo");
		
		List<CommonDTO> list =sqlSession.selectList("com.spring.tutorial.dao.AdminHumanDAO.membersInfo" );
		
		return list;
	}

	//개인정보 상세페이지
	@Override
	public CommonDTO usersDetail(String id) {
		System.out.println("관리자dao -> 개인정보 수정");
		
		CommonDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.AdminHumanDAO.usersDetail",id);
		
		return dto;
	}

	//개인정보 수정페이지
	@Override
	public int usersUpdate(CommonDTO dto) {
		int updateCnt =  sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.usersUpdate", dto);
		return updateCnt;
		
	}

	//개인정보 삭제
	@Override
	public int usersDelete(String id) {
		System.out.println("관리자dao ->  개인정보 삭제");
		
	  int deleteCnt = sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.usersDelete",id);
	  return deleteCnt;
	}

	//전체부서명 
	@Override
	public List<DepartDTO> departsInfo() {
		System.out.println("관리자dao -> 전체부서명");
		
		 List<DepartDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AdminHumanDAO.departsInfo");
		return list;
	}

	//부서 삭제
	@Override
	public int departUpdate(String depart_name) {
		System.out.println("관리자dao -> 부서삭제");
		
	   int d_deleteCnt = sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.departUpdate", depart_name);
	   return d_deleteCnt;
	}

	//부서가입 처리
	@Override
	public int deaprtInsert(DepartDTO dto) {
		System.out.println("관리자 dao -> 부서가입처리");
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AdminHumanDAO.deaprtInsert", dto);
		return insertCnt;
	}

	//팀 생성
	@Override
	public int teamInsert(TeamDTO dto) {
		System.out.println("관리자 dao -> 팀 생성");
		
		int t_insertCnt = sqlSession.insert("com.spring.tutorial.dao.AdminHumanDAO.teamInsert", dto);
		return t_insertCnt;
	}

	//팀 배정
	@Override
	public int humanUpdate(TeamDTO dto) {
		System.out.println("관리자dao -> 팀 배정");
		
		int h_updateCnt = sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.humanUpdate", dto);
		return h_updateCnt;
	}
	
	//팀 배정 member
	@Override
	public void ht_update(Map<String, Object> map) {
		System.out.println("관리자dao -> 팀 배정 멤버");
		sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.ht_update", map);
	}
	//부서별 팀 
	@Override
	public List<TeamDTO> teamSelectbyDepart() {
		List<TeamDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AdminHumanDAO.teamSelectbyDepart");
		return list;
	}

//	@Override
//	public int humanInsertaa(PersonnelDTO dto) {
//		System.out.println("관리자dao -> 인사평가");
//			int a_insertCnt = sqlSession.insert("com.spring.tutorial.dao.AdminHumanDAO.humanInsertaa", dto);
//		return a_insertCnt;
//	}
	
	public int insertandupdate(Map<String, Object> map) {
		System.out.println("관리자 dao -> insertandupdate");
		int a_selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AdminHumanDAO.a_select", map);
			System.out.println(a_selectCnt);
		  if(a_selectCnt == 0 ) {
			  sqlSession.insert("com.spring.tutorial.dao.AdminHumanDAO.a_insert", map); 
		  	
		} else{
			 sqlSession.update("com.spring.tutorial.dao.AdminHumanDAO.a_update",map); 
			 }
			 
		return a_selectCnt;
		  }

	


}
