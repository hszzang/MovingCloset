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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.LoginCommand;
import movingcloset.command.MemberEditCommand;
import movingcloset.command.MemberOutCommand;
import movingcloset.command.RegisterActionCommand;
import movingcloset.command.cscenter.QnaCommand;
import movingcloset.command.mypage.MypageMoyoBusCommand;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;
import mybatis.QnaDTO;

@Controller
public class MypageController {

	CommandImpl command = null;
	
	@Autowired
	MemberOutCommand memberOutCommand;

	@Autowired
	MemberEditCommand memberEditCommand;
	
	@Autowired
	QnaCommand qnaCommand;

	@Autowired
	MypageMoyoBusCommand mypageMoyoBusCommand;

	
	
	@RequestMapping(value="movingcloset/mypage_coupon.do", method=RequestMethod.GET)
	public String mypageCoupon (Model model, HttpServletRequest req) {
		
		return "body/mypage/mypage_coupon";
	}
	@RequestMapping(value="movingcloset/mypage_order.do", method=RequestMethod.GET)
	public String mypageOrder (Locale locale, Model model) {
		
		return "body/mypage/mypage_order";
	}
	@RequestMapping(value="movingcloset/mypage_please.do", method=RequestMethod.GET)
	public String mypagePlease (Locale locale, Model model) {
		
		return "body/mypage/mypage_please";
	}
	@RequestMapping(value="movingcloset/mypage_zzim.do", method=RequestMethod.GET)
	public String mypageZzim (Locale locale, Model model) {
		
		return "body/mypage/mypage_zzim";
	}
	
	
	
	@RequestMapping(value="movingcloset/mypage_manage.do", method=RequestMethod.GET)
	public String mypageManage (Model model, HttpServletRequest request) {

		return "body/mypage/mypage_manage";
	}
	@RequestMapping(value="movingcloset/mypage_manageAction.do", method=RequestMethod.POST)
	public String mypageManageAction (Model model, HttpServletRequest request) {
		
		model.addAttribute("request", request);
		command = memberEditCommand;
		command.execute(model);
		
		
		return "body/mypage/mypage_manage";
	}
	
	
	@RequestMapping(value="/movingcloset/passCheckPage.do", method=RequestMethod.GET)
	public String mypagePassCheckPage(Model model, HttpServletRequest request) {
		return "passCheck";
	}

	@RequestMapping(value="/movingcloset/passcheck.do", method=RequestMethod.GET)
	public String mypagePassCheck(Model model, HttpServletRequest request) {
		request.setAttribute("passcheck", "OK");
		model.addAttribute("request",request);
		
		command = memberEditCommand;
		command.execute(model);
		
		return "passCheck";
	}
	
	
	@RequestMapping(value="/movingcloset/mypage_bus.do", method=RequestMethod.GET)
	public String mypageBus (HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		command = mypageMoyoBusCommand;
		command.execute(model);
		
		return "body/mypage/mypage_moyoBus";
	}
	
	@RequestMapping(value="movingcloset/mypage_out.do", method=RequestMethod.GET)
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
	
	@RequestMapping(value="movingcloset/mypage_memberOut.do", method=RequestMethod.GET)
	public String mypageMemberOut (Model model, HttpServletRequest request) {
		
		model.addAttribute("request",request);
		command = memberOutCommand;
		command.execute(model);
		
		
		return "body/mypage/mypage_outComplete";
	}	
	
	
	
	
	
	
	//현진쓰작업중
	@RequestMapping(value="movingcloset/mypage_myqna.do", method=RequestMethod.GET)
	public String mypageQna (HttpServletRequest req, Model model, QnaDTO qnaDTO) {
		
		System.out.println("마이페이지리뷰내역 컨트롤러호출");
		model.addAttribute("req",req);
		command = qnaCommand;
		command.execute(model);
		
		return "body/mypage/mypage_myqna";
	}
	
	
	
	
	
	
	@RequestMapping(value="movingcloset/mypage_review.do", method=RequestMethod.GET)
	public String mypageReview (Locale locale, Model model) {
		
		return "body/mypage/mypage_review";
	}
	
}
