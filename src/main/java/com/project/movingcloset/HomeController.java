package com.project.movingcloset;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	
	// 검색페이지
	@RequestMapping(value="/project/search.do", method=RequestMethod.GET)
	public String searchPage(Locale locale, Model model) {
		
		return "body/search";
	}
	

	// 공지사항
	@RequestMapping(value="/project/notice.do", method=RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		
		return "body/notice_list";
	}
	// 공지사항_내용
	@RequestMapping(value="/project/noticedetail.do", method=RequestMethod.GET)
	public String noticeDetail(Locale locale, Model model) {
			
		return "body/notice_detail";
	}
		
	// FAQ랑 QnA
	@RequestMapping(value="/project/qnalist.do", method=RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
				
		return "body/qna_list";
	}
	// QnA 상세
	@RequestMapping(value="/project/qnadetail.do", method=RequestMethod.GET)
	public String qnaDetail(Locale locale, Model model) {
				
		return "body/qna_detail";
	}
	// 질문 폼
	@RequestMapping(value="/project/question.do", method=RequestMethod.GET)
	public String qnaForm(Locale locale, Model model) {
			
		return "body/qna_form";
	}
	
	// 모여
	@RequestMapping(value="/project/moyo.do", method=RequestMethod.GET)
	public String moyo() {
		
		return "body/moyo";
	}
	
	// 모여신청폼
	@RequestMapping(value="/project/moyoForm.do", method=RequestMethod.GET)
	public String moyoForm() {
		
		return "body/moyoForm";
	}
	
	
	//뉴디
	@RequestMapping(value="/project/newD.do", method=RequestMethod.GET)
	public String newDmain(Locale locale, Model model) {
		
		return "body/newD_main";
	}
	
	//로그인
	@RequestMapping(value="/project/login.do", method=RequestMethod.GET)
	public String newDmain() {
		
		return "body/login";
	}
	
	// 쪼르기(은서 부분)
	@RequestMapping(value="/project/myplease.do", method=RequestMethod.GET)
	public String myPlease(Locale locale, Model model) {
		return "body/myPlease";
	}
	@RequestMapping(value="/project/myplease2.do", method=RequestMethod.GET)
	public String myPlease2(Locale locale, Model model) {
		return "body/myPlease2";
	}
	
	
	
	
	
	
}
