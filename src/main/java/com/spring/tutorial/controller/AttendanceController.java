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

import com.spring.tutorial.service.AttendanceServiceImpl;
import com.spring.tutorial.service.HumanServiceImpl;


@Controller
public class AttendanceController {

	@Autowired
	AttendanceServiceImpl service;
	
	@Autowired
	HumanServiceImpl service_h;
	
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	// 나의 근태 현황 (일일 근태)
	@RequestMapping("attendance.at")
	public String attendance(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("controller > attendance.at");		
		service.attendance(req, model);
		
		return "attendance/attendance";
	}
	
	
	// 업무 시작
	@RequestMapping("attendin.at")
	public void attendin(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("controller > attendin.at");
		service.attendin(req, model);
		
		String viewPage = req.getContextPath() + "/attendance.at";
		res.sendRedirect(viewPage);		
	}
		
	
	// 업무 종료
	@RequestMapping("attendout.at")
	public void attendout(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("controller > attendout.at");
		service.attendout(req, model);

		String viewPage = req.getContextPath() + "/attendance.at";
		res.sendRedirect(viewPage);		
	}
	
	// 누적  근무 계산 > workweek.jsp > ajax > /attendance.at
	@RequestMapping("worktime.at")
	public String worktime(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("controller > worktime.at");
		service.worktime(req, model);

		return "attendance/workweek"; // 누적 근무 시간만 표기할  페이지 
	}		
	
	// 나의 근무 조회 (주간 근태)
	@RequestMapping("attendanceWeek.at")
	public String attendanceWeek(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > attendanceWeek.at");
		service.attendanceWeek(req, model); // 주간 근무 확인
		service.attendance(req, model);	// SubMenu 시간 근태 출력용				
		
		return "attendance/attendanceWeek";
	}
	
	// 월 근태 현황
	@RequestMapping("attendanceMonth.at")
	public String attendanceMonth(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > attendanceMonth.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.attendanceMonth(req, model);
		
		return "attendance/attendanceMonth";
	}
	
	// 나의 연차 내역
	@RequestMapping("attendanceRestInfo.at")
	public String attendanceRestInfo(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > attendanceRestInfo.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.attendanceRestInfo(req, model); // 나의 연차 내역
		
		return "attendance/attendanceRestInfo";
	}	

	// 연장 근무 신청
	@RequestMapping("request_over.at")
	public String request_over(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("controller > request_over.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용		
		service_h.memberInfo(req, model); // 기본정보
		
		return "attendance/request_over";
	}
	
	// 연장 근무 신청 처리
	@RequestMapping("request_over_action.at")
	public void request_over_action(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("controller > request_over_action.at");
		
		service.request_over(req, model); // 연장 근무 신청
		String viewPage = req.getContextPath() + "/attendance.at";
		res.sendRedirect(viewPage);
	}
	
	// 연차 반차 신청
	@RequestMapping("request_rest.at")
	public String request_rest(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > request_rest.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.attendanceRestInfo(req, model); // 나의 연차 내역
		service_h.memberInfo(req, model); // 기본정보		
		
		return "attendance/request_rest";
	}
	
	// 연차 반차 신청 처리
	@RequestMapping("request_rest_action.at")
	public void request_rest_action(HttpServletRequest req, HttpServletResponse res,  Model model)
			throws ServletException, IOException {
		logger.info("controller > request_rest_action.at");		
		service.request_rest(req, model); // 연차 반차 신청
		
		String viewPage = req.getContextPath() + "/attendanceRestInfo.at";
		res.sendRedirect(viewPage);		
	}
	
	// 부서 근태 현황
	@RequestMapping("departWeek.at")
	public String departWeek(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > departWeek.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service_h.memberInfo(req, model); // 기본정보
		service.attendDepart(req, model);
		
		return "attendance/departWeek";
	}
	
	// 부서 근태 통계
	@RequestMapping("departMonth.at")
	public String departMonth(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > departMonth.at");
		service.attendance(req, model); // SubMenu 시간 근태 출력용		
		service.attendDepart(req, model);
		
		return "attendance/departMonth";
	}
	// 부서 연차 현황
	@RequestMapping("departRestWeek.at")
	public String departRestWeek(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > departRestWeek.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.annualDepart(req, model);
		
		return "attendance/departRestWeek";
	}
	
	// 부서 연차 통계
	@RequestMapping("departRestMonth.at")
	public String departRestMonth(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > departRestMonth.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.annualDepart(req, model);
		
		return "attendance/departRestMonth";
	}	
	
	// 전사 근태 현황
	@RequestMapping("grbWeek.at")
	public String grbWeek(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > grbWeek.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.attendGrb(req, model);
		
		return "attendance/grbWeek";
	}
	
	// 전사 근태 통계
	@RequestMapping("grbMonth.at")
	public String grbMonth(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > grbMonth.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.attendGrb(req, model);
		
		return "attendance/grbMonth";
	}
	
	// 전사 연차 현황
	@RequestMapping("grbRestWeek.at")
	public String grbRestWeek(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > grbRestWeek.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.annualGrb(req, model);
		
		return "attendance/grbRestWeek";
	}
	
	// 전사 연차 사용
	@RequestMapping("grbRestMonth.at")
	public String grbRestMonth(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("controller > grbRestMonth.at");
		service.attendance(req, model);	// SubMenu 시간 근태 출력용
		service.annualGrb(req, model);
		
		return "attendance/grbRestMonth";
	}	
}
