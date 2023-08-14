package com.spring.tutorial.dao;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.AnnualDTO;
import com.spring.tutorial.dto.AttendanceDTO;
import com.spring.tutorial.dto.CompanyDTO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO{
	@Autowired
    SqlSession sqlSession; 
	
	DataSource dataSource;

	// 나의 근태 현황 
	@Override
	public List<AttendanceDTO> attendance(String id) {
		System.out.println("dao : attendance");			
		List<AttendanceDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attendanceDay", id);
		
		return list;
	}
	
	// 업무 시작
	@Override
	public int attendin(String id) {
		System.out.println("dao : attendin");			
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AttendanceDAO.attendin", id);
		
		return insertCnt;
	}

	// 업무 종료
	@Override
	public int attendout(String id) {
		System.out.println("dao : attendout");			
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AttendanceDAO.attendout", id);
		
		return insertCnt;
	}
	
	// 근무 시간 update
	@Override
	public int updateworktime(Map<String, Object> map) {
		System.out.println("dao : updateworktime");
		int updateCnt = sqlSession.update("com.spring.tutorial.dao.AttendanceDAO.updateworktime", map);

		return updateCnt;
	}
	
	// 누적 + 연장
	@Override
	public int workover(Map<String, Object> map) {
		System.out.println("dao : workover");			
		int workover = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.workover", map);
		
		return workover;
	}

	// 누적 근무
	@Override
	public int worktime(Map<String, Object> map) {
		System.out.println("dao : worktime");			
		int worktime = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.worktime", map);
		
		return worktime;
	} 	
	
	// 연장  근무 시간
	@Override
	public int overtime(Map<String, Object> map) {
		System.out.println("dao : overtime");			
		int overtime = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.overtime", map);
		
		return overtime;
	}
	
	// 월간 연장  근무 시간
	@Override
	public int overmonth(Map<String, Object> map) {
		System.out.println("dao : overmonth");			
		int overmonth = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.overmonth", map);
		
		return overmonth;
	}
	
	// 나의 근무 조회 (주간별)
	@Override
	public List<AttendanceDTO> attendanceWeek(Map<String, Object> map) {
		System.out.println("dao : attendanceWeek");			
		List<AttendanceDTO> week = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attendanceWeek", map);
		
		return week;
	}

	// 나의 월 근무 시간
	@Override
	public int monthwork(Map<String, Object> map) {
		System.out.println("dao : monthwork");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.monthwork", map);

		return selectCnt;
	}
	
	// 주 연장 카운트
	@Override
	public int overweek_cnt(Map<String, Object> map) {
		System.out.println("dao : overweek_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.overweek_cnt", map);

		return selectCnt;
	}
	
	// 월 연장 카운트
	@Override
	public int overmonth_cnt(Map<String, Object> map) {
		System.out.println("dao : overmonth_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.overmonth_cnt", map);

		return selectCnt;
	}
	
	// 월 업무(출근) 카운트
	@Override
	public int attendin_cnt(String id) {
		System.out.println("dao : attendin_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.attendin_cnt", id);

		return selectCnt;
	}
	
	// 월 지각 카운트
	@Override
	public int late_cnt(String id) {
		System.out.println("dao : late_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.late_cnt", id);

		return selectCnt;
	}
	
	// 월 근태 현황
	@Override
	public List<AttendanceDTO> attendanceMonth(Map<String, Object> map){
		System.out.println("dao : attendanceMonth");
		List<AttendanceDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attendanceMonth", map);
		
		return list;
	}
	
	// 최종 근무 날짜 
	public int day_cnt(String id) {
		System.out.println("dao : day_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.day_cnt", id);

		return selectCnt;
	}

	// 내 연차 내역
	@Override
	public List<AnnualDTO> attendanceRestInfo(Map<String, Object> map) {
		System.out.println("dao : attendanceRestInfo");
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attendanceRestInfo", map);
		
		return list;
	}
	
	// 사원 등록 발생 연차
	@Override
	public int newannual(String id) {
		System.out.println("dao : newannual");
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AttendanceDAO.newannual", id);

		return insertCnt;
	}

	// 연 발생 연차
	@Override
	public List<AnnualDTO> yearRestInfo(Map<String, Object> map){
		System.out.println("dao : yearRestInfo");
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.yearRestInfo", map);
		
		return list;
	}
	
	// 일일 연장 1회 제한
	@Override
	public int over_cnt(String id) {
		System.out.println("dao : over_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.over_cnt", id);

		return selectCnt;
	}
	
	// 연장 근무 신청 
	@Override
	public int request_over(Map<String, Object> map) {
		System.out.println("dao : request_over");	
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AttendanceDAO.request_over", map);
		
		return insertCnt;
	}

	// 연차 반차 신청 
	@Override
	public int request_rest(Map<String, Object> map) {
		System.out.println("dao : request_rest");	
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.AttendanceDAO.request_rest", map);
		
		return insertCnt;
	}
	
	
	// 부서 주간 근태
	@Override
	public List<AttendanceDTO> attenddepart(Map<String, Object> map) {
		System.out.println("dao : departweek");
		List<AttendanceDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attenddepart", map);
		
		return list;		
	}
	
	// 부서 월간 근태
	@Override
	public List<AttendanceDTO> departmonth(Map<String, Object> map) {
		System.out.println("dao : departmonth");	
		List<AttendanceDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.departmonth", map);
		
		return list;
	}
	
	// 부서 업무 카운트	
	@Override
	public int departattendin_cnt(Map<String, Object> map) {
		System.out.println("dao : departattendin_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departattendin_cnt", map);

		return selectCnt;
	}
	
	// 부서 업무종료 카운트	
	@Override
	public int departattendout_cnt(Map<String, Object> map) {
		System.out.println("dao : departattendout_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departattendout_cnt", map);

		return selectCnt;
	}

	// 부서 연장 카운트	
	@Override
	public int departover_cnt(Map<String, Object> map) {
		System.out.println("dao : departover_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departover_cnt", map);

		return selectCnt;
	}

	// 부서 지각 카운트
	@Override
	public int departlate_cnt(Map<String, Object> map) {
		System.out.println("dao : departlate_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departlate_cnt", map);

		return selectCnt;
	}
	
	// 부서 연차 카운트
	@Override
	public int departfull_cnt(Map<String, Object> map) {
		System.out.println("dao : departfull_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departfull_cnt", map);

		return selectCnt;
	}

	// 부서 반차 카운트
	@Override
	public int departhalf_cnt(Map<String, Object> map) {
		System.out.println("dao : departhalf_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departhalf_cnt", map);

		return selectCnt;
	}

	// 부서 업무 time
	public int departattendtime(Map<String, Object> map) {
		System.out.println("dao : departattendtime");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departattendtime", map);

		return selectCnt;
	}

	// 부서 연장 time
	public int departovertime(Map<String, Object> map) {
		System.out.println("dao : departovertime");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departovertime", map);

		return selectCnt;
	}	
	
	// 부서 연차 월간 내역
	@Override
	public List<AnnualDTO> annualDepart(Map<String, Object> map) {
		System.out.println("dao : annualDepart");	
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.annualDepart", map);
		return list;
	}
	
	// 부서원 연간 연차 현황
	@Override
	public List<AnnualDTO> departRestInfo(Map<String, Object> map){
		System.out.println("dao : departRestInfo");	
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.departRestInfo", map);
		return list;
	}

	// 부서 업무종료 이력 사원 cnt
	@Override
	public int departworkcheck(Map<String, Object> map) {
		System.out.println("dao : departworkcheck");	
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.departworkcheck", map);
		
		return selectCnt;	
	}

	// 전사 업무종료 이력 사원 cnt
	@Override
	public int grbworkcheck(Map<String, Object> map) {
		System.out.println("dao : grbworkcheck");	
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbworkcheck", map);
		
		return selectCnt;
	}
	
	// 전사 근태 내역
	@Override
	public List<AttendanceDTO> attendGrb(Map<String, Object> map) {
		System.out.println("dao : attendGrb");	
		List<AttendanceDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.attendGrb", map);
		
		return list;
	}

	// 전사 업무 카운트	
	@Override
	public int grbattendin_cnt(Map<String, Object> map) {
		System.out.println("dao : grbattendin_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbattendin_cnt", map);

		return selectCnt;
	}

	// 전사 업무종료 카운트	
	@Override
	public int grbattendout_cnt(Map<String, Object> map) {
		System.out.println("dao : grbattendout_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbattendout_cnt", map);

		return selectCnt;
	}

	// 전사 연장 카운트	
	@Override
	public int grbover_cnt(Map<String, Object> map) {
		System.out.println("dao : grbover_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbover_cnt", map);

		return selectCnt;
	}

	// 전사 지각 카운트
	@Override
	public int grblate_cnt(Map<String, Object> map) {
		System.out.println("dao : grblate_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grblate_cnt", map);

		return selectCnt;
	}

	// 전사 연차 cnt
	@Override
	public int grbfull_cnt(Map<String, Object> map) {
		System.out.println("dao : grbfull_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbfull_cnt", map);

		return selectCnt;
	}

	// 전사 반차 cnt
	@Override
	public int grbhalf_cnt(Map<String, Object> map) {
		System.out.println("dao : grbhalf_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbhalf_cnt", map);

		return selectCnt;
	}
	
	// 전사 업무 time
	public int grbattendtime(Map<String, Object> map) {
		System.out.println("dao : grbattendtime");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbattendtime", map);

		return selectCnt;
	}

	// 전사 연장 time
	public int grbovertime(Map<String, Object> map) {
		System.out.println("dao : grbovertime");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.grbovertime", map);

		return selectCnt;
	}	
	
	// 전사 연차 내역
	@Override
	public List<AnnualDTO> annualGrb(Map<String, Object> map) {
		System.out.println("dao : annualGrb");	
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.annualGrb", map);
		return list;
	}
	
	// 전사원 연차 현황
	@Override
	public List<AnnualDTO> grbRestInfo(Map<String, Object> map){
		System.out.println("dao : grbRestInfo");	
		List<AnnualDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AttendanceDAO.grbRestInfo", map);
		return list;
	}	
	
	
	// 사업부 연차+반차 cnt
	@Override
	public int bus_cnt(Map<String, Object> map) {
		System.out.println("dao : bus_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.bus_cnt", map);

		return selectCnt;
	}
		
	// 영업부 연차+반차 cnt
	@Override
	public int sale_cnt(Map<String, Object> map) {
		System.out.println("dao : sale_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.sale_cnt", map);

		return selectCnt;
	}
		
	// 개발부 연차+반차 cnt
	@Override
	public int it_cnt(Map<String, Object> map) {
		System.out.println("dao : it_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.it_cnt", map);

		return selectCnt;
	}
		
	// 인사부 연차+반차 cnt
	@Override
	public int human_cnt(Map<String, Object> map) {
		System.out.println("dao : human_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.human_cnt", map);

		return selectCnt;
	}
		
	// 경영지원부 연차+반차 cnt
	@Override
	public int sup_cnt(Map<String, Object> map) {
		System.out.println("dao : sup_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.sup_cnt", map);

		return selectCnt;
	}
		
	// 총무부 연차+반차 cnt
	@Override
	public int acc_cnt(Map<String, Object> map) {
		System.out.println("dao : acc_cnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.acc_cnt", map);

		return selectCnt;
	}
	
	// ----------- 관리자 페이지
	// 회사 정보
	@Override
	public CompanyDTO companyInfo(int company_id) {
		System.out.println("dao : companyInfo");
		CompanyDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.companyInfo", company_id);

		return dto;
	}
	
	// 재직자 사원 수
	@Override
	public int memberCnt() {
		System.out.println("dao : memberCnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.memberCnt");

		return selectCnt;
	}
	
	// 통합문서함 개수
	@Override
	public int approvalCnt() {
		System.out.println("dao : approvalCnt");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.approvalCnt");

		return selectCnt;
	}
	
	// 회사 내규 설정
	@Override
	public int c_attendance(Map<String, Object> map) {
		System.out.println("dao : c_attendance");
		int updateCnt = sqlSession.update("com.spring.tutorial.dao.AttendanceDAO.c_attendance", map);

		return updateCnt;
	}
	
	// 회사 업무종료 시간
	@Override
	public String c_attendout() {
		System.out.println("dao : c_attendout");
		String selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.AttendanceDAO.c_attendout");

		return selectCnt;
	}
}
