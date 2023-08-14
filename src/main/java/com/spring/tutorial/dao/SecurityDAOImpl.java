package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.CommonDTO;

@Repository
public class SecurityDAOImpl implements SecurityDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CommonDTO> adminAddList(Map<String, Object> map) {
		System.out.println("디버깅 SecurityDAOImpl => adminAddList");
		
		List<CommonDTO> list =sqlSession.selectList("com.spring.tutorial.dao.SecurityDAO.adminAddList", map);
		
		return list;
	}

	@Override
	public int adminAddListCnt() {
		System.out.println("디버깅 SecurityDAOImpl => adminAddListCnt");
		
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.SecurityDAO.adminAddListCnt");
		
		return selectCnt;
	}

	@Override
	public int selectAdmin(String id) {
		System.out.println("디버깅 SecurityDAOImpl => selectAdmin");
		
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.SecurityDAO.selectAdmin", id);
		
		return selectCnt;
	}

	@Override
	public void updateAdmin(Map<String, Object> map) {
		
		System.out.println("디버깅 SecurityDAOImpl => updateAdmin");
		
		sqlSession.update("com.spring.tutorial.dao.SecurityDAO.updateAdmin", map);
		
	}
	
	@Override
	public void insertAdmin(Map<String, Object> map) {
		System.out.println("디버깅 SecurityDAOImpl => insertAdmin");
		
		sqlSession.insert("com.spring.tutorial.dao.SecurityDAO.insertAdmin", map);
	}

	@Override
	public List<CommonDTO> securityAdminList() {
		System.out.println("디버깅 SecurityDAOImpl => securityAdminList");
		
		List<CommonDTO> list = sqlSession.selectList("com.spring.tutorial.dao.SecurityDAO.securityAdminList");
		
		return list;
	}

	@Override
	public void adSecurityDel(String id) {
		
		sqlSession.update("com.spring.tutorial.dao.SecurityDAO.adSecurityDel", id);
		
	}
	
}
