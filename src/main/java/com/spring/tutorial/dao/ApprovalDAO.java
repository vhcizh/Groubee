package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.ApprovalInfoDTO;
import com.spring.tutorial.dto.ApproveDraftDTO;
import com.spring.tutorial.dto.CommonDTO;

public interface ApprovalDAO {

	// 결재정보 - 회원정보데려오기
	public List<CommonDTO> selectMember(String id);
	
	// 결재정보 - 모든 부서회원정보데려오기
	public List<CommonDTO> selectAllMember();

	// 결재정보 저장
	public void approvalInfoInsert(Map<String, Object> map);

	// 저장된 결재 정보 뿌리기
	public List<ApprovalInfoDTO> selectLineView();

	// 협조, 결재 수정하기
	public void updateCoApproval(Map<String, Object> map);

	// 결재라인 개별삭제
	public void deleteCoApproval(Map<String, Object> map);

	// 문서양식 선택
	public void updateForm(String form_name);

	// 로그인 사원 정보(기안자)
	public List<CommonDTO> selectapprover(String id);

	// 기안 후 기안사원 정보
	public List<ApprovalInfoDTO> selectapproverAfterApp(int load_id);

	// 임시저장
	public void tempSave(ApproveDraftDTO dto);

	// 기안하기
	public void approvereq(ApproveDraftDTO dto);

	// 문서정보
	public List<ApproveDraftDTO> selectDraftInfo(int load_id);

	// 결재라인 사원정보
	public List<ApprovalInfoDTO> selectGetterInfo(int load_id);

	// 진행문서함리스트
	public List<ApproveDraftDTO> onapproval(Map<String, Object> map);

	// 진행함 글 갯수
	public int boardCnt(Map<String, Object> map);

	// 완료문서함리스트
	public List<ApproveDraftDTO> comapproval(Map<String, Object> map);

	// 완료문서함-기안자 게시글 갯수
	public int comapprovalcnt(Map<String, Object> map);

	// 반려문서함리스트
	public List<ApproveDraftDTO> rejapproval(Map<String, Object> map);

	// 임시보관함
	public List<ApproveDraftDTO> templist(Map<String, Object> map);

	// 임시보관함 삭제
	public void deleteTemp(int doc_id);

	// 임시보관함 결재라인삭제
	public void deleteTempLine(int load_id);

	// 결재선 내에서 한 명이라도 결재했는지 여부(회수버튼)
	public int loadstatecheck(int load_id);

	// 회수하기
	public void rollbackdoc(int doc_id);

	// 임시보관, 미결재기안문 -> 임시보관
	public void tempSavetep(ApproveDraftDTO dto);

	// 임시보관 -> 기안
	public void approvereqtep(ApproveDraftDTO dto);

	//////////////////
	// 결재대기문서 리스트
	public List<ApproveDraftDTO> checkoutlist(Map<String, Object> map);

	// 결재대기문서함 cnt
	public int checkoutboardCnt(Map<String, Object> map);

	// 결재대기문서 반려하기
	public void rejectdraft(int load_id);

	// 결재대기문서 반려 후 결재 상태 결재대기로 변경
	public void rejectstatechg(int load_id);

	// 결재대기문서 결재하기
	public void confirmdraft(Map<String, Object> map);

	// 최종 결재자 결재 시 결재완료로 변경
	public void completedraft(int load_id);

	// 결재예정함 리스트
	public List<ApproveDraftDTO> preApplist(Map<String, Object> map);

	// 결재예정함 cnt
	public int preApplistcnt(Map<String, Object> map);

	// 결재완료문서 리스트(결재자시점)
	public List<ApproveDraftDTO> completedraftListbygetter(Map<String, Object> map);

	// 결재완료문서(결재자시점 cnt
	public int completedraftListbygettercnt(Map<String, Object> map);

	// 부서별 결재완료문서 리스트
	public List<ApproveDraftDTO> completedraftListbyDepart(Map<String, Object> map);

	// 부서별 결재완료문서 cnt
	public int completedraftListbyDepartcnt(Map<String, Object> map);
	
	//회람하기
	public int referAction(Map<String, Object> map);
	
	//회람문서함
	public List<ApproveDraftDTO> referlistAction(Map<String, Object> map);
	
	//회람문서함 글 갯수
	public int referlistActioncnt(Map<String, Object> map);

	//회람자리스트
	public List<ApprovalInfoDTO> refermember(int load_id);
	
	//회람여부 확인
	public int selectrefer(Map<String, Object> map);
	
	//결재라인수정
	public void deleteLineforUpdate (int load_id);
	
	//결재라인수정
	public void updateline (Map<String, Object> map);
	
	// 저장된 로그인 사원 정보(기안자)
	public List<CommonDTO> reselectapprover(int doc_id);
	
	// 저장된 결재 정보 뿌리기
	public List<ApprovalInfoDTO> reselectLineView(int doc_id);
	
	// 관리자 완료문서함
	public List<ApproveDraftDTO> approvallistAdmin(Map<String, Object> map);
	
	// 관리자 완료문서함 글 갯수
	public int adminApprovalListCnt(Map<String, Object> map);
	
	//관리자 문서함 전체보기
	public List<ApproveDraftDTO> approvallistAdminAll(Map<String, Object> map);
	
	// 관리자 문서함 전체보기 글 갯수
	public int approvallistAdminAllCnt(Map<String, Object> map);
	
}
