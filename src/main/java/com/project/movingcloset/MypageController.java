package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@RequestMapping(value="/mypage/coupon.do", method=RequestMethod.GET)
	public String mypageCoupon (Locale locale, Model model) {
		
		return "body/mypage/mypage_coupon";
	}
	@RequestMapping(value="/movingcloset/mypage/order.do", method=RequestMethod.GET)
	public String mypageOrder (Locale locale, Model model) {
		
		return "body/mypage/mypage_order";
	}
	@RequestMapping(value="/movingcloset/mypage/please.do", method=RequestMethod.GET)
	public String mypagePlease (Locale locale, Model model) {
		
		return "body/mypage/mypage_please";
	}
	@RequestMapping(value="/movingcloset/mypage/zzim.do", method=RequestMethod.GET)
	public String mypageZzim (Locale locale, Model model) {
		
		return "body/mypage/mypage_zzim";
	}
	@RequestMapping(value="/movingcloset/mypage/manage.do", method=RequestMethod.GET)
	public String mypageManage (Locale locale, Model model) {
		
		return "body/mypage/mypage_manage";
	}
	@RequestMapping(value="/movingcloset/mypage/bus.do", method=RequestMethod.GET)
	public String mypageBus (Locale locale, Model model) {
		
		return "body/mypage/mypage_moyoBus";
	}
	@RequestMapping(value="/movingcloset/mypage/out.do", method=RequestMethod.GET)
	public String mypageOut (Locale locale, Model model) {
		
		return "body/mypage/mypage_out";
	}
	@RequestMapping(value="/movingcloset/mypage/myqna.do", method=RequestMethod.GET)
	public String mypageQna (Locale locale, Model model) {
		
		return "body/mypage/mypage_myqna";
	}
	@RequestMapping(value="/movingcloset/mypage/review.do", method=RequestMethod.GET)
	public String mypageReview (Locale locale, Model model) {
		
		return "body/mypage/mypage_review";
	}
	
}
