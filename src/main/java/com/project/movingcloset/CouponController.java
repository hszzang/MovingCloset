package com.project.movingcloset;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CouponController {

	@RequestMapping(value="/coupon_main.do", method=RequestMethod.GET)
	public String coupon_main() {
		
		return "body/coupon_main";
	}
}
