package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.CommonDTO;

public interface SecurityDAO {

	public List<CommonDTO> adminAddList(Map<String, Object> map);
	
	public int adminAddListCnt();
	
	public int selectAdmin(String id);
	
	public void updateAdmin(Map<String, Object> map);
	
	public void insertAdmin(Map<String, Object> map);
	
	public List<CommonDTO> securityAdminList();
	
	public void adSecurityDel(String id);
	
}
