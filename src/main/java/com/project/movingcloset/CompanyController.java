package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompanyController {
	
	//회사소개, 인재상
	@RequestMapping(value="/movingcloset/introduce.do", method=RequestMethod.GET)
	public String aboutIntro(Locale locale, Model model) {
		
		return "body/company/about_intro";
	}
	
	
	//채용정보
	@RequestMapping(value="/movingcloset/recruit.do", method=RequestMethod.GET)
	public String aboutRecruit(Locale locale, Model model) {
		
		return "body/company/about_recruit";
	}
	
	//오시는길
	@RequestMapping(value="/movingcloset/map.do", method=RequestMethod.GET)
	public String aboutMap(Locale locale, Model model) {
		
		return "body/company/about_map";
	}

}
