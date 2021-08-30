package movingcloset.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.LoginCommand;
import movingcloset.command.MemberOutCommand;
import movingcloset.command.RegisterActionCommand;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Controller
public class MypageController {

	CommandImpl command = null;
	
	@Autowired
	MemberOutCommand memberOutCommand;
	
	
	@RequestMapping(value="/mypage/coupon.do", method=RequestMethod.GET)
	public String mypageCoupon (Model model, HttpServletRequest req) {
		
		return "body/mypage/mypage_coupon";
	}
	@RequestMapping(value="/mypage/order.do", method=RequestMethod.GET)
	public String mypageOrder (Locale locale, Model model) {
		
		return "body/mypage/mypage_order";
	}
	@RequestMapping(value="/mypage/please.do", method=RequestMethod.GET)
	public String mypagePlease (Locale locale, Model model) {
		
		return "body/mypage/mypage_please";
	}
	@RequestMapping(value="/mypage/zzim.do", method=RequestMethod.GET)
	public String mypageZzim (Locale locale, Model model) {
		
		return "body/mypage/mypage_zzim";
	}
	@RequestMapping(value="/mypage/manage.do", method=RequestMethod.GET)
	public String mypageManage (Locale locale, Model model) {
		
		return "body/mypage/mypage_manage";
	}
	@RequestMapping(value="/mypage/bus.do", method=RequestMethod.GET)
	public String mypageBus (Locale locale, Model model) {
		
		return "body/mypage/mypage_moyoBus";
	}
	@RequestMapping(value="/mypage/out.do", method=RequestMethod.GET)
	public String mypageOut (Locale locale, Model model) {
		
		return "body/mypage/mypage_out";
	}
	
	/*
	1. 컨트롤러 @Controller -> 커맨드 @Service -> 인터페이스 impl -> mapper  
	@Service
	public class MemberOutCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		메소드 정의
	
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession(); 
		MemberDTO memberDTO = new MemberDTO();
		
		
		중간생략
		
		int result = sqlSession.getMapper(MybatisMemberImpl.class).memberOut(userid); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
		System.out.println("입력결과"+result);

	
	}
	*/
	
	@RequestMapping(value="/mypage/memberOut.do", method=RequestMethod.GET)
	public String mypageMemberOut (Model model, HttpServletRequest request) {
		
		model.addAttribute("request",request);
		command = memberOutCommand;
		command.execute(model);
		
		
		return "body/mypage/mypage_outComplete";
	}	
	@RequestMapping(value="/mypage/myqna.do", method=RequestMethod.GET)
	public String mypageQna (Locale locale, Model model) {
		
		return "body/mypage/mypage_myqna";
	}
	@RequestMapping(value="/mypage/review.do", method=RequestMethod.GET)
	public String mypageReview (Locale locale, Model model) {
		
		return "body/mypage/mypage_review";
	}
	
}
