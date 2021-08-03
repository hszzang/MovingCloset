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
	
	@RequestMapping(value="/project/test.do", method=RequestMethod.GET)
	public String boardList(Locale locale, Model model) {
		
		return "body/store_detail";
	}
	
	@RequestMapping(value="/project/test1.do", method=RequestMethod.GET)
	public String storeList(Locale locale, Model model) {
		
		return "body/store_list";
	}
	
	// 검색페이지
	@RequestMapping(value="/project/test2.do", method=RequestMethod.GET)
	public String searchPage(Locale locale, Model model) {
		
		return "body/search";
	}
	
	// 고객센터
	@RequestMapping(value="/project/test3.do", method=RequestMethod.GET)
	public String helpPage(Locale locale, Model model) {
		
		return "body/help";
	}
	
	// 모여
	@RequestMapping(value="/project/test4.do", method=RequestMethod.GET)
	public String moyo(Locale locale, Model model) {
		
		return "body/moyo";
	}
	
	
}
