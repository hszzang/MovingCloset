package movingcloset.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import movingcloset.command.CommandImpl;
import movingcloset.command.CommandImpl2;
import movingcloset.command.coupon.CouponDownCommand;
import movingcloset.command.coupon.CouponListCommand;
import mybatis.CouponDTO;

@Controller
public class CouponController {
	
	CommandImpl command = null;
	
	CommandImpl2 command2 = null;

	
	@Autowired
	CouponListCommand couponListCommand; 
	
	@Autowired
	CouponDownCommand couponDownCommand;
	
	// 쿠폰메인
	@RequestMapping(value = "/movingcloset/coupon.do", method = RequestMethod.GET)
	public String couponmain() {
		
		return "body/coupon/coupon_main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/couponlist", method = RequestMethod.POST)
	public ArrayList<CouponDTO> couponlist(CouponDTO couponDTO) {
		
		System.out.println("couponlist호출");
		
		System.out.println(couponDTO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("couponDTO", couponDTO);
		command2 = couponListCommand;
		command2.mapexecute(map);
		ArrayList<CouponDTO> couponList = (ArrayList<CouponDTO>) map.get("couponList");
		return couponList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public Map<String, Object> download(CouponDTO couponDTO) {

		System.out.println("download호출");
		System.out.println(couponDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("null이 아니다.");
		map.put("couponDTO", couponDTO);
		command2 = couponDownCommand;
		command2.mapexecute(map);
		map.put("alert", "쿠폰 발급이 완료 되었습니다.");
		
		return map;
	}
	
	@RequestMapping(value = "/movingcloset/event.do", method = RequestMethod.GET)
	public String event() {
		
		return "body/event/event_main";
	}
		
}
