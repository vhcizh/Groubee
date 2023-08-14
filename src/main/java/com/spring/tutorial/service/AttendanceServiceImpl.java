package com.spring.tutorial.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.AttendanceDAO;
import com.spring.tutorial.dto.AnnualDTO;
import com.spring.tutorial.dto.AttendanceDTO;
import com.spring.tutorial.dto.CompanyDTO;


@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	AttendanceDAO dao;		

	// 나의 근태 현황 
	@Override
	public void attendance(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : attendance");
			String id = (String) req.getSession().getAttribute("memberID");
			if(id != null) {	
			List<AttendanceDTO> list = dao.attendance(id);
			int cnt = dao.over_cnt(id); // 일일 연장 체크
			String attendout = dao.c_attendout();
			
			model.addAttribute("cnt", cnt);
			model.addAttribute("list", list);
			model.addAttribute("attendout", attendout);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 업무 시작
	@Override
	public void attendin(HttpServletRequest req, Model model) {
		System.out.println("service : attendin");
		String id = (String) req.getSession().getAttribute("memberID");
		int insertCnt = dao.attendin(id);
		
		model.addAttribute("insertCnt", insertCnt);
	}

	// 업무 종료
	@Override
	public void attendout(HttpServletRequest req, Model model) {
		try {
		System.out.println("service : attendout");
		String id = (String) req.getSession().getAttribute("memberID");
		
		if(req.getParameter("worktime") != null) { // worktime이 있으면
			String worktime = req.getParameter("worktime");
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);			
			map.put("worktime", worktime);			
			dao.updateworktime(map);
		} else {			
			dao.attendout(id);	
		}		
		
		} catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	// 주차별 누적 근무 1~7 / 8~15 / 16~21 / 22~31 구별
	@Override
	public void worktime(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : worktime");
			String id = (String) req.getSession().getAttribute("memberID");		
			int start = Integer.parseInt(req.getParameter("start"));	
			int end = Integer.parseInt(req.getParameter("end"));			
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);		
			map.put("start", start);
			map.put("end", end);
			int worktime;
			int overweek_cnt = dao.overweek_cnt(map); // 주 연장근무 카운트
			
			if(overweek_cnt == 0) { // 연장 근무 이력이 없으면
				worktime = dao.worktime(map); // 누적 근무시간 
			} else { // 연장 근무 이력이 있으면
				worktime = dao.workover(map); // 누적 + 연장 근무시간
			}
			int week_h = (int) (worktime / (60 * 60));
    	 	int week_m = (int) (worktime % (60 * 60)) / 60;
    	 	int week_s = (worktime % 60);
    	 	// 00:00:00으로 자릿수 맞춰주기
    	 	String weekh = String.valueOf(week_h);
    	 	String weekm = String.valueOf(week_m);
    	 	String weeks = String.valueOf(week_s);
    	 	if (week_h < 10) { weekh = "0" + String.valueOf(week_h); }
    	 	if (week_m < 10) { weekm = "0" + String.valueOf(week_m); }
    	 	if (week_s < 10) { weeks = "0" + String.valueOf(week_s); }
    	 	String workweek = weekh +":"+ weekm +":"+ weeks;     	 	 	
			model.addAttribute("workweek", workweek);
		
		} catch(Exception e) {
            e.printStackTrace();
        }
	}
	
	
	// 나의 근무 조회
	@Override
	public void attendanceWeek(HttpServletRequest req, Model model) {
		String selectweek = "";
		try {
			System.out.println("service : attendanceWeek");	
			String id = (String) req.getSession().getAttribute("memberID");
			String thismonth = (String) req.getSession().getAttribute("thismonth");			
			selectweek = req.getParameter("week"); 
			
			
			// start end가 null이 아닐 때 (주차별 날짜 기준)
			if(req.getParameter("start") != null && req.getParameter("end") != null) {
				int start = Integer.parseInt(req.getParameter("start"));	
				int end = Integer.parseInt(req.getParameter("end"));			
				
				
				Map<String,Object> map = new HashMap<>();
				map.put("id", id);
				map.put("month", thismonth);
				map.put("start", start);
				map.put("end", end);
				
				// 주간 근무 호출
				List<AttendanceDTO> week = dao.attendanceWeek(map);				
				
				int overweek_cnt = dao.overweek_cnt(map); // 주 연장근무 카운트
				int overmonth_cnt = dao.overmonth_cnt(map); // 월 연장근무 카운트
				
				int worktime = dao.worktime(map);
				int workover = 0;
				int overworkweek = 0;
				int overworkmonth = 0;
				
				if(overweek_cnt == 0) { // 연장 근무 이력이 없으면					
					workover = worktime;
				} else { // 연장 근무 이력이 있으면
					workover = dao.workover(map); // 누적 + 연장 근무시간
					overworkweek = dao.overtime(map); // 연장 근무 시간					
				}				
				
				int weekstandard = 187200; // 52시간 주간 근무 기준 초 단위
				int remaintime = weekstandard - worktime;
				double weekrate = Math.round(((double)workover / (double)weekstandard) * 100); // 누적
				double workrate = Math.round(((double)worktime / (double)weekstandard) * 100); // 기본
				double overrate = Math.round(((double)overworkweek / (double)weekstandard) * 100); // 연장
								
				// 주간 누적 시간 도식화 (근무+연장)
				int week_h = (int) (workover / (60 * 60));
	    	 	int week_m = (int) (workover % (60 * 60)) / 60;
	    	 	int week_s = (workover % 60);
	    	 	String weekh = String.valueOf(week_h);
	    	 	String weekm = String.valueOf(week_m);
	    	 	String weeks = String.valueOf(week_s);
	    	 	if (week_h < 10) { weekh = "0" + String.valueOf(week_h); }
	    	 	if (week_m < 10) { weekm = "0" + String.valueOf(week_m); }
	    	 	if (week_s < 10) { weeks = "0" + String.valueOf(week_s); }
	    	 	String weektotal = weekh +":"+ weekm +":"+ weeks;	   
	    	 	
	    	 	// 이번주 근무 시간 
	    	 	int work_h = (int) (worktime / (60 * 60));
	    	 	int work_m = (int) (worktime % (60 * 60)) / 60;
	    	 	int work_s = (worktime % 60);
	    	 	String workh = String.valueOf(week_h);
	    	 	String workm = String.valueOf(week_m);
	    	 	String works = String.valueOf(week_s);
	    	 	if (work_h < 10) { workh = "0" + String.valueOf(work_h); }
	    	 	if (work_m < 10) { workm = "0" + String.valueOf(work_m); }
	    	 	if (work_s < 10) { works = "0" + String.valueOf(work_s); }
	    	 	String workweek = workh +":"+ workm +":"+ works;
	    	 	
				// 주간 잔여 시간
	    	 	int remain_h = (int) (remaintime / (60 * 60));
	    	 	int remain_m = (int) (remaintime % (60 * 60)) / 60;
	    	 	int remain_s = (remaintime % 60);
	    	 	String remainh = String.valueOf(remain_h);
	    	 	String remainm = String.valueOf(remain_m);
	    	 	String remains = String.valueOf(remain_s);
	    	 	if (remain_h < 10) { remainh = "0" + String.valueOf(remain_h); }
	    	 	if (remain_m < 10) { remainm = "0" + String.valueOf(remain_m); }
	    	 	if (remain_s < 10) { remains = "0" + String.valueOf(remain_s); }
	    	 	String remainweek = remainh +":"+ remainm +":"+ remains;	    	 	
	    	 	
	    	 	// 이번주 연장 시간
	    	 	int over_h = (int) (overworkweek / (60 * 60));
	    	 	int over_m = (int) (overworkweek % (60 * 60)) / 60;
	    	 	int over_s = (overworkweek % 60);
	    	 	String overh = String.valueOf(over_h);
	    	 	String overm = String.valueOf(over_m);
	    	 	String overs = String.valueOf(over_s);
	    	 	if (over_h < 10) { overh = "0" + String.valueOf(over_h); }
	    	 	if (over_m < 10) { overm = "0" + String.valueOf(over_m); }
	    	 	if (over_s < 10) { overs = "0" + String.valueOf(over_s); }
	    	 	String overweek = overh +":"+ overm +":"+ overs;
	    	 	
	    	 	// 이번달 누적 시간
	    	 	int monthtime = dao.monthwork(map);
	    	 	int month_h = (int) (monthtime / (60 * 60));
	    	 	int month_m = (int) (monthtime % (60 * 60)) / 60;
	    	 	int month_s = (monthtime % 60);	    	 	
	    	 	String monthh = String.valueOf(month_h);
	    	 	String monthm = String.valueOf(month_m);
	    	 	String months = String.valueOf(month_s);
	    	 	if (month_h < 10) { monthh = "0" + String.valueOf(month_h); }
	    	 	if (month_m < 10) { monthm = "0" + String.valueOf(month_m); }
	    	 	if (month_s < 10) { months = "0" + String.valueOf(month_s); }
	    	 	String workmonth = monthh +":"+ monthm +":"+ months;
	    	 	
	    	 	// 이번달 연장 시간 
	    	 	if(overmonth_cnt != 0) { overworkmonth = dao.overmonth(map);}
	    	 	int overm_h = (int) (overworkmonth / (60 * 60));
	    	 	int overm_m = (int) (overworkmonth % (60 * 60)) / 60;
	    	 	int overm_s = (overworkmonth % 60);	    	 	
	    	 	String overmh = String.valueOf(overm_h);
	    	 	String overmm = String.valueOf(overm_m);
	    	 	String overms = String.valueOf(overm_s);
	    	 	if (overm_h < 10) { overmh = "0" + String.valueOf(overm_h); }
	    	 	if (overm_m < 10) { overmm = "0" + String.valueOf(overm_m); }
	    	 	if (overm_s < 10) { overms = "0" + String.valueOf(overm_s); }
	    	 	String overmonth = overmh +":"+ overmm +":"+ overms;
	    	 	
	    	 	model.addAttribute("weekrate", weekrate); // 이번주 누적근무 / 52시간
	    	 	model.addAttribute("workrate", workrate); // 이번주근무시간 / 52시간
	    	 	model.addAttribute("overrate", overrate); // 이번주 연장시간 / 52시간
	    	 	model.addAttribute("weektotal", weektotal); // 누적 근무 시간 (근무+연장)
	    	 	model.addAttribute("workweek", workweek); // 이번주 누적 시간
				model.addAttribute("remainweek", remainweek); // 이번주 잔여 시간
				model.addAttribute("overweek", overweek); // 이번주 연장 시간
				model.addAttribute("workmonth", workmonth); // 이번달 누적 시간
				model.addAttribute("overmonth", overmonth); // 이번달 연장 시간
				model.addAttribute("week", week); // 이번주 근무 조회 (근태 로그)				
			}
		} catch(Exception e) {
            e.printStackTrace();
        }
		model.addAttribute("selectweek", selectweek); // 1주차 2주차 3주차 4주차
	}

	// 월 근태 현황
	@Override
	public void attendanceMonth(HttpServletRequest req, Model model) {
		String selectmonth = "";
		
		try {
			System.out.println("service : attendanceMonth");	
			String id = (String) req.getSession().getAttribute("memberID");	
			String thismonth = (String) req.getSession().getAttribute("thismonth");	
			selectmonth = req.getParameter("month"); 			
			List<AttendanceDTO> month = new ArrayList<AttendanceDTO>();
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);
			if(selectmonth == null) {
				map.put("month", thismonth);
			} else {
				map.put("month", selectmonth);
			}
			
			int worktime = dao.monthwork(map);  // 월 근무 시간			
			int overtime = 0; // 월 연장 시간
			int overworkmonth = 0;
			int overmonth_cnt = 0; // 월 연장근무 카운트			
			
			month = dao.attendanceMonth(map);
			overmonth_cnt = dao.overmonth_cnt(map); 
			if(overmonth_cnt != 0) {
				overtime = dao.overmonth(map);	
			} 
			int monthtime = worktime + overtime; // 월 누적 시간
		 	int monthstandard = 187200 * 4; // 52시간 > 월 근무 기준 초 단위
		 	double monthrate = Math.round(((double)monthtime / (double)monthstandard) * 100); // 월 누적
		 	double workrate = Math.round(((double)worktime / (double)monthstandard) * 100); // 월 근무 
		 	
		 	// 이번달 누적 시간 > 도식화
		 	int month_h = (int) (monthtime / (60 * 60));
		 	int month_m = (int) (monthtime % (60 * 60)) / 60;
		 	int month_s = (monthtime % 60);
		 	String monthh = String.valueOf(month_h);
    	 	String monthm = String.valueOf(month_m);
    	 	String months = String.valueOf(month_s);
    	 	if (month_h < 10) { monthh = "0" + String.valueOf(month_h); }
    	 	if (month_m < 10) { monthm = "0" + String.valueOf(month_m); }
    	 	if (month_s < 10) { months = "0" + String.valueOf(month_s); }
		 	String workmonth = monthh +":"+ monthm +":"+ months;	 
		 	
		 	// 이번달 연장 시간 
    	 	if(overmonth_cnt != 0) { overworkmonth = dao.overmonth(map);}
    	 	int overm_h = (int) (overworkmonth / (60 * 60));
    	 	int overm_m = (int) (overworkmonth % (60 * 60)) / 60;
    	 	int overm_s = (overworkmonth % 60);	    	 	
    	 	String overmh = String.valueOf(overm_h);
    	 	String overmm = String.valueOf(overm_m);
    	 	String overms = String.valueOf(overm_s);
    	 	if (overm_h < 10) { overmh = "0" + String.valueOf(overm_h); }
    	 	if (overm_m < 10) { overmm = "0" + String.valueOf(overm_m); }
    	 	if (overm_s < 10) { overms = "0" + String.valueOf(overm_s); }
    	 	String overmonth = overmh +":"+ overmm +":"+ overms;
		 	
		 	// 월 근태 통계
		 	int workcnt = dao.attendin_cnt(id); // 업무(출근) 횟수		 	
		 	int totalcnt = dao.day_cnt(id); // 최종 근무 날짜
		 	int daycnt = totalcnt - (Math.round(totalcnt / 7)*2); // 7일에서 주말 제외한 실근무 횟수		 	
		 	int latecnt = dao.late_cnt(id); // 월 지각 횟수			 	
		 	
		 	double laterate = Math.round(((double)latecnt / (double)workcnt) * 100); // 월 지각/실근무 퍼센테이지   	
		 	double attendinrate = Math.round(((double)workcnt / (double)daycnt) * 100); // 월 업무/실근무 퍼센테이지
		 	double overrate = Math.round(((double)overmonth_cnt / (double)workcnt) * 100); // 월 연장/출근 퍼센테이지
		 	
		 	model.addAttribute("monthrate", monthrate); // 월 누적 시간 퍼센트
		 	model.addAttribute("workrate", workrate); // 월 근무 시간 퍼센트
		 	model.addAttribute("laterate", laterate); // 월 지각/출근 퍼센트   	
		 	model.addAttribute("attendinrate", attendinrate); // 월 업무/실근무 퍼센트			 	 
		 	model.addAttribute("overrate", overrate); // 월 연장/출근 퍼센트		 	
			model.addAttribute("workmonth", workmonth); // 월 누적 근무 시간
			model.addAttribute("overmonth", overmonth); // 월 연장 근무 시간
			model.addAttribute("month", month); // 월간 근태 현황			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectmonth", selectmonth); // 월 선택 저장
	}

	// 내 연차 내역
	@Override
	public void attendanceRestInfo(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : attendanceRestInfo");
			String id = (String) req.getSession().getAttribute("memberID");
			String years = req.getParameter("year");
			if( years == null) {
				years = "2022";
			}
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);		
			map.put("year", years);
			
			List<AnnualDTO> annual = dao.attendanceRestInfo(map); // 연도별 나의 연차 정보
			List<AnnualDTO> year = dao.yearRestInfo(map); // 연도별 발생, 총, 사용, 잔여 연차 정보
			
			model.addAttribute("annual", annual);
			model.addAttribute("year", year);
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}

	// 연장 근무 신청 
	@Override
	public void request_over(HttpServletRequest req, Model model) {		
		try {
			System.out.println("service : request_over");
			String id = (String) req.getSession().getAttribute("memberID");	
			int cnt = dao.over_cnt(id); // 일일 연장 체크 
			
			if(cnt == 0) { // 연장 신청이 없으면				
				String date = req.getParameter("date");
				String over_in = req.getParameter("over_in");
				String attendin = date + " " + over_in;
				String over_out = req.getParameter("over_out");
				String attendout = date + " " + over_out;
				String overtime = req.getParameter("overtime");
				String content = req.getParameter("content");			
				
				Map<String,Object> map = new HashMap<>();
				map.put("id", id);		
				map.put("attendin", attendin);
				map.put("attendout", attendout);
				map.put("overtime", overtime);
				map.put("content", content);			
				
				int insertCnt = dao.request_over(map); // 연장 신청	
				
				model.addAttribute("insertCnt", insertCnt);	
			}
			model.addAttribute("cnt", cnt);	
		} catch(Exception e) {
			e.printStackTrace();
		}				
	}

	// 연차 반차 신청
	@Override
	public void request_rest(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : request_rest");
			String id = (String) req.getSession().getAttribute("memberID");			
			String annual = req.getParameter("annual");
			String annualuse = req.getParameter("annualuse");
			String annualrest = req.getParameter("annualrest");
			String annual_in = req.getParameter("annual_in");
			String annual_out = req.getParameter("annual_out");	
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);		
			map.put("annual", annual);
			map.put("annualuse", annualuse);
			map.put("annualrest", annualrest);
			map.put("annual_in", annual_in);
			map.put("annual_out", annual_out);
			
			int insertCnt = dao.request_rest(map); 		
			
			model.addAttribute("insertCnt", insertCnt);			
		} catch(Exception e) {
			e.printStackTrace();
		}				
	}

	// 사원 등록 이메일 인증 > 연차 발생
	@Override
	public void newannual(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : newannual");
			String id = (String) req.getSession().getAttribute("memberID");			
						
			int insertCnt = dao.newannual(id); 		
			
			model.addAttribute("insertCnt", insertCnt);			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	// 부서 근태 내역
	@Override
	public void attendDepart(HttpServletRequest req, Model model) {
		String selectmonth = "";
		int none = 100;
		
		try {
			System.out.println("service : attendDepart");	
			String id = (String) req.getSession().getAttribute("memberID"); // 사번	
			String thisyear = (String) req.getSession().getAttribute("thisyear"); // 현재 년도
			String thismonth = (String) req.getSession().getAttribute("thismonth"); // 현재 월	
			selectmonth = req.getParameter("month");			
			String depart_name = (String)req.getSession().getAttribute("memberDepart"); // 사원 부서 session
			String selectdepart = req.getParameter("depart_name"); // 부서 선택 입력
			List<AttendanceDTO> month = new ArrayList<AttendanceDTO>();			
			String day = ""; // 통계에 쓰일 연도-월	
			
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);
			
			if(selectdepart == null) { // 부서 선택 없으면
				map.put("depart_name", depart_name); // 세션 입력				
			} else {
				map.put("depart_name", selectdepart); // 입력받은 부서 입력				
			}
			if(selectmonth == null) { // 월간 선택 없으면
				map.put("month", thismonth); // 세션 입력
				map.put("year", thisyear); // 세션 입력
				// 자릿수 맞추기
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	    	 	
				day = thisyear + "-" + mm;
				
			} else {
				map.put("month", selectmonth); // 입력받은 월 입력
				map.put("year", thisyear); // 세션 입력
				// 자릿수 맞추기
				String mm = String.valueOf(selectmonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(selectmonth); }	    	 	
				day = thisyear + "-" + mm;				
			}
						
			month = dao.departmonth(map);
			// 부서 월간 통계
			int attendin_cnt = dao.departattendin_cnt(map); // 업무시작 cnt
			int attendout_cnt = dao.departattendout_cnt(map); // 업무종료 cnt
			int over_cnt = dao.departover_cnt(map); // 연장 cnt
			int late_cnt = dao.departlate_cnt(map); // 지각 cnt (회사 내규 설정 update 필요)
			int full_cnt = dao.departfull_cnt(map); // 연차 cnt
			int half_cnt = dao.departhalf_cnt(map); // 반차 cnt
			
			int overtime = 0;
			int worktime = dao.departattendtime(map); // 업무 시간 합계
			if(over_cnt != 0) { overtime = dao.departovertime(map); } // 연장 시간 합계			
		 	
			if(attendin_cnt != 0 || attendout_cnt != 0 || over_cnt != 0 || late_cnt != 0 || full_cnt != 0 || half_cnt != 0) {
				none = 0;
			}
			
		 	// 이번달 누적 시간 > 도식화
		 	int monthtime = worktime + overtime;
		 	int departworkcheck = dao.departworkcheck(map); // 부서 업무종료 이력 cnt
		 	int monthstandard = 187200 * 4 * departworkcheck; // 52시간 > 월 근무 기준 초 단위 * 근무이력이 있는 사원
			double monthrate = Math.round(((double)monthtime / (double)monthstandard) * 100); // 월 누적
		 	double overrate = Math.round(((double)overtime / (double)monthstandard) * 100); // 월 연장
		 	double workrate = Math.round(((double)worktime / (double)monthstandard) * 100); // 월 근무 
		 	
		 	int month_h = (int) (monthtime / (60 * 60));
		 	int month_m = (int) (monthtime % (60 * 60)) / 60;
		 	int month_s = (monthtime % 60);
		 	String monthh = String.valueOf(month_h);
    	 	String monthm = String.valueOf(month_m);
    	 	String months = String.valueOf(month_s);
    	 	if (month_h < 10) { monthh = "0" + String.valueOf(month_h); }
    	 	if (month_m < 10) { monthm = "0" + String.valueOf(month_m); }
    	 	if (month_s < 10) { months = "0" + String.valueOf(month_s); }
		 	String fullmonth = monthh +":"+ monthm +":"+ months;	 
		 	
		 	// 이번달 업무 시간
		 	int work_h = (int) (worktime / (60 * 60));
		 	int work_m = (int) (worktime % (60 * 60)) / 60;
		 	int work_s = (worktime % 60);
		 	String workh = String.valueOf(work_h);
    	 	String workm = String.valueOf(work_m);
    	 	String works = String.valueOf(work_s);
    	 	if (work_h < 10) { workh = "0" + String.valueOf(work_h); }
    	 	if (work_m < 10) { workm = "0" + String.valueOf(work_m); }
    	 	if (work_s < 10) { works = "0" + String.valueOf(work_s); }
		 	String workmonth = workh +":"+ workm +":"+ works;	 
		 	
		 	// 이번달 연장 시간 
    	 	int overm_h = (int) (overtime / (60 * 60));
    	 	int overm_m = (int) (overtime % (60 * 60)) / 60;
    	 	int overm_s = (overtime % 60);	    	 	
    	 	String overmh = String.valueOf(overm_h);
    	 	String overmm = String.valueOf(overm_m);
    	 	String overms = String.valueOf(overm_s);
    	 	if (overm_h < 10) { overmh = "0" + String.valueOf(overm_h); }
    	 	if (overm_m < 10) { overmm = "0" + String.valueOf(overm_m); }
    	 	if (overm_s < 10) { overms = "0" + String.valueOf(overm_s); }
    	 	String overmonth = overmh +":"+ overmm +":"+ overms;
			
    	 	
    	 	model.addAttribute("day", day); // 연도-월
    	 	model.addAttribute("monthrate", monthrate); // 누적 시간 / 52시간 * 월
    	 	model.addAttribute("overrate", overrate); // 업무 시간 / 52시간 * 월 
    	 	model.addAttribute("workrate", workrate); // 연장 시간 / 52시간 * 월
    	 	model.addAttribute("attendin_cnt", attendin_cnt); // 부서 업무 cnt		
    	 	model.addAttribute("attendout_cnt", attendout_cnt); // 부서 업무종료 cnt			
    	 	model.addAttribute("over_cnt", over_cnt); // 부서 연장 cnt			
    	 	model.addAttribute("late_cnt", late_cnt); // 부서 지각 cnt				
    	 	model.addAttribute("full_cnt", full_cnt); // 부서 연차 cnt	
    	 	model.addAttribute("half_cnt", half_cnt); // 부서 반차 cnt		
    	 	model.addAttribute("fullmonth", fullmonth); // 월 누적 시간	
    	 	model.addAttribute("workmonth", workmonth); // 월 업무 시간	
    	 	model.addAttribute("overmonth", overmonth); // 월 연장 시간
			model.addAttribute("month", month); // 월간 근태 현황			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectmonth", selectmonth); // 월 선택 저장
		model.addAttribute("none", none); // 데이터 없을 시 차트 표기
	}

	// 부서 연차 내역
	@Override
	public void annualDepart(HttpServletRequest req, Model model) {
		String selectmonth = "";
		String selectyear = "";
		int none = 100;
		try {
			System.out.println("service : annualDepart");
			String depart_name = (String) req.getSession().getAttribute("memberDepart"); // 부서			
			String thisyear = (String) req.getSession().getAttribute("thisyear"); // 현재 년도
			String thismonth = (String) req.getSession().getAttribute("thismonth"); // 현재 월
			String selectdepart = req.getParameter("depart_name");
			selectyear = req.getParameter("year");
			selectmonth = req.getParameter("month");				
			String day = ""; // 통계에 쓰일 연도-월
			
			Map<String,Object> map = new HashMap<>();
			
			if(selectdepart == null) { // 입력받은 부서가 없으면
				map.put("depart_name", depart_name); // 세션 입력
			} else {
				map.put("depart_name", selectdepart);
			}			
			
			if(selectmonth == null && selectyear == null) { // 둘 다 선택이 없을 시
				map.put("month", thismonth); // 세션 입력
				map.put("year", thisyear); // 세션 입력
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	    	 	
				day = thisyear + "-" + mm;
			} else if(selectmonth == null){ // 입력받은 월이 없으면
				map.put("month", thismonth); // 세션 입력
				map.put("year", selectyear); 
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	   
				day = selectyear + "-" + mm;
			}
			else if(selectyear == null) { // 입력받은 연도가 없으면
				map.put("year", thisyear); // 세션 입력
				map.put("month", selectmonth); // 입력받은 월 입력
				String mm = String.valueOf(selectmonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(selectmonth); }	   
				day = thisyear + "-" + mm;
			} 
			else if(selectyear != null) { // 입력받은 연도가 있으면
				map.put("year", selectyear); // 연도 입력
				map.put("month", thismonth); // 세션 입력
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	   
				day = thisyear + "-" + mm;
			}
			
			
			List<AnnualDTO> annual = dao.annualDepart(map); // 부서별 월간 연차 사용 내역
			List<AnnualDTO> departMember = dao.departRestInfo(map); // 부서원 연도 발생, 총, 사용, 잔여 연차 정보
			
			int full_cnt = dao.departfull_cnt(map); // 연차 cnt
			int half_cnt = dao.departhalf_cnt(map); // 반차 cnt
			if(full_cnt != 0 || half_cnt != 0) {
				none = 0;
			}
			
			model.addAttribute("day", day); // 연도-월
			model.addAttribute("full_cnt", full_cnt); // 부서 연차 cnt	
    	 	model.addAttribute("half_cnt", half_cnt); // 부서 반차 cnt		
			model.addAttribute("annual", annual);
			model.addAttribute("departMember", departMember);
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectyear", selectyear);
		model.addAttribute("selectmonth", selectmonth); // 월 선택 저장
		model.addAttribute("none", none); // 데이터 없을 시 차트 표기
	}

	// 전사 근태 내역
	@Override
	public void attendGrb(HttpServletRequest req, Model model) {
		String selectmonth = "";
		String selectdepart = "";
		int none = 100;
		try {
			System.out.println("service : attendGrb");	
			String id = (String) req.getSession().getAttribute("memberID"); // 사번	
			String thisyear = (String) req.getSession().getAttribute("thisyear"); // 현재 년도
			String thismonth = (String) req.getSession().getAttribute("thismonth"); // 현재 월						
			String depart_name = (String)req.getSession().getAttribute("memberDepart"); // 부서
			selectdepart = req.getParameter("depart_name"); // 부서 선택 입력
			selectmonth = req.getParameter("month"); // 월 선택 입력
			
				
			String day = ""; // 통계에 쓰일 연도-월
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", id);						
			if(selectmonth == null) { // 월간 선택 없으면
				map.put("month", thismonth); // 세션 입력
				map.put("year", thisyear); // 세션 입력
				// 자릿수 맞추기
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	    	 	
				day = thisyear + "-" + mm;				
			} else {
				map.put("month", selectmonth); // 입력받은 월 입력
				map.put("year", thisyear); // 세션 입력
				// 자릿수 맞추기
				String mm = String.valueOf(selectmonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(selectmonth); }	    	 	
				day = thisyear + "-" + mm;				
			}
			List<AttendanceDTO> grb = new ArrayList<AttendanceDTO>(); // 전사 근태 내역
			
			int attendin_cnt = 0, attendout_cnt = 0, full_cnt = 0, half_cnt = 0, over_cnt = 0, late_cnt = 0;
			int overtime = 0, worktime = 0, grbworkcheck = 0; // 연장시간, 근무시간, 이번달 근무이력 체크
			
			if(selectdepart == null) { // 입력받은 부서가 없으면 > 전사 월간 통계
				map.put("depart_name", depart_name); // 세션 입력
				grb = dao.attendGrb(map); // 전사 월간 근태 내역	
				full_cnt = dao.grbfull_cnt(map); // 전사 월 연차 cnt
				half_cnt = dao.grbhalf_cnt(map); // 전사 월 반차 cnt
				attendin_cnt = dao.grbattendin_cnt(map); // 업무시작 cnt
				attendout_cnt = dao.grbattendout_cnt(map); // 업무종료 cnt
				over_cnt = dao.grbover_cnt(map); // 연장 cnt
				late_cnt = dao.grblate_cnt(map); // 지각 cnt
				worktime = dao.grbattendtime(map); // 부서 업무 시간 합계
				grbworkcheck = dao.grbworkcheck(map); // 전사 업무종료 이력 cnt
				if(over_cnt != 0) { overtime = dao.grbovertime(map); } // 부서 연장 시간 합계							
			} 
			else { // 입력받은 부서가 있으면 > 부서 월간 통계
				map.put("depart_name", selectdepart);				
				grb = dao.departmonth(map); // 부서별 월간 근태 내역	
				attendin_cnt = dao.departattendin_cnt(map); // 업무시작 cnt
				attendout_cnt = dao.departattendout_cnt(map); // 업무종료 cnt
				over_cnt = dao.departover_cnt(map); // 연장 cnt
				late_cnt = dao.departlate_cnt(map); // 지각 cnt
				full_cnt = dao.departfull_cnt(map); // 부서 월 연차 cnt
				half_cnt = dao.departhalf_cnt(map); // 부서 월 반차 cnt
				worktime = dao.departattendtime(map); // 부서 업무 시간 합계
				grbworkcheck = dao.departworkcheck(map); // 부서 업무종료 이력 cnt
				if(over_cnt != 0) { overtime = dao.departovertime(map); } // 부서 연장 시간 합계								
			}										
			
			if(attendin_cnt != 0 || attendout_cnt != 0 || over_cnt != 0 || late_cnt != 0 || full_cnt != 0 || half_cnt != 0) {
				none = 0;
			}
			
		 	// 이번달 누적 시간 > 도식화
		 	int monthtime = worktime + overtime;		 	
		 	int monthstandard = 187200 * 4 * grbworkcheck; // 52시간 > 월 근무 기준 초 단위 * 근무이력이 있는 사원
			double monthrate = Math.round(((double)monthtime / (double)monthstandard) * 100); // 월 누적
		 	double overrate = Math.round(((double)overtime / (double)monthstandard) * 100); // 월 연장
		 	double workrate = Math.round(((double)worktime / (double)monthstandard) * 100); // 월 근무 		 	
		 	
		 	int month_h = (int) (monthtime / (60 * 60));
		 	int month_m = (int) (monthtime % (60 * 60)) / 60;
		 	int month_s = (monthtime % 60);
		 	String monthh = String.valueOf(month_h);
    	 	String monthm = String.valueOf(month_m);
    	 	String months = String.valueOf(month_s);
    	 	if (month_h < 10) { monthh = "0" + String.valueOf(month_h); }
    	 	if (month_m < 10) { monthm = "0" + String.valueOf(month_m); }
    	 	if (month_s < 10) { months = "0" + String.valueOf(month_s); }
		 	String fullmonth = monthh +":"+ monthm +":"+ months;	 
		 	
		 	// 이번달 업무 시간		 		 	
		 	int work_h = (int) (worktime / (60 * 60));
		 	int work_m = (int) (worktime % (60 * 60)) / 60;
		 	int work_s = (worktime % 60);
		 	String workh = String.valueOf(work_h);
    	 	String workm = String.valueOf(work_m);
    	 	String works = String.valueOf(work_s);
    	 	if (work_h < 10) { workh = "0" + String.valueOf(work_h); }
    	 	if (work_m < 10) { workm = "0" + String.valueOf(work_m); }
    	 	if (work_s < 10) { works = "0" + String.valueOf(work_s); }
		 	String workmonth = workh +":"+ workm +":"+ works;	 
		 	
		 	// 이번달 연장 시간     	 	
    	 	int overm_h = (int) (overtime / (60 * 60));
    	 	int overm_m = (int) (overtime % (60 * 60)) / 60;
    	 	int overm_s = (overtime % 60);	    	 	
    	 	String overmh = String.valueOf(overm_h);
    	 	String overmm = String.valueOf(overm_m);
    	 	String overms = String.valueOf(overm_s);
    	 	if (overm_h < 10) { overmh = "0" + String.valueOf(overm_h); }
    	 	if (overm_m < 10) { overmm = "0" + String.valueOf(overm_m); }
    	 	if (overm_s < 10) { overms = "0" + String.valueOf(overm_s); }
    	 	String overmonth = overmh +":"+ overmm +":"+ overms;    	 	
			
    	 	
    	 	model.addAttribute("day", day); // 연도-월
    	 	model.addAttribute("monthrate", monthrate); // 누적 시간 / 52시간 * 월
    	 	model.addAttribute("overrate", overrate); // 업무 시간 / 52시간 * 월 
    	 	model.addAttribute("workrate", workrate); // 연장 시간 / 52시간 * 월
    	 	model.addAttribute("attendin_cnt", attendin_cnt); // 부서 업무 cnt		
    	 	model.addAttribute("attendout_cnt", attendout_cnt); // 부서 업무종료 cnt			
    	 	model.addAttribute("over_cnt", over_cnt); // 부서 연장 cnt			
    	 	model.addAttribute("late_cnt", late_cnt); // 부서 지각 cnt				
    	 	model.addAttribute("full_cnt", full_cnt); // 부서 연차 cnt	
    	 	model.addAttribute("half_cnt", half_cnt); // 부서 반차 cnt		
    	 	model.addAttribute("fullmonth", fullmonth); // 월 누적 시간	
    	 	model.addAttribute("workmonth", workmonth); // 월 업무 시간	
    	 	model.addAttribute("overmonth", overmonth); // 월 연장 시간			
			model.addAttribute("grb", grb); // 월간 근태 현황		
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectmonth", selectmonth); // 월 선택 세팅
		model.addAttribute("depart_name", selectdepart); // 부서 세팅
		model.addAttribute("none", none); // 데이터 없을 시 none 설정으로 차트 표기
	}

	// 전사 연차 내역
	@Override
	public void annualGrb(HttpServletRequest req, Model model) {
		String selectmonth = "";
		String selectyear = "";
		String selectdepart = "";
		int none = 100;
		try {
			System.out.println("service : annualGrb");
			String depart_name = (String) req.getSession().getAttribute("memberDepart"); // 부서			
			String thisyear = (String) req.getSession().getAttribute("thisyear"); // 현재 년도
			String thismonth = (String) req.getSession().getAttribute("thismonth"); // 현재 월
			selectdepart = req.getParameter("depart_name"); // 부서 선택 입력
			selectyear = req.getParameter("year");
			selectmonth = req.getParameter("month");				
			String day = ""; // 통계에 쓰일 연도-월
			
			Map<String,Object> map = new HashMap<>();

			if(selectmonth == null && selectyear == null) { // 둘 다 선택이 없을 시
				map.put("month", thismonth); // 세션 입력
				map.put("year", thisyear); // 세션 입력
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	    	 	
				day = thisyear + "-" + mm;
			} else if(selectmonth == null){ // 입력받은 월이 없으면
				map.put("month", thismonth); // 세션 입력
				map.put("year", selectyear); 
				String mm = String.valueOf(thismonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(thismonth); }	   
				day = selectyear + "-" + mm;
			}
			else if(selectyear == null) { // 입력받은 연도가 없으면
				map.put("year", thisyear); // 세션 입력
				map.put("month", selectmonth); // 입력받은 월 입력
				String mm = String.valueOf(selectmonth);	    	 	
	    	 	if (mm.length() == 1) { mm = "0" + String.valueOf(selectmonth); }	   
				day = thisyear + "-" + mm;
			} 
			
			List<AnnualDTO> annual = new ArrayList<AnnualDTO>();
			List<AnnualDTO> grbMember = new ArrayList<AnnualDTO>();
			int full_cnt = 0;
			int half_cnt = 0;
			
			if(selectdepart == null) { // 입력받은 부서가 없으면
				map.put("depart_name", depart_name); // 세션 입력
				annual = dao.annualGrb(map); // 전사 월간 연차 사용 내역
				grbMember = dao.grbRestInfo(map); // 전사원 연도 발생, 총, 사용, 잔여 연차 정보
				full_cnt = dao.grbfull_cnt(map); // 전사 월 연차 cnt
				half_cnt = dao.grbhalf_cnt(map); // 전사 월반차 cnt
			} else { // 입력받은 부서가 있으면
				map.put("depart_name", selectdepart);
				annual = dao.annualDepart(map); // 부서별 월간 연차 사용 내역
				grbMember = dao.departRestInfo(map); // 부서원 연도 발생, 총, 사용, 잔여 연차 정보
				full_cnt = dao.departfull_cnt(map); // 전사 월 연차 cnt
				half_cnt = dao.departhalf_cnt(map); // 전사 월반차 cnt
			}	
			
			if(full_cnt != 0 || half_cnt != 0) {
				none = 0;
			}
			
			// 부서별 연차+반차 통계
			int bus_cnt = dao.bus_cnt(map); // 사업부
			int sale_cnt = dao.sale_cnt(map); // 영업부
			int it_cnt = dao.it_cnt(map); // 개발부
			int human_cnt = dao.human_cnt(map); // 인사부
			int sup_cnt = dao.sup_cnt(map); // 경영지원부
			int acc_cnt = dao.acc_cnt(map); // 총무부
			 
			model.addAttribute("day", day); // 연도-월
			model.addAttribute("bus_cnt", bus_cnt); // 부서별 연차+반차 cnt
			model.addAttribute("sale_cnt", sale_cnt);
			model.addAttribute("it_cnt", it_cnt); 
			model.addAttribute("human_cnt", human_cnt); 
			model.addAttribute("sup_cnt", sup_cnt); 
			model.addAttribute("acc_cnt", acc_cnt); 
			model.addAttribute("full_cnt", full_cnt); // 전사 연차 cnt	
    	 	model.addAttribute("half_cnt", half_cnt); // 전사 반차 cnt		
			model.addAttribute("annual", annual);
			model.addAttribute("grbMember", grbMember);
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectyear", selectyear);
		model.addAttribute("selectmonth", selectmonth); // 월 선택 저장	
		model.addAttribute("none", none); // 데이터 없을 시 none 설정으로 차트 표기
		model.addAttribute("depart_name", selectdepart); // 부서 세팅
	}
	
	// 회사 정보 + 메인 차트 
	@Override
	public void companyInfo(HttpServletRequest req, Model model) {
		
		try {
			System.out.println("service : companyInfo");			
			String thisyear = (String) req.getSession().getAttribute("thisyear"); // 현재 년도
			String thismonth = (String) req.getSession().getAttribute("thismonth"); // 현재 월							
			String month = thisyear + "-" + thismonth; // 통계에 쓰일 연도-월
			Date nowDate = new Date();	        
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd");	        	
			String dd = simpleDateFormat.format(nowDate); 
			String day = thisyear + "-" + thismonth + "-" + dd; 
			int company_id = 1; // 회사번호 고정	
					
			CompanyDTO dto = dao.companyInfo(company_id);
			int memberCnt = dao.memberCnt();					
			int approvalCnt = dao.approvalCnt();				
			
			model.addAttribute("month", month); // 연도-월
			model.addAttribute("day", day); // 연도-월-일
			model.addAttribute("dto", dto); // 회사 정보
			model.addAttribute("memberCnt", memberCnt); // 재직자 사원 수 
			model.addAttribute("approvalCnt", approvalCnt); // 통합문서함 개수
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
	}
	
	// 서비스 메뉴 관리
	@Override
	public void serviceMenu(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 회사 내규 설정
	@Override
	public void companyAttend(HttpServletRequest req, Model model) {
		try {
			System.out.println("service : companyAttend");
			// 화면 값에서 입력 받은 회사 내규 설정 
			String attendin = req.getParameter("attendin");
			String attendout = req.getParameter("attendout");
			String over_in = req.getParameter("over_in");
			String over_out = req.getParameter("over_out");
			String rest_in = req.getParameter("rest_in");
			String rest_out = req.getParameter("rest_out");						
			int company_id = 1; // 회사번호 고정
			
			// map에 담기
			Map<String,Object> map = new HashMap<>();
			map.put("company_id", company_id);
			map.put("attendin", attendin);
			map.put("attendout", attendout);
			map.put("over_in", over_in);
			map.put("over_out", over_out);
			map.put("rest_in", rest_in);
			map.put("rest_out", rest_out);
			
			int updateCnt = dao.c_attendance(map); // 회사 근태 내규  update		
			
			model.addAttribute("updateCnt", updateCnt);			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
	}
	
	

}
