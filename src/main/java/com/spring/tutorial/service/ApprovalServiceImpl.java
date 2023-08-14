package com.spring.tutorial.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.tutorial.dao.ApprovalDAOImpl;
import com.spring.tutorial.dto.ApprovalInfoDTO;
import com.spring.tutorial.dto.ApproveDraftDTO;
import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.page.Paging;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	ApprovalDAOImpl dao;

	// 새결재진행 -> 결재정보뿌리기(같은부서)
	@Override
	public void selectFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectFormList");
		String id = (String) req.getSession().getAttribute("memberID");
		List<CommonDTO> list = dao.selectMember(id);
		model.addAttribute("list", list);
	}

	// 새결재진행 -> 모든부서뿌리기
	@Override
	public void selectAllFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectAllFormList");
		List<CommonDTO> list = dao.selectAllMember();
		model.addAttribute("list", list);
	}

	// 결재정보 저장
	@Override
	public void approvalInfoInsertAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - approvalInfoInsertAction");
		String category = req.getParameter("category");
		String[] getter_id = req.getParameterValues("getter_id");
		String id = (String) req.getSession().getAttribute("memberID");

		dao.approvalInfoDelete();
		if (getter_id != null) {
			for (int i = 0; i < getter_id.length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("category", category);
				map.put("id", id);
				map.put("getter_id", getter_id[i]);
				dao.approvalInfoInsert(map);
			}
		} else {
		}
	}
	
	//결재정보뿌리기(수정페이지)
	@Override
	public void selectupdateFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectupdateFormList");
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		System.out.println("doc_id: " + doc_id);
		List<CommonDTO> list = dao.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("load_id", doc_id);
		model.addAttribute("doc_id", doc_id);
	}

	
	//결재정보수정
	public void updateAppAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - updateAppAction");
		String category = req.getParameter("category");
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		String[] getter_id = req.getParameterValues("getter_id");
		String id = (String) req.getSession().getAttribute("memberID");

		dao.deleteLineforUpdate(load_id);
		if (getter_id != null) {
			for (int i = 0; i < getter_id.length; i++) {
				System.out.println(category + ", " + id + ", " + getter_id[i]);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("load_id", load_id);
				map.put("doc_id", doc_id);
				map.put("category", category);
				map.put("id", id);
				map.put("getter_id", getter_id[i]);
				dao.updateline(map);
			}
		} else {
			System.out.println("결재정보 저장에 실패했습니다");
		}
		
	}

	// 저장된 결제라인 정보 뿌리기
	@Override
	public void selectLineViewAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectLineViewAction");
		String id = (String) req.getSession().getAttribute("memberID");
		List<ApprovalInfoDTO> list = dao.selectLineView();
		List<CommonDTO> list2 = dao.selectapprover(id);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

	}
	

	// 수정시 결제라인 정보 뿌리기
	@Override
	public void reselectLineViewAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectLineViewAction");
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		
		List<ApprovalInfoDTO> list = dao.reselectLineView(doc_id);
		List<CommonDTO> list2 = dao.reselectapprover(doc_id);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

	}

	// 결재, 협조 수정하기
	@Override
	public void changecoApproveAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - changecoApproveAction");
		String co_approve = req.getParameter("co_approve");
		String getter_id = req.getParameter("getter_id");
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("co_approve", co_approve);
		map.put("getter_id", getter_id);
		map.put("load_id", load_id);
		dao.updateCoApproval(map);
	}

	// 결재라인 개별삭제
	@Override
	public void deleteco_approveAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - deleteco_approveAction");

		String getter_id = req.getParameter("getter_id");
		int load_id = Integer.parseInt(req.getParameter("load_id"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("getter_id", getter_id);
		map.put("load_id", load_id);

		dao.deleteCoApproval(map);

	}

	// 결재문서 선택
	@Override
	public void updateFormAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - deleteco_approveAction");

		String form_name = req.getParameter("form_name");
		dao.updateForm(form_name);

	}

	// 임시보관 insert
	@Override
	public void tempSaveAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("ApprovalService - tempSaveAction");
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		String id = (String) req.getSession().getAttribute("memberID");
		String depart_name = req.getParameter("depart_name");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String form_name = req.getParameter("form_name");

		MultipartFile file = req.getFile("files");

		try {

			String saveDir = req.getSession().getServletContext().getRealPath("/resources/draftupload/");
			System.out.println("saveDir: " + saveDir);

			String realDir = "C:/file/upload/";
			System.out.println("realDir: " + saveDir);
			FileInputStream fis = null;
			FileOutputStream fos = null;

			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();

		} catch (IOException e) {
			e.printStackTrace();

		} finally {

			System.out.println(
					depart_name + ", " + category + ", " + title + ", " + content + ", " + file + ", " + form_name);
			ApproveDraftDTO dto = new ApproveDraftDTO();
			dto.setLoad_id(load_id);
			dto.setId(id);
			dto.setDepart_name(depart_name);
			dto.setCategory(category);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setForm_name(form_name);

			String files = "/tutorial/resources/draftupload/" + file.getOriginalFilename();
			if (!files.equals("/tutorial/resources/draftupload/")) {
				System.out.println("dto.files(): " + files);
				dto.setFiles(files);
				dto.setNonfiles("none");
			} else {
				dto.setFiles(files);
				dto.setNonfiles(files);

			}
			dao.tempSave(dto);

			// 기안문서정보
			List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
			// 기안사원정보
			List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
			// 결재라인사원정보
			List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
		}
	}

	// 문서기안하기
	@Override
	public void approvereqAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("ApprovalService - approvereqAction");
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		String id = (String) req.getSession().getAttribute("memberID");
		String depart_name = req.getParameter("depart_name");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String form_name = req.getParameter("form_name");

		MultipartFile file = req.getFile("files");

		// 파일 유무에 관계없이 dao탈 수 있도록 예외처리
		try {

			String saveDir = req.getSession().getServletContext().getRealPath("/resources/draftupload/");
			System.out.println("saveDir: " + saveDir);

			String realDir = "C:/file/upload/";
			System.out.println("realDir: " + saveDir);
			FileInputStream fis = null;
			FileOutputStream fos = null;

			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();

		} catch (IOException e) {
			e.printStackTrace();

		} finally {
			// 무조건 dao타기
			System.out.println(
					depart_name + ", " + category + ", " + title + ", " + content + ", " + file + ", " + form_name);
			ApproveDraftDTO dto = new ApproveDraftDTO();
			dto.setLoad_id(load_id);
			dto.setId(id);
			dto.setDepart_name(depart_name);
			dto.setCategory(category);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setForm_name(form_name);

			// nullif함수로 파일 없으면 null 들어갈 수 있도록 처리(테이블, dto에 nullif용 컬럼(변수) 추가 필요)
			String files = "/tutorial/resources/draftupload/" + file.getOriginalFilename();
			if (!files.equals("/tutorial/resources/draftupload/")) {
				System.out.println("dto.files(): " + files);
				dto.setFiles(files);
				dto.setNonfiles("none");
			} else {
				dto.setFiles(files);
				dto.setNonfiles(files);

			}
			dao.approvereq(dto);

			// 기안문서정보
			List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
			// 기안사원정보
			List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
			// 결재라인사원정보
			List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
		}
	}

	// 기안-진행문서함리스트
	@Override
	public void onapprovalAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - onapprovalAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.boardCnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); 
		int end = paging.getEndRow(); 
		System.out.println("start: " + start);

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.onapproval(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 기안-완료문서함리스트(기안자시점)
	@Override
	public void comapprovalAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - comapprovalAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		if (stateid == null) {
			stateid = "0";
		}
		System.out.println("stateid:" + stateid);
		System.out.println("id:" + id);

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.comapprovalcnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); 
		int end = paging.getEndRow(); 

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.comapproval(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 기안-반려문서함리스트
	@Override
	public void rejapprovalAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectLineViewAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.boardCnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); 
		int end = paging.getEndRow(); 

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.rejapproval(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 임시보관함리스트
	@Override
	public void templistAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectLineViewAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.boardCnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작 번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.templist(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 임시보관함 개별삭제
	@Override
	public void deleteTemp(HttpServletRequest req, Model model) {
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));

		dao.deleteTemp(doc_id);
		dao.deleteTempLine(doc_id);

	}

	// 임시보관선택삭제
	@Override
	public void deleteTempchkAction(HttpServletRequest req, Model model) {
		String[] doc_id = req.getParameterValues("chkList");

		if (doc_id != null) {
			for (int i = 0; i < doc_id.length; i++) {
				dao.deleteTemp(Integer.parseInt(doc_id[i]));
				dao.deleteTempLine(Integer.parseInt(doc_id[i]));
				System.out.println("doc_id : " + doc_id[i]);
			}
		} else {
			System.out.println("수정불가");
		}

	}

	// 임시보관함 글 확인
	@Override
	public void doc_detailAction(HttpServletRequest req, Model model) {
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		List<ApproveDraftDTO> list = dao.selectDraftInfo(doc_id);
		List<ApprovalInfoDTO> list1 = dao.selectapproverAfterApp(doc_id);
		List<ApprovalInfoDTO> list2 = dao.selectGetterInfo(doc_id);
		int selectInt = dao.loadstatecheck(doc_id);
		model.addAttribute("selectInt", selectInt);
		System.out.println("selectInt : " + selectInt);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
	}

	// 회수하기
	@Override
	public void rollbackbtnApproval(HttpServletRequest req, Model model) {
		System.out.println("approvalService => rollbackAction");
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		dao.rollbackdoc(doc_id);
	}

	// 수정하기 상세페이지
	@Override
	public void modifydocAction(HttpServletRequest req, Model model) {
		System.out.println("approvalService => rollbackAction");
		int load_id = Integer.parseInt(req.getParameter("doc_id"));

		// 기안문서정보
		List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
		// 결재라인사원정보
		List<ApprovalInfoDTO> list2 = dao.selectGetterInfo(load_id);
		// 기안사원정보
		List<ApprovalInfoDTO> list3 = dao.selectapproverAfterApp(load_id);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);

	}

	// 임시보관 => 임시보관
	@Override
	public void tempSavetepAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("approvalService => tempSavetepAction");
		int doc_id = Integer.parseInt(req.getParameter("load_id"));
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		String id = (String) req.getSession().getAttribute("memberID");
		String depart_name = req.getParameter("depart_name");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String form_name = req.getParameter("form_name");

		String hiddenfiles = req.getParameter("hiddenfiles"); // 기존파일
		System.out.println("hiddenfiles : " + hiddenfiles);

		MultipartFile file = req.getFile("files"); 
		System.out.println("file : " + file);

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/draftupload/");
		System.out.println("saveDir : " + saveDir);

		String realDir = "C:/file/upload/";
		System.out.println("realDir : " + realDir);

		String files1 = "";
		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				try {
					file.transferTo(new File(saveDir + file.getOriginalFilename()));

					fis = new FileInputStream(saveDir + file.getOriginalFilename());
					fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (fis != null)
						fis.close();
					if (fos != null)
						fos.close();
				}
				files1 = "/tutorial/resources/draftupload/" + file.getOriginalFilename(); // 컨텍스트명/경로
				System.out.println("files1 : " + files1);
			} else {
				// 파일 수정 안할 경우

				files1 = hiddenfiles;
				System.out.println("기존파일 : " + files1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			ApproveDraftDTO dto = new ApproveDraftDTO();
			dto.setDoc_id(doc_id);
			dto.setLoad_id(load_id);
			dto.setId(id);
			dto.setDepart_name(depart_name);
			dto.setCategory(category);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setForm_name(form_name);

			if (!files1.equals("/tutorial/resources/draftupload/")) {
				System.out.println("dto.files(): " + files1);
				dto.setFiles(files1);
				dto.setNonfiles("none");
			} else {
				dto.setFiles(files1);
				dto.setNonfiles(files1);

			}

			dao.tempSavetep(dto);

			// 기안문서정보
			List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
			// 기안사원정보
			List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
			// 결재라인사원정보
			List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);

		}
	}

	// 임시보관 => 기안
	@Override
	public void approvereqtepAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("approvalService => approvereqtepAction");
		int doc_id = Integer.parseInt(req.getParameter("load_id"));
		int load_id = Integer.parseInt(req.getParameter("load_id"));
		String id = (String) req.getSession().getAttribute("memberID");
		String depart_name = req.getParameter("depart_name");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String form_name = req.getParameter("form_name");

		String hiddenfiles = req.getParameter("hiddenfiles"); // 기존파일
		System.out.println("hiddenfiles : " + hiddenfiles);

		MultipartFile file = req.getFile("files"); // 새로 담은 파일
		System.out.println("file : " + file);

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/draftupload/"); // upload경로
		System.out.println("saveDir : " + saveDir);

		String realDir = "C:/file/upload/";
		System.out.println("realDir : " + realDir);

		String files1 = "";
		FileInputStream fis = null;
		FileOutputStream fos = null;

		// 파일이 없을 경우 예외처리
		try {
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				try {
					file.transferTo(new File(saveDir + file.getOriginalFilename()));

					fis = new FileInputStream(saveDir + file.getOriginalFilename());
					fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (fis != null)
						fis.close();
					if (fos != null)
						fos.close();
				}
				files1 = "/tutorial/resources/draftupload/" + file.getOriginalFilename(); // 컨텍스트명/경로
				System.out.println("files1 : " + files1);
			} else {
				// 파일 수정 안할 경우

				files1 = hiddenfiles;
				System.out.println("기존파일 : " + files1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 파일이 없어도 에러 없이 dto에 담아서 dao호출
			ApproveDraftDTO dto = new ApproveDraftDTO();
			dto.setDoc_id(doc_id);
			dto.setLoad_id(load_id);
			dto.setId(id);
			dto.setDepart_name(depart_name);
			dto.setCategory(category);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setForm_name(form_name);

			// 파일이 없으면 null, 있으면 파일String dto에 담기
			// *컬럼 및 dto에 null을 내보내기 위한 컬럼 하나 추가필수
			if (!files1.equals("/tutorial/resources/draftupload/")) {
				System.out.println("dto.files(): " + files1);
				dto.setFiles(files1);
				dto.setNonfiles("none");
			} else {
				dto.setFiles(files1);
				dto.setNonfiles(files1);

			}

			dao.approvereqtep(dto);

			// 기안문서정보
			List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
			// 기안사원정보
			List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
			// 결재라인사원정보
			List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);

		}

	}

	// 결재대기함 리스트
	@Override
	public void checkoutlistAction(HttpServletRequest req, Model model) {
		System.out.println("approvalService => checkoutlistAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.checkoutboardCnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작 번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		System.out.println("id :" + id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.checkoutlist(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 결재 대기문서 상세페이지
	@Override
	public void checkoutdocAction(HttpServletRequest req, Model model) {
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		List<ApproveDraftDTO> list = dao.selectDraftInfo(doc_id);
		List<ApprovalInfoDTO> list1 = dao.selectapproverAfterApp(doc_id);
		List<ApprovalInfoDTO> list2 = dao.selectGetterInfo(doc_id);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
	}

	// 결재하기
	@Override
	public void checkoutAction(HttpServletRequest req, Model model) {
		int load_id = Integer.parseInt(req.getParameter("doc_id"));
		String id = (String) req.getSession().getAttribute("memberID");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("load_id", load_id);
		map.put("id", id);

		dao.confirmdraft(map);
		dao.completedraft(load_id);

		// 기안문서정보
		List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
		// 기안사원정보
		List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
		// 결재라인사원정보
		List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);

	}

	// 반려하기
	@Override
	public void rejectdocAction(HttpServletRequest req, Model model) {
		int load_id = Integer.parseInt(req.getParameter("doc_id"));
		dao.rejectdraft(load_id);
		dao.rejectstatechg(load_id);

		// 기안문서정보
		List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
		// 기안사원정보
		List<ApprovalInfoDTO> list2 = dao.selectapproverAfterApp(load_id);
		// 결재라인사원정보
		List<ApprovalInfoDTO> list3 = dao.selectGetterInfo(load_id);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
	}

	// 결재예정함 리스트
	@Override
	public void prechecklistAction(HttpServletRequest req, Model model) {
		System.out.println("approvalService => prechecklistAction");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.preApplistcnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작 번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("getter_id", id);
		System.out.println("id :" + id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.preApplist(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 부서문서함 리스트
	@Override
	public void departdoclist(HttpServletRequest req, Model model) {
		System.out.println("approvalService => departdoclist");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");
		String stateid = req.getParameter("stateid");

		System.out.println("stateid:" + stateid);
		if (stateid == null) {
			stateid = "0";
		}

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("stateid", stateid);

		int total = dao.completedraftListbyDepartcnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작 번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		System.out.println("id :" + id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.completedraftListbyDepart(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 완료문서 상세페이지
	@Override
	public void confirmedDraft(HttpServletRequest req, Model model) {
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		List<ApproveDraftDTO> list = dao.selectDraftInfo(doc_id);
		List<ApprovalInfoDTO> list1 = dao.selectapproverAfterApp(doc_id);
		List<ApprovalInfoDTO> list2 = dao.selectGetterInfo(doc_id);
		int selectInt = dao.loadstatecheck(doc_id);
		model.addAttribute("selectInt", selectInt);
		System.out.println("selectInt : " + selectInt);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);

	}

	// 결재완료함(결재자시점)
	@Override
	public void confirmedDraftlistActionGetter(HttpServletRequest req, Model model) {
		System.out.println("approvalService => confirmedDraftlistActionGetter");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);

		int total = dao.completedraftListbygettercnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow(); // 페이지별 시작 번호
		int end = paging.getEndRow(); // 페이지별 끝번호

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.completedraftListbygetter(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 결재대기함 뱃지
	public void checkoutBadgeAction(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("memberID");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		int checkoutcnt = dao.checkoutboardCnt(map);
		System.out.println("checkoutcnt:" + checkoutcnt);
		model.addAttribute("checkoutcnt", checkoutcnt);
	}

	// 회람하기
	@Override
	public void referAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - referAction");
		String[] id = req.getParameterValues("id");
		int load_id = Integer.parseInt(req.getParameter("load_id"));

		Map<String, Object> map = new HashMap<String, Object>();
		if (id != null) {
			for (int i = 0; i < id.length; i++) {
				map.put("load_id", load_id);
				map.put("id", id[i]);
				dao.referAction(map);
				System.out.println("load_id: " + load_id);
				System.out.println("id: " + id[i]);
			}
		} else {
		}

		// 기안문서정보
		List<ApproveDraftDTO> list = dao.selectDraftInfo(load_id);
		List<ApprovalInfoDTO> list2 = dao.refermember(load_id);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

	}

	// 회람문서함
	@Override
	public void referlist(HttpServletRequest req, Model model) {
		System.out.println("approvalService => referlist");
		String id = (String) req.getSession().getAttribute("memberID");
		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("id", id);

		int total = dao.referlistActioncnt(map2);
		System.out.println("게시물 total : " + total);
		paging.setTotalCount(total);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<ApproveDraftDTO> list = null;
		if (total > 0) {
			list = dao.referlistAction(map);
		}

		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 회람라인리스트
	@Override
	public void refermemberlist(HttpServletRequest req, Model model) {
		int load_id = Integer.parseInt(req.getParameter("doc_id"));
		List<CommonDTO> list = dao.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("load_id", load_id);

	}

	//관리자 통합문서함
	@Override
	public void adminApprovallistAction(HttpServletRequest req, Model model) {
		
		String stateid = req.getParameter("stateid");
		String pageNum = req.getParameter("pageNum");
		String category = req.getParameter("category");		
		System.out.println("stateid : " + stateid);
		Paging paging = new Paging(pageNum);
		List<ApproveDraftDTO> list = new ArrayList<ApproveDraftDTO>();
		
		if(category == null) {
		Map<String, Object> map2 = new HashMap<>();
		map2.put("stateid", stateid);
		
		int total = dao.approvallistAdminAllCnt(map2);
		paging.setTotalCount(total);

		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("stateid", stateid);

		if (total > 0) {
			list = dao.approvallistAdminAll(map);
		}
		} else {
			Map<String, Object> map2 = new HashMap<>();
			if (category != null) {
			map2.put("category", category);
			map2.put("stateid", stateid);
			} else {
				category = "내부기안";
				map2.put("category", category);
				map2.put("stateid", stateid);
				System.out.println("2category = " + category);
			}
				
			int total = dao.adminApprovalListCnt(map2);
			System.out.println("게시물 total : " + total);
			paging.setTotalCount(total);

			int start = paging.getStartRow();
			int end = paging.getEndRow();
			
			Map<String, Object> map = new HashMap<>();
			if (category != null){
				map.put("start", start);
				map.put("end", end);
				map.put("category", category);
				map.put("stateid", stateid);
			} else {
				category = "내부기안";
				map.put("start", start);
				map.put("end", end);
				map.put("category", category);
				map.put("stateid", stateid);
			}
			
			String statename = null;
			ApproveDraftDTO dto = new ApproveDraftDTO();
//			List<ApproveDraftDTO> list = new ArrayList<ApproveDraftDTO>();
			if (total > 0) {
				list = dao.approvallistAdmin(map);
				statename = list.get(0).getState();
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("stateid", stateid);
}


	//관리자 통합문서함 - 전체보기
	@Override
	public void adminApprovallistAllAction(HttpServletRequest req, Model model) {
		
			String stateid = req.getParameter("stateid");
			String pageNum = req.getParameter("pageNum");
			String category = req.getParameter("category");		
			System.out.println("stateid : " + stateid);
			Paging paging = new Paging(pageNum);
			List<ApproveDraftDTO> list = new ArrayList<ApproveDraftDTO>();
			
			if(category == null) {
			Map<String, Object> map2 = new HashMap<>();
			map2.put("stateid", stateid);
			
			int total = dao.approvallistAdminAllCnt(map2);
			System.out.println("게시물 total : " + total);
			paging.setTotalCount(total);

			int start = paging.getStartRow();
			int end = paging.getEndRow();
			
			Map<String, Object> map = new HashMap<>();
				map.put("start", start);
				map.put("end", end);
				map.put("stateid", stateid);

			if (total > 0) {
				list = dao.approvallistAdminAll(map);
			}
			} else {
				Map<String, Object> map2 = new HashMap<>();
				if (category != null) {
				map2.put("category", category);
				map2.put("stateid", stateid);
				} else {
					category = "내부기안";
					map2.put("category", category);
					map2.put("stateid", stateid);
					System.out.println("2category = " + category);
				}
					
				int total = dao.adminApprovalListCnt(map2);
				System.out.println("게시물 total : " + total);
				paging.setTotalCount(total);

				int start = paging.getStartRow();
				int end = paging.getEndRow();
				
				Map<String, Object> map = new HashMap<>();
				if (category != null){
					map.put("start", start);
					map.put("end", end);
					map.put("category", category);
					map.put("stateid", stateid);
				} else {
					category = "내부기안";
					map.put("start", start);
					map.put("end", end);
					map.put("category", category);
					map.put("stateid", stateid);
				}
				
				String statename = null;
				ApproveDraftDTO dto = new ApproveDraftDTO();
//				List<ApproveDraftDTO> list = new ArrayList<ApproveDraftDTO>();
				if (total > 0) {
					list = dao.approvallistAdmin(map);
					statename = list.get(0).getState();
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("stateid", stateid);
	}


}
