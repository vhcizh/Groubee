package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.AnnualDTO;
import com.spring.tutorial.dto.AttendanceDTO;
import com.spring.tutorial.dto.CompanyDTO;

public interface AttendanceDAO {
	// 나의 근태 현황 
	public List<AttendanceDTO> attendance(String id);
	
	// 업무 시작
	public int attendin(String id);
	
	// 업무 종료
	public int attendout(String id);
	
	// 일일 누적 시간
	public int updateworktime(Map<String, Object> map);
	
	// 누적+연장 근무 시간
	public int workover(Map<String, Object> map);
		 
	// 누적  근무 시간
	public int worktime(Map<String, Object> map);
	
	// 주간 연장  근무 시간
	public int overtime(Map<String, Object> map);
	
	// 월간 연장  근무 시간
	public int overmonth(Map<String, Object> map);
	
	// 나의 근무 조회 (주간)
	public List<AttendanceDTO> attendanceWeek(Map<String, Object> map);
	
	// 나의 월 근무 시간
	public int monthwork(Map<String, Object> map);
	
	// 주 연장 카운트
	public int overweek_cnt(Map<String, Object> map);
	 
	// 월 연장 카운트	
	public int overmonth_cnt(Map<String, Object> map);
	
	// 월 업무(출근) 카운트
	public int attendin_cnt(String id);
	
	// 월 날짜 반환
	public int day_cnt(String id);
	
	// 월 지각 카운트
	public int late_cnt(String id);
	
	// 월 근태 현황
	public List<AttendanceDTO> attendanceMonth(Map<String, Object> map); // 월 선택 시
	
	// 내 연차 내역
	public List<AnnualDTO> attendanceRestInfo(Map<String, Object> map);
	
	// 사원등록 발생 연차
	public int newannual(String id);	
	
	// 연 발생 연차
	public List<AnnualDTO> yearRestInfo(Map<String, Object> map);
	
	// 일일 연장 1회 제한
	public int over_cnt(String id);	
	
	// 연장 근무 신청 
	public int request_over(Map<String, Object> map);
	
	// 연차 반차 신청 
	public int request_rest(Map<String, Object> map);
	
	// 부서 주간 근태
	public List<AttendanceDTO> attenddepart(Map<String, Object> map);
	
	// 부서 월간 근태
	public List<AttendanceDTO> departmonth(Map<String, Object> map);
	
	// 부서 연차 내역
	public List<AnnualDTO> annualDepart(Map<String, Object> map);
	
	// 부서원 연간 연차 현황
	public List<AnnualDTO> departRestInfo(Map<String, Object> map);
	
	// 전사 근태 내역
	public List<AttendanceDTO> attendGrb(Map<String, Object> map);
	
	// 전사 월간 연차 내역
	public List<AnnualDTO> annualGrb(Map<String, Object> map);
	
	// 전사원 연차 현황
	public List<AnnualDTO> grbRestInfo(Map<String, Object> map);
	
	// 부서 월간 통계
	// 부서 업무 cnt
	public int departattendin_cnt(Map<String, Object> map);
	
	// 부서 업무종료 cnt
	public int departattendout_cnt(Map<String, Object> map);
	
	// 부서 연장 cnt
	public int departover_cnt(Map<String, Object> map);
	
	// 부서 지각 cnt
	public int departlate_cnt(Map<String, Object> map);
	
	// 부서 연차 cnt
	public int departfull_cnt(Map<String, Object> map);
		
	// 부서 반차 cnt
	public int departhalf_cnt(Map<String, Object> map);
	
	// 부서 업무 time
	public int departattendtime(Map<String, Object> map);
	
	// 부서 연장 time
	public int departovertime(Map<String, Object> map);
	
	// 부서 업무종료 이력 사원 cnt
	public int departworkcheck(Map<String, Object> map);
	
	// 전사 월간 통계
	// 전사 업무종료 이력 사원 cnt
	public int grbworkcheck(Map<String, Object> map);
	
	// 전사 업무 cnt
	public int grbattendin_cnt(Map<String, Object> map);

	// 전사 업무종료 cnt
	public int grbattendout_cnt(Map<String, Object> map);

	// 전사 연장 cnt
	public int grbover_cnt(Map<String, Object> map);

	// 전사 지각 cnt
	public int grblate_cnt(Map<String, Object> map);

	// 전사 업무 time
	public int grbattendtime(Map<String, Object> map);

	// 전사 연장 time
	public int grbovertime(Map<String, Object> map);	
	
	// 전사 연차 cnt
	public int grbfull_cnt(Map<String, Object> map);
			
	// 전사 반차 cnt
	public int grbhalf_cnt(Map<String, Object> map);
	
	// 사업부 연차+반차 cnt
	public int bus_cnt(Map<String, Object> map);
	
	// 영업부 연차+반차 cnt
	public int sale_cnt(Map<String, Object> map);
	
	// 개발부 연차+반차 cnt
	public int it_cnt(Map<String, Object> map);
	
	// 인사부 연차+반차 cnt
	public int human_cnt(Map<String, Object> map);
	
	// 경영지원부 연차+반차 cnt
	public int sup_cnt(Map<String, Object> map);
	
	// 총무부 연차+반차 cnt
	public int acc_cnt(Map<String, Object> map);

	// 회사 정보
	public CompanyDTO companyInfo(int company_id);
	
	// 재직자 사원 수
	public int memberCnt();
	
	// 통함문서함 개수
	public int approvalCnt();
	
	// 회사 내규 설정
	public int c_attendance(Map<String, Object> map);
	
	// 회사 업무종료 시간
	public String c_attendout();
}
