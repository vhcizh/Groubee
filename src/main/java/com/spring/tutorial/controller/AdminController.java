package com.spring.tutorial.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.tutorial.dao.BoardDAOImpl;
import com.spring.tutorial.dto.BoardDTO;
import com.spring.tutorial.service.AdminHumanServiceImpl;
import com.spring.tutorial.service.AdminMessageServiceImpl;
import com.spring.tutorial.service.AttendanceServiceImpl;
import com.spring.tutorial.service.BoardServiceImpl;
import com.spring.tutorial.service.SecurityServiceImpl;



@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	

	  @Autowired 
	  AdminHumanServiceImpl service;
	  
	  @Autowired
	  SecurityServiceImpl securityService;
	  
	  @Autowired
	  BoardServiceImpl service_b;

	  @Autowired 
	  AttendanceServiceImpl service_at;
	
	  @Autowired
	  AdminMessageServiceImpl serviceMe;
	  
	  @Autowired
	  BoardDAOImpl dao_b;
	
	  // 메인
	  @RequestMapping("adminMain.ad")
	  public String approvallist(HttpServletRequest req, Model model) 
			  throws ServletException, IOException{
		  logger.info("AdminController -> adminMain.ad");
		  service_at.companyInfo(req, model);
		  service_at.attendGrb(req, model);
		  service_at.annualGrb(req, model);

		  return "admin/index";
	  }
	
	// 전사 근태 내역 및 통계
	  @RequestMapping("adAttend.ad")
	  public String adAttend(HttpServletRequest req, Model model) 
			  throws ServletException, IOException{
		  logger.info("AdminController -> adAttend.ad");
		  service_at.attendGrb(req, model);

		  return "admin/adAttend/adAttend";
	  }

	  // 전사 연차 내역 및 통계
	  @RequestMapping("adAttend2.ad")
	  public String adAttend2(HttpServletRequest req, Model model) 
			  throws ServletException, IOException{
		  logger.info("AdminController -> adAttend2.ad");
		  service_at.annualGrb(req, model);

		  return "admin/adAttend/adAttend2";
	  }

	  // 사내 근무 내규
	  @RequestMapping("adAttend3.ad")
	  public String adAttend3(HttpServletRequest req, Model model) 
			  throws ServletException, IOException{
		  logger.info("AdminController -> adAttend3.ad");
		  service_at.companyInfo(req, model);		

		  return "admin/adAttend/adAttend3";
	  }

	  @RequestMapping("adAttend3_action.ad")
	  public void adAttend3(HttpServletRequest req, HttpServletResponse res, Model model) 
			  throws ServletException, IOException{
		  logger.info("AdminController -> adAttend3.ad");

		  service_at.companyAttend(req, model);

		  String viewPage = req.getContextPath() + "/adAttend3.ad";
		  res.sendRedirect(viewPage);	
	  }
	
		
		//부서미지정
		@RequestMapping("adDepart.ad")
		public String adDepart(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> adminMain.ap");
			
			service.departsAction(req, model);
			return "admin/adDepart/adDepart";
		}
		
		
		//부서설계
		@RequestMapping("departInfo.ad")
		public String adDepart2(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> departInfo.ad");
			service.departsAction(req, model);
			return "admin/adDepart/departInfo";
		}
		
		//부서 생성
		@RequestMapping("departInsert.ad")
		public String departInsert(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("url-> departInsert.ad");
			service.departInsertAction(req, model);
			return "admin/adDepart/departInsert";
			
		}
		
		//팀 생성
		@RequestMapping("teamInsert.ad")
		public String teamInsert(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			
			service.teamInsertAction(req, model);
			return "admin/adDepart/teamInsert";
		}
		
		//팀 생성
		@RequestMapping("human_team.ad")
		public String human_team(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			
			service.teamUpdateAction(req, model);
			return "admin/adDepart/human_team";
		}
		

		//부서 삭제
		@RequestMapping("departDelete.ad")
		public void departDelete(HttpServletRequest req, HttpServletResponse res ,Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> departDelete.ad");
			
			service.departUpdateAction(req, res, model);
			String viewPage = req.getContextPath() + "/adDepart.ad";
			res.sendRedirect(viewPage);
		}
		
		//인사관리-사원통합
		@RequestMapping("adHr.ad")
		public String adHr(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> adHr.ap");
			
			service.memberInfoAction(req, model);
			return "admin/adHr/adHr";
		}
		

		//인사관리-인사평가
		@RequestMapping("adHr2.ad")
		public String adHr2(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> adHr2.ap");
			
			service.memberInfoAction(req, model);
			return "admin/adHr/adHr2";
		}
		
		//인사관리-인사평가
		@RequestMapping("appupdate.ad")
		public String appupdate(HttpServletRequest req, HttpServletResponse res ,Model model) 
				throws ServletException, IOException{
			logger.info("AdminController -> appupdate.ap");
			
			service.humanAppraisalAction(req, model);
			return "admin/adHr/appupdate";
		}
		
		
		
		//인사 개인정보 상세페이지
		@RequestMapping("joinDetail.ad")
		public String joinDetail(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("url -> joinDetail.ad");
			
			service.usersDetailAction(req, model);
					
			return "admin/adHr/joinDetail";
		}
		
		//인사 개인정보 수정
		@RequestMapping("joinUpdate.ad")
		public String joinUpdate(HttpServletRequest req ,Model model) 
				throws ServletException, IOException{
			logger.info("url -> joinUpdate.ad");
			
			service.usersUpdateAction(req ,model);
			return "admin/adHr/joinUpdate";
		}
		
		//인사관리 - 개인정보 삭제
		@RequestMapping("joinDelete.ad")
		public void joinDelete(HttpServletRequest req, HttpServletResponse res ,Model model) 
				throws ServletException, IOException{
			logger.info("url-> joinDelete");
			
			service.usersDeleteAction(req, res, model);
			String viewPage = req.getContextPath() + "/adHr.ad";
			res.sendRedirect(viewPage);
		}
		
	
//	//보안관리-관리자기능설정
//		@RequestMapping("adSecure.ad")
//		public String adSecure(HttpServletRequest req, Model model) 
//				throws ServletException, IOException{
//			
//			logger.info("AdminController -> adSecure.ap");
//			
//			securityService.securityAdminListAc(req, model);
//			
//			return "admin/adSecure/adSecure";
//		}
//		
//		//보안관리-기능접근제한
//		@RequestMapping("adSecure2.ad")
//		public String adSecure2(HttpServletRequest req, Model model) 
//				throws ServletException, IOException{
//			
//			logger.info("AdminController -> adSecure2.ap");
//			
//			return "admin/adSecure/adSecure2";
//		}
//		
//		//보안관리-관리자 추가를 위한 사원리스트
//		@RequestMapping("adminAdd.ad")
//		public String adminAdd(HttpServletRequest req, Model model) 
//				throws ServletException, IOException{
//			
//			logger.info("AdminController -> adminAdd.ap");
//			
//			securityService.adminAddAction(req, model);
//
//			return "admin/adSecure/adminAdd";
//		}
//		
//		//보안관리 - 관리자 추가
//		@RequestMapping("adminAdd2.ad")
//		public String adminAdd2(HttpServletRequest req, Model model) 
//				throws ServletException, IOException{
//			logger.info("AdminController -> adminAdd2.ap");
//			
//			securityService.adSecurityInsert(req, model);
//			
//			return "admin/adSecure/adSecure";
//		}
//		
//		//보안관리 - 관리자 삭제
//		@RequestMapping("admin_del.ad")
//		public void admin_del(HttpServletRequest req, HttpServletResponse res, Model model)
//			throws ServletException, IOException{
//			
//			logger.info("AdminController -> admin_del.ap");
//			
//			securityService.adSecurityDelAction(req, model);
//			
//	      String viewPage = req.getContextPath() + "/adSecure.ad";
//	      res.sendRedirect(viewPage);
//		}
//	
	//권한받은 관리자 리스트
	@RequestMapping("adSecure.ad")
	public String adSecure(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		
		logger.info("AdminController -> adSecure.ap");
		
		securityService.securityAdminListAc(req, model);
		
		return "admin/adSecure/adSecure";
	}
	
	//보안관리-기능접근제한
	@RequestMapping("adSecure2.ad")
	public String adSecure2(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		
		logger.info("AdminController -> adSecure2.ap");
		
		return "admin/adSecure/adSecure2";
	}
	
	//보안관리-관리자 추가를 위한 사원리스트
	@RequestMapping("adminAdd.ad")
	public String adminAdd(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		
		logger.info("AdminController -> adminAdd.ap");
		
		securityService.adminAddAction(req, model);

		return "admin/adSecure/adminAdd";
	}
	
	//보안관리 - 관리자 추가
	@RequestMapping("adminAdd2.ad")
	public void adminAdd2(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adminAdd2.ap");
		
		securityService.adSecurityInsert(req, model);
		  String viewPage = req.getContextPath() + "/adSecure.ad";
	      res.sendRedirect(viewPage);
	}
	
	//보안관리 - 관리자 삭제
	@RequestMapping("admin_del.ad")
	public void admin_del(HttpServletRequest req, HttpServletResponse res, Model model)
		throws ServletException, IOException{
		
		logger.info("AdminController -> admin_del.ap");
		
		securityService.adSecurityDelAction(req, model);
		
      String viewPage = req.getContextPath() + "/adSecure.ad";
      res.sendRedirect(viewPage);
	}
	
	//보안관리-관리자 추가를 위한 사원리스트
	@RequestMapping("adminAuthority.ad")
	public String adminAuthority(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		
		logger.info("AdminController -> adminAuthority.ap");
		
		//securityService.adminAuthorityAction(req, model);

		return "admin/adService/adminMenu";
	}
	
	//서비스관리-메뉴운영권한
	@RequestMapping("adService.ad")
	public String adService(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adService.ap");
		return "admin/adService/adService";
	}
	
	
	//서비스관리-서비스메뉴관리
	@RequestMapping("adService2.ad")
	public String adService2(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adService2.ap");
		return "admin/adService/adService2";
	}
	
	
	//서비스관리-팝업공지
	@RequestMapping("adService3.ad")
	public String adService3(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adService3.ap");
		return "admin/adService/adService3";
	}
	
	// 게시판 관리 - 목록 --------------------------------------------------------
	@RequestMapping("adBoard.ad")
	public String adBoard(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adBoard");
		
		service_b.boardList(req, model);
		
		return "admin/adBoard/board";
	}
	
	// 게시판 상세페이지
	@RequestMapping("adBoard/detail.ad")
	public String adBoard_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> adBoard_detail");
		
		service_b.detail(req, model);
		
		return "admin/adBoard/detail";
	}
	
	// 게시판 삭제처리 (숨기기)
	@RequestMapping("adBoard/updateShow.ad")
	public void adBoard_updateShow(HttpServletRequest req, HttpServletResponse res,  Model model)
			throws ServletException, IOException {
		logger.info("[url => /adBoard/updateShow.ad]");
		service_b.boardDelete(req, model);
		
		String viewPage = req.getContextPath() + "/adBoard.ad";
        res.sendRedirect(viewPage);
	}
	
	// 게시판 영구 삭제
	@RequestMapping("adBoard/delete.ad")
	public void adBoard_delete(HttpServletRequest req, HttpServletResponse res,  Model model)
			throws ServletException, IOException {
		logger.info("[url => /adBoard/delete.ad]");
		service_b.boardDelete2(req, model);
		
		String viewPage = req.getContextPath() + "/adBoard.ad";
        res.sendRedirect(viewPage);
	}
	
	// 게시글 쓰기 화면
	@RequestMapping("adBoard/insert.ad")
	public String board_insert(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("url => insert.bo");
		
		return "admin/adBoard/insert";
	}
	
	// 게시글 쓰기 처리
	@RequestMapping("adBoard/insertAction.ad")
	public void board_insertAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("url => insertAction.bo");
		
		service_b.insertAction(req, model);
		
		String viewPage = req.getContextPath() + "/adBoard.ad";
        res.sendRedirect(viewPage);
	}
	
	// 수정페이지
	@RequestMapping("adBoard/boardEdit.ad")
	public String board_edit(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("url => edit.bo");
		
		int num = Integer.parseInt(req.getParameter("num"));

		BoardDTO dto = dao_b.boardDetail(num);
		
		req.setAttribute("dto", dto);
		
		return "admin/adBoard/edit";
	}
	
	// 게시판 수정 처리
	@RequestMapping("adBoard/boardEditAction.ad")
	public void board_updateAction(HttpServletRequest req,HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("[url => /boardEditAction.bo]");
		
		service_b.boardUpdateAction(req, model);
		
        String viewPage = req.getContextPath() + "/adBoard.ad";
        res.sendRedirect(viewPage);
	}
	
	// 사원 통합 메세지 관리함 - 초기화면
	@RequestMapping("adMessage.ad")
	public String adMessage(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminMessageController -> adMessage.ad");
		
		serviceMe.everyMsgListAction(req, model);
		
		return "admin/adMessage/adMessage";
	}
	
	// 메세지 세부내용 보기
	@RequestMapping("adminMsgDetail.ad")
	public String adminMsgDetail(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminMessageController -> adminMsgDetail.ad");
		
		serviceMe.adminMsgDetailAction(req, model);
		
		return "admin/adMessage/adminMsgDetail";
	}
	
	

}
