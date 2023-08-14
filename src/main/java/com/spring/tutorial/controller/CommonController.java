package com.spring.tutorial.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.spring.tutorial.service.AttendanceServiceImpl;
import com.spring.tutorial.service.CommonServiceImpl;

@Controller
public class CommonController {
	@Autowired
	CommonServiceImpl service;
	
	@Autowired
	AttendanceServiceImpl service_at;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	// 메인 페이지
	@RequestMapping("index.co")
	public String index(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller > index.co");
		service_at.attendance(req, model);
		service_at.attendanceMonth(req, model);
		
//		ChromeOptions options = new ChromeOptions();
//		options.addArguments("headless");
//		
//		WebDriver driver = new ChromeDriver(options);
//		
//		String url = "https://www.naver.com";
//		driver.get(url);
//		
//		try {Thread.sleep(1000);} catch (InterruptedException e) {}
//		
//		List<WebElement> el1 = driver.findElements(By.className("nav"));
//		
//		for (int i = 0; i < el1.size(); i++) {
//			//nav 클래스의 객체 중 "뉴스"라는 텍스트를 가진 WebElement를 클릭한다.
//			if(el1.get(i).getText().equals("뉴스")) {
//				el1.get(i).click();
//				break;
//			}
//		}
		
		Document doc = Jsoup.connect("https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=103").get();
		Elements el = doc.getElementsByAttributeValue("class", "nclicks(rig.secteco)");
		
		Document doc_weather = Jsoup.connect("https://weather.naver.com/").get();
		Elements el_weather = doc_weather.getElementsByAttributeValue("class", "day_data");
		Elements sunny = doc_weather.getElementsByAttributeValue("class", "ico_wt1");
		Elements cloudy = doc_weather.getElementsByAttributeValue("class", "ico_wt5");
		Elements weather_status = doc_weather.getElementsByAttributeValue("class", "weather");
		
		Document doc_weatherImg = Jsoup.connect("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%98%A4%EB%8A%98%EC%9D%98+%EB%82%A0%EC%94%A8").get();
		Elements weatherImg = doc_weatherImg.getElementsByAttributeValue("class", "weather_main");
		
		model.addAttribute("el", el);
		model.addAttribute("el_weather", el_weather);
		model.addAttribute("sunny", sunny);
		model.addAttribute("cloudy", cloudy);
		model.addAttribute("weather_status", weather_status);
		model.addAttribute("weatherImg", weatherImg);
		
		return "common/index";
	}
	// 로그인
	@RequestMapping("login.co")
	public String login(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller > login.co");
		return "common/login";
	}
	
	// 사원 등록
	@RequestMapping("join.co")
	public String join(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller > join.co");
		
		return "common/join";
	}
	
	// 사원 등록 처리
	@RequestMapping("join_action.co")
	public String join_aciton(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller > join_aciton.co");
		
		service.signInAction(req, model);
		return "common/join_action";
	}
	
	
	// 이메일 로그인
	@RequestMapping("email_login.co")
	public String email_login(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller > email_login.co");
		
		return "common/email_login";
	}
	
	// 로그아웃
    @RequestMapping("logout.co")
    public void logout(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
       logger.info("Maincontroller > logout.do]");
       req.getSession().invalidate(); // 세션 삭제
       String viewPage = req.getContextPath() + "/login.co";
       res.sendRedirect(viewPage);
    }
    
    // 시큐리티 - 가입성공시 이메일인증을 위해 이메일 인증 후 enabled 권한을 1로 update
    // CustomerDAOImpl의 sendEmail(String email, String key)에서 호출
    @RequestMapping("emailChkAction.co")
    public String emailChk(HttpServletRequest req,  Model model) {
       logger.info("Maincontroller > emailChkAction.do");
       
       service.emailChkAction(req, model);
       return "common/emailChkAction";
    } 
    
}
