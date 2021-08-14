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
	@RequestMapping(value="/movingcloset/search.do", method=RequestMethod.GET)
	public String searchPage(Locale locale, Model model) {
		
		return "body/search";
	}
	
	
	//뉴디
	@RequestMapping(value="/movingcloset/newD.do", method=RequestMethod.GET)
	public String newDmain(Locale locale, Model model) {
		
		return "body/newD_main";
	}
	
	//로그인
	@RequestMapping(value="/movingcloset/login.do", method=RequestMethod.GET)
	public String newDmain() {
		
		return "body/login";
	}
	
	//쪼르깅
	@RequestMapping(value="/movingcloset/myplease2.do", method=RequestMethod.GET)
	public String myPlease2(Locale locale, Model model) {
		return "body/myPlease2";
	}
	
	//메인
	@RequestMapping(value="/movingcloset/main.do", method=RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	
	//이용약관
	@RequestMapping(value="/movingcloset/terms.do", method=RequestMethod.GET)
	public String terms(Locale locale, Model model) {
		return "body/terms";
	}
	//개인정보처리방침
	@RequestMapping(value="/movingcloset/privacy.do", method=RequestMethod.GET)
	public String privacy(Locale locale, Model model) {
		return "body/privacy";
	}
	//위치정보이용약관
	@RequestMapping(value="/movingcloset/rules_loc.do", method=RequestMethod.GET)
	public String rules_loc(Locale locale, Model model) {
		return "body/rules_loc";
	}
	
	
	
}
	
	
