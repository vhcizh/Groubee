package com.spring.tutorial.service.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

//로그인 실패시 작동 
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화 클래스
	
	//security-context.xml에서 매개변수 생성자 생성 후 매개변수로 전달
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}

	// 로그인이 실패할 경우 자동으로 실행하는 코드
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		System.out.println("<<< UserLoginFailureHandler - onAuthenticationFailure 진입 >>>");

		String id = request.getParameter("id");
		String strPwd = request.getParameter("pwd");

		int cnt = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.idCheck", id);
		if (cnt != 0) {
			// 암호화된 비밀번호 가져오기
			String encryptPassword = sqlSession.selectOne("com.spring.tutorial.dao.CommonDAO.pwdCheck", id);
			System.out.println("암호화된 비밀번호 : " + encryptPassword);
			System.out.println("화면에서 입력받은 비밀번호 : " + strPwd);

			// 입력한 비밀번호와 가입된 비밀번호(암호화된 비밀번호)가 일치하는지 여부
			if (passwordEncoder.matches(strPwd, encryptPassword)) {
				System.out.println("<<< 이메일 인증 >>>");
				request.setAttribute("errorMsg", "회원 가입 후 이메일 인증이 필요합니다.");
			} else {
				System.out.println("<<< 비밀번호 불일치 >>>");
				request.setAttribute("errorMsg", "회원님의 비밀번호가 일치하지 않습니다.");
			}

		} else {
			System.out.println("아이디 불일치");
			request.setAttribute("errorMsg", "아이디가 일치하지 않습니다.");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/login.jsp");
		dispatcher.forward(request, response);

	}

}