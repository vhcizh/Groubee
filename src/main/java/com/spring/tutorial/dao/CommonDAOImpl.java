package com.spring.tutorial.dao;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.util.SettingValues;



@Repository
public class CommonDAOImpl implements CommonDAO {
	@Autowired
    SqlSession sqlSession; 
	
	DataSource dataSource; 	
	
			
	// password와 암호화된 비밀번호 일치 확인
	@Override
	public String passwordCheck(String id){
		System.out.println("dao : 비밀번호 매칭");
		String encryptPassword = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.passwordCheck", id);
		
		return encryptPassword;
	}
	
	// 사원 등록 처리
	@Override
	public int insertMember(CommonDTO dto) {
		System.out.println("dao : 사원 등록 처리");					
		int insertCnt = sqlSession.insert("com.spring.tutorial.dao.CommonDAO.insertMember", dto);
		
		return insertCnt;		
	}
	
	// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	@Override
	public void sendEmail(String email, String key) {

		final String username = SettingValues.ADMIN; // 네이버 이메일 ID : @naver.com은 입력하지 않는다.
		final String password = SettingValues.PW; // 네이버 비밀번호 :
		final String host = "smtp.naver.com"; // Google일 경우 smtp.gmail.com
		int port = 465; // 포트번호

		// 메일 내용
		String recipient = "sujinlsj@naver.com"; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "[인사팀]사원 등록 인증 메일"; // 메일 제목 입력해주세요.

		String content = "사원 등록을 인증합니다. 링크를 눌러 사원 등록을 완료하세요." + "<a href='http://localhost/tutorial/emailChkAction.co?key="
				+ key + "'>링크</a>";

		Properties props = System.getProperties();

		// 정보를 담기 위한 객체 생성
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug

		try {
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("dbfldj801@naver.com")); 
			// 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일주소를 다 작성해주세요.
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅
			mimeMessage.setSubject(subject); // 제목셋팅
			// mimeMessage.setText(body); //내용셋팅
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
			System.out.println("<<<< Email SEND >>>>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 사원 정보 인증 [아이디 비밀번호]
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("dao : 사원 정보 인증 처리");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.idPasswordChk", map);

		return selectCnt;
	}
	
	// 퇴사 처리
	@Override
	public int deleteMember(String id) {
		System.out.println("dao : 사원 퇴사 처리");
		int deleteCnt = sqlSession.delete("com.spring.tutorial.dao.CommonDAO.deleteMember", id);
		
		return deleteCnt;
	}
	
	// 사원 상세 페이지
	@Override
	public CommonDTO getMemberDetail(String id) {
		System.out.println("dao : 사원 상세페이지");
		
		// id = ?인 회원의 정보 전체를 가져오려고 한다 > DTO에 모든 정보 담기
		CommonDTO dto = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.getMemberDetail", id);
		
		return dto;
	}
	
	// 사원 수정 처리
	@Override
	public int updateMember(CommonDTO dto) {
		System.out.println("dao : 사원 수정 처리");		
		int updateCnt = sqlSession.update("com.spring.tutorial.dao.CommonDAO.updateMember", dto);
			
		return updateCnt;
	}
	
	// 시큐리티 : 로그인 전 이메일 인증을 해야 한다.
	@Override
	public int selectKey(String key) {
		System.out.println("dao : key select");
		int selectCnt = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.selectKey", key);
		return selectCnt;
	}

	// 시큐리티 : 로그인 전 이메일 인증을 해야 하며, 1로 수정
	@Override
	public int updateGrade(String key) {
		System.out.println("dao : 이메일 인증 > 권한 수정");
		int updateCnt = sqlSession.update("com.spring.tutorial.dao.CommonDAO.updateGrade", key);
		return updateCnt;
	}
}
