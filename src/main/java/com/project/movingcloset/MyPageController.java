package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	//마이페이지
	@RequestMapping(value="/movingcloset/mypage.do", method=RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		
		return "body/mypage/mypage_coupon";
	}
}
