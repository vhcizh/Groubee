package com.spring.tutorial.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.SecurityDAOImpl;
import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.page.Paging;

@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	SecurityDAOImpl dao;

	@Override
	public void adminAddAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("디버깅 SecurityServiceImpl -> adminAddAction");

		String pageNum = req.getParameter("pageNum");

		// 페이지 인스턴스 생성
		Paging paging = new Paging(pageNum);

		int total = dao.adminAddListCnt();

		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		List<CommonDTO> list = null;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);

		if (total > 0) {
			list = dao.adminAddList(map);
		}

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 관리자 권한 부여
	@Override
	public void adSecurityInsert(HttpServletRequest req, Model model) throws ServletException, IOException {

		System.out.println("디버깅 SecurityServiceImpl -> adSecuretyInsert");

		String[] id = req.getParameterValues("chk_secure");
		String[] administrator = req.getParameterValues("administrator");

		List<String> administrator_selected = new ArrayList<>();

		if(id !=null) {
		
			for (int i = 0; i < administrator.length; i++) {
				if (!administrator[i].equals("선택")) {
	
					administrator_selected.add(administrator[i]);
				}
			}
			System.out.println("administrator_selected :" + administrator_selected);
			System.out.println("chkid :" + id);
	
			int selectCnt = 0;
	
			for (int i = 0; i < id.length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
	
				map.put("id", id[i]);
				map.put("authority", administrator_selected.get(i));
	
				System.out.println("map : " + map);
	
				selectCnt = dao.selectAdmin(id[i]);
	
				System.out.println("selectCnt : " + selectCnt);
	
				if (selectCnt > 0) {
					dao.updateAdmin(map); // update
				} else {
					dao.insertAdmin(map); // insert
				}
			}
		}
	}

	// 권한 받은 관리자 리스트
	@Override
	public void securityAdminListAc(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("디버깅 SecurityServiceImpl -> securityAdminListAc");

		List<CommonDTO> list = dao.securityAdminList();
		
		model.addAttribute("list", list);

	}

	// 관리자 권한 삭제
	@Override
	public void adSecurityDelAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("디버깅 SecurityServiceImpl -> adSecurityDelAction");

		String[] delId = req.getParameterValues("chk_secureDel");

		System.out.println("id : " + delId);

		if (delId != null) {
			for (int i = 0; i < delId.length; i++) {

				dao.adSecurityDel(delId[i]);
			}
		} else {
			System.out.println("삭제불가");
		}
	}

	 @Override 
	 public void adminAuthorityAction(HttpServletRequest req, Model model) 
			 throws ServletException, IOException {
		 System.out.println("디버깅 SecurityServiceImpl -> adminAuthorityAction");
		 
		 List<CommonDTO> list = dao.securityAdminList();
		 
		 model.addAttribute("list", list);
	 }
}
