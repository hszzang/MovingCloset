package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.MemberEditCommand;
import movingcloset.command.MemberOutCommand;
import movingcloset.command.RegisterActionCommand;
import movingcloset.command.coupon.CouponMyListCommand;
import movingcloset.command.cscenter.QnaCommand;
import movingcloset.command.mypage.MyPageOrderDetailCommand;
import movingcloset.command.mypage.MyPageOrderListCommand;
import movingcloset.command.mypage.MypageMoyoBusCommand;

import movingcloset.command.zzim.ZzimAllListCommand;
import movingcloset.command.mypage.MypageMoyoDeleteCommand;
import movingcloset.command.mypage.MypagePleaseCommand;
import movingcloset.command.mypage.MypagePlzDeleteCommand;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;
import movingcloset.command.mypage.MypageReviewCommand;
import movingcloset.command.store.ReviewListCommand;
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
    
    @Autowired
    MypagePleaseCommand mypagePleaseCommand;

    @Autowired
    MypagePlzDeleteCommand mypagePlzDeleteCommand;
    
    @Autowired
    MypageMoyoDeleteCommand mypageMoyoDeleteCommand;
    
	@Autowired
	MypageReviewCommand mypageReviewCommand;

	MyPageOrderListCommand myPageOrderListCommand;
	
	@Autowired
	ZzimAllListCommand zzimAllListCommand;
	
	@Autowired
	MyPageOrderDetailCommand myPageOrderDetailCommand;

	
	@Autowired
	CouponMyListCommand couponMyListCommand;
	
	@RequestMapping(value="movingcloset/mypage_coupon.do", method=RequestMethod.GET)
	public String mypageCoupon (Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = couponMyListCommand;
		command.execute(model);
		
		return "body/mypage/mypage_coupon";
	}
	
	@RequestMapping(value="movingcloset/mypage_order.do", method=RequestMethod.GET)
	public String mypageOrder (Locale locale, Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = myPageOrderListCommand;
		command.execute(model);
		
		return "body/mypage/mypage_order";
	}
	
	@RequestMapping("/movingcloset/myorder.do")
	public String myorder(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		
		command = myPageOrderDetailCommand;
		command.execute(model);
		
		return "body/store/payForm";
	}
	
	
	//?????? ????????? ??????????????? ??????
	@RequestMapping(value="movingcloset/mypage_please.do", method=RequestMethod.GET)
	public String mypagePlease (Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = mypagePleaseCommand;
		command.execute(model);
		
		return "body/mypage/mypage_please";
	}
	
	//????????? ?????? ??????
	@RequestMapping(value="movingcloset/myPagePlzDelete.do", method=RequestMethod.GET)
	public String myPagePlzDelete (Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = mypagePlzDeleteCommand;
		command.execute(model);
		
		return "redirect:/movingcloset/mypage_please.do";
	}
	
	@RequestMapping(value="movingcloset/mypage_zzim.do", method=RequestMethod.GET)
	public String mypageZzim (Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = zzimAllListCommand;
		command.execute(model);
		
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
	
	//????????? ?????? ??????
	@RequestMapping(value="movingcloset/myPageMoyoDelete.do", method=RequestMethod.GET)
	public String myPageMoyoDelete (Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = mypageMoyoDeleteCommand;
		command.execute(model);
		
		return "redirect:/movingcloset/mypage_bus.do";
	}
	
	@RequestMapping(value="movingcloset/mypage_out.do", method=RequestMethod.GET)
	public String mypageOut (Locale locale, Model model) {
		
		return "body/mypage/mypage_out";
	}
	
	/*
	1. ???????????? @Controller -> ????????? @Service -> ??????????????? impl -> mapper  
	@Service
	public class MemberOutCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		????????? ??????
	
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession(); 
		MemberDTO memberDTO = new MemberDTO();
		
		
		????????????
		
		int result = sqlSession.getMapper(MybatisMemberImpl.class).memberOut(userid); // ??????????????? ????????? VO????????? ?????? ???????????? ????????? ??????????????? ??????
		System.out.println("????????????"+result);

	
	}
	*/
	
	@RequestMapping(value="movingcloset/mypage_memberOut.do", method=RequestMethod.GET)
	public String mypageMemberOut (Model model, HttpServletRequest request) {
		
		model.addAttribute("request",request);
		command = memberOutCommand;
		command.execute(model);
		
		
		return "body/mypage/mypage_outComplete";
	}	
	
	
	
	
	
	
	//??????????????????
	@RequestMapping(value="movingcloset/mypage_myqna.do", method=RequestMethod.GET)
	public String mypageQna (HttpServletRequest req, Model model, QnaDTO qnaDTO) {
		
		System.out.println("??????????????????????????? ??????????????????");
		model.addAttribute("req",req);
		command = qnaCommand;
		command.execute(model);
		
		return "body/mypage/mypage_myqna";
	}
	
	
	
	
	
	
	@RequestMapping(value="movingcloset/mypage_review.do", method=RequestMethod.GET)
	public String mypageReview (HttpServletRequest req, Model model) {
		
		
		model.addAttribute("req", req);
		command = mypageReviewCommand;
		command.execute(model);
		 
		
		return "body/mypage/mypage_review";
	}
	
}
