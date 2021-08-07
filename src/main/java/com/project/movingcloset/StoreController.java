package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {

	@RequestMapping(value="/store/detail.do", method=RequestMethod.GET)
	public String storedetail(Locale locale, Model model) {
		
		return "body/store_detail";
	}
	
	@RequestMapping(value="/project/test1.do", method=RequestMethod.GET)
	public String storeList(Locale locale, Model model) {

		return "body/store_list";
	}

	// 스토어 상세페이지에서 리뷰쓰기 버튼
	@RequestMapping("/store/reviewPage.do")
	public String review(Locale locale, Model model) {
		System.out.println("컨트롤러 들어옴");
		return "reviewPage";
	}
	
	
	
}
