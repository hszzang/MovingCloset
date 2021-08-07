package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CouponController {

	@RequestMapping(value="/movingcloset/coupon_main.do", method=RequestMethod.GET)
	public String coupon_main(Locale locale) {
		
		return "body/eventcoupon/coupon_main";
	}
}
