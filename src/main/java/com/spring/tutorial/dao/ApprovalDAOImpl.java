package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.ApprovalInfoDTO;
import com.spring.tutorial.dto.ApproveDraftDTO;
import com.spring.tutorial.dto.CommonDTO;
@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	@Autowired
	SqlSession sqlSession;
	
	//결재정보 리스트 불러오기
	@Override
	public List<CommonDTO> selectMember(String id) {
		System.out.println("ApprovalDAO - selectMember");
		List<CommonDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectMember", id);
		return list;
	}
	
	//모든 부서 결재정보 리스트 불러오기
	@Override
	public List<CommonDTO> selectAllMember() {
		System.out.println("ApprovalDAO - selectAllMember");
		List<CommonDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectAllMember");
		return list;
	}

	//결재정보 삭제 - 다시  insert하기 위함
	public int approvalInfoDelete() {
		System.out.println("ApprovalDAO - approvalInfoDelete");
		int deleteInt = 0;
		int selectCnt  = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.approvalInfoDel_sel");
		if (selectCnt != 0) {
			deleteInt  = sqlSession.delete("com.spring.tutorial.dao.ApprovalDAO.approvalInfoDelete");
		}
		return deleteInt;
	}
	
	//결재정보 저장
	@Override
	public void approvalInfoInsert(Map<String, Object> map) {
		System.out.println("ApprovalDAO - approvalInfoInsert");
		sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.approvalInfoInsert", map);
		
	}


	//저장된 결재정보 뿌리기
	@Override
	public List<ApprovalInfoDTO> selectLineView() {
		System.out.println("ApprovalDAO - selectLineView");
		List<ApprovalInfoDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectLineView");
		return list;
	}

	//결재, 협조 수정하기
	@Override
	public void updateCoApproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - updateCoApproval");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.updateCoApproval", map);
		
	}

	//결재라인 개별삭제
	@Override
	public void deleteCoApproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - deleteCoApproval");
		sqlSession.delete("com.spring.tutorial.dao.ApprovalDAO.deleteCoApproval", map);
	}
	
	//기안사원정보
	@Override
	public List<CommonDTO> selectapprover(String id) {
		System.out.println("ApprovalDAO - selectapprover");
		List<CommonDTO> list2 = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectapprover", id);
		return list2;
	}
	
	//문서 저장 후 기안사원정보
	@Override
	public List<ApprovalInfoDTO> selectapproverAfterApp(int load_id) {
		System.out.println("ApprovalDAO - selectapproverAfterApp");
		List<ApprovalInfoDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectapproverAfterApp", load_id);
		return list;
	}
	
	//기안하기
	@Override
	public void approvereq(ApproveDraftDTO dto) {
		System.out.println("ApprovalDAO - approvereq");
		sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.approvereq", dto);
	}

	//임시저장
	@Override
	public void tempSave(ApproveDraftDTO dto) {
		System.out.println("ApprovalDAO - tempSave");
		sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.tempSave", dto);
	}

	//문서정보
	@Override
	public List<ApproveDraftDTO> selectDraftInfo(int load_id) {
		System.out.println("ApprovalDAO - selectDraftInfo");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectDraftInfo", load_id);
		return list;
	}
	
	//결재라인 사원정보
	@Override
	public List<ApprovalInfoDTO> selectGetterInfo(int load_id) {
		System.out.println("ApprovalDAO - selectapprover");
		List<ApprovalInfoDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.selectGetterInfo", load_id);
		return list;
	}

	//결재문서 선택
	@Override
	public void updateForm(String form_name) {
		System.out.println("ApprovalDAO - updateForm");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.updateForm", form_name);
	}

	
	//기안진행문서함
	@Override
	public List<ApproveDraftDTO> onapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - onapproval");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.onapproval", map);
		return list;
	}

	//완료문서함 - 기안자시점
	@Override
	public List<ApproveDraftDTO> comapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - comapproval");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.comapproval", map);
		return list;
	}

	//반려문서함
	@Override
	public List<ApproveDraftDTO> rejapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - rejapproval");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.rejapproval", map);
		return list;
	}

	//임시보관함
	@Override
	public List<ApproveDraftDTO> templist(Map<String, Object> map) {
		System.out.println("ApprovalDAO - templist");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.templist", map);
		return list;
	}

	//게시물갯수
	@Override
	public int boardCnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - boardCnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.boardCnt", map);
		return total;
	}

	//임시보관함삭제
	public void deleteTemp(int doc_id) {
		System.out.println("ApprovalDAO - deleteTemp");
		sqlSession.delete("com.spring.tutorial.dao.ApprovalDAO.deleteTemp", doc_id);
		
	}

	//결재라인삭제
	@Override
	public void deleteTempLine(int load_id) {
		System.out.println("ApprovalDAO - deleteTempLine");
		sqlSession.delete("com.spring.tutorial.dao.ApprovalDAO.deleteTempLine", load_id);
		
	}

	//결재라인 별 결재 1명이라도 있는지 여부 check(회수버튼)
	@Override
	public int loadstatecheck(int load_id) {
		System.out.println("ApprovalDAO - loadstatecheck");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.loadstatecheck", load_id);
		return selectCnt;
	}

	//회수하기
	@Override
	public void rollbackdoc(int doc_id) {
		System.out.println("ApprovalDAO - rollbackdoc");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.rollbackdoc", doc_id);
	}

	
	//임시보관 -> 임시보관
	@Override
	public void tempSavetep(ApproveDraftDTO dto) {
		System.out.println("ApprovalDAO - tempSavetep");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.tempSavetep", dto);
		
	}

	//임시보관 -> 기안하기
	@Override
	public void approvereqtep(ApproveDraftDTO dto) {
		System.out.println("ApprovalDAO - approvereqtep");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.approvereqtep", dto);
		
	}

	//결재대기문서 리스트 
	@Override
	public List<ApproveDraftDTO> checkoutlist(Map<String, Object> map) {
		System.out.println("ApprovalDAO - checkoutlist");
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.checkoutlist", map);
		return list;
	}

	//결재대기문서 반려하기
	@Override
	public void rejectdraft(int load_id) {
		System.out.println("ApprovalDAO - rejectdraft");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.rejectdraft", load_id);
		
	}

	//결재대기문서 반려 후 결재 상태 결재대기로 변경
	@Override
	public void rejectstatechg(int load_id) {
		System.out.println("ApprovalDAO - rejectstatechg");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.rejectstatechg", load_id);
		
	}

	
	//결재대기문서 결재하기
	@Override
	public void confirmdraft(Map<String, Object> map) {
		System.out.println("ApprovalDAO - confirmdraft");
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.confirmdraft", map);
		
	}
	
	//최종 결재자 결재 시 결재완료로 변경
	@Override
	public void completedraft(int load_id) {
		sqlSession.update("com.spring.tutorial.dao.ApprovalDAO.completedraft", load_id);		
	}

	//결재예정함 리스트
	@Override
	public List<ApproveDraftDTO> preApplist(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.preApplist", map);
		return list;
	}
	
	// 리스트(결재자시점)
	@Override
	public List<ApproveDraftDTO> completedraftListbygetter(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.completedraftListbygetter", map);
		return list;
	}

	//부서별 결재완료문서 리스트
	@Override
	public List<ApproveDraftDTO> completedraftListbyDepart(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.completedraftListbyDepart", map);
		return list;
	}

	//결재대기 문서함 cnt
	@Override
	public int checkoutboardCnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - checkoutboardCnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.checkoutboardCnt", map);
		return total;
	}

	//결재문서함(기안자) cnt
	@Override
	public int comapprovalcnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - comapprovalcnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.comapprovalcnt", map);
		return total;
	}

	//결재예정함 cnt
	@Override
	public int preApplistcnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - preApplistcnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.preApplistcnt", map);
		return total;
	}


	//결재완료함 - 결재자기안cnt
	@Override
	public int completedraftListbygettercnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - completedraftListbygettercnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.completedraftListbygettercnt", map);
		return total;
	}
	
	

	//부서별 결재완료문서 게시글 cnt
	@Override
	public int completedraftListbyDepartcnt(Map<String, Object> map) {
		System.out.println("ApprovalDAO - completedraftListbyDepartcnt");
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.completedraftListbyDepartcnt", map);
		return total;
	}

	//회람하기
	@Override
	public int referAction(Map<String, Object> map) {
		int selectcnt = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.selectrefer", map);
		if (selectcnt == 0) {
			sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.referAction", map);
		}
		return selectcnt;
		
	}

	//회람문서함
	@Override
	public List<ApproveDraftDTO> referlistAction(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.referlistAction", map);
		return list;
	}

	//회람문서함 글갯수
	@Override
	public int referlistActioncnt(Map<String, Object> map) {
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.referlistActioncnt", map);		
		return total;
	}
	
	//회람자 리스트
	@Override
	public List<ApprovalInfoDTO> refermember(int load_id) {
		List<ApprovalInfoDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.refermember", load_id);		
		return list;
	}
	
	//회람여부 확인
	public int selectrefer(Map<String, Object> map) {
		int selectcnt = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.selectrefer", map);
		if (selectcnt != 0) {
			sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.referAction", map);
		}
		return selectcnt;
		
		
	}

	//결재라인수정(삭제)
	@Override
	public void deleteLineforUpdate(int load_id) {
		System.out.println("dao  + deleteLineforUpdate");
		sqlSession.delete("com.spring.tutorial.dao.ApprovalDAO.deleteLineforUpdate", load_id);
		
	}

	//결재라인수정
	@Override
	public void updateline(Map<String, Object> map) {
		System.out.println("dao  + updateline");
		sqlSession.insert("com.spring.tutorial.dao.ApprovalDAO.updateline", map);
		
	}

	//결재자 재선택
	@Override
	public List<CommonDTO> reselectapprover(int doc_id) {
		List<CommonDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.reselectapprover", doc_id);
		return list;
	}
	
	//결재정보재선택
	@Override
	public List<ApprovalInfoDTO> reselectLineView(int doc_id) {
		List<ApprovalInfoDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.reselectLineView", doc_id);
		return list;
	}

	//관리자 통합문서함
	@Override
	public List<ApproveDraftDTO> approvallistAdmin(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.approvallistAdmin", map);
		return list;
	}

	
	//관리자 완료문서함 글 갯수
	@Override
	public int adminApprovalListCnt(Map<String, Object> map) {
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.adminApprovalListCnt", map);		
		return total;
	}

	//관리자 문서함 전체보기
	@Override
	public List<ApproveDraftDTO> approvallistAdminAll(Map<String, Object> map) {
		List<ApproveDraftDTO> list = sqlSession.selectList("com.spring.tutorial.dao.ApprovalDAO.approvallistAdminAll", map);
		return list;
	}

	//관리자 문서함 전체보기 글갯수
	@Override
	public int approvallistAdminAllCnt(Map<String, Object> map) {
		int total = sqlSession.selectOne("com.spring.tutorial.dao.ApprovalDAO.approvallistAdminAllCnt", map);		
		return total;
	}

	

}
