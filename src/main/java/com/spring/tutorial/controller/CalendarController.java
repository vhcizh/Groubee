package com.spring.tutorial.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	//캘린더메인
	@RequestMapping("calendar_main.ca")
	public String main(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller -> calendar_main.ca");
		return "calendar/calendar_main";
	}
	
	@RequestMapping("calendar.ca")
	public String calendar(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller -> calendar_main.ca");
		return "calendar/calendar";
	}
	
	@RequestMapping("oneDayEvent.ca")
	public String oneDayEvent(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("Maincontroller -> oneDayEvent.ca");
		return "calendar/oneDayEvent";
	}
}
