package movingcloset.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import freemarker.template.SimpleDate;
import movingcloset.command.CommandImpl;
import movingcloset.command.RegisterActionCommand;
import mybatis.MemberDTO;
import oracle.sql.DATE;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	

	
	CommandImpl command = null;
	
	@Autowired
	RegisterActionCommand registerActionCommand;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	
	// 검색페이지
	@RequestMapping(value="/movingcloset/search.do", method=RequestMethod.GET)
	public String searchPage(Locale locale, Model model) {
		
		return "body/search";
	}
	
	
	//뉴디
	@RequestMapping(value="/movingcloset/newD.do", method=RequestMethod.GET)
	public String newDmain(Locale locale, Model model) {
		
		return "body/newD_main";
	}
	

	//로그인
	@RequestMapping(value="/movingcloset/login.do", method=RequestMethod.GET)
	public String newDmain() {
		
		return "body/login";
	}

	// 카카오 로그인 테스트
	@GetMapping("/movingcloset/logintest.do")
	public @ResponseBody String kakaologin(String code, HttpServletRequest req, Model model) {
		
			
		//@ResponseBody를 붙이면 Data를 리턴해주는 컨트롤러 함수
		
		// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// 라이브러리들
		// Retrofit2 안드로이드에서 많이 쓰임
		// OkHttp
		// RestTemplate
		
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>(null);
		params.add("grant_type", "authorization_code");
		params.add("client_id", "d22c6a95056d752c59d1e73f60101ab7");
		params.add("redirect_uri", "http://localhost:8082/movingcloset/movingcloset/login.do");
		params.add("code", code);
		
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity(params, headers);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);
		model.addAttribute("kakaores", response);
		model.addAttribute("kakaocode", code);

		return "body/kakaologin";
	}
	
	//쪼르깅
	@RequestMapping(value="/movingcloset/myplease2.do", method=RequestMethod.GET)
	public String myPlease2(Locale locale, Model model) {
		return "body/myPlease2";
	}
	
	//메인
	@RequestMapping(value="/movingcloset/main.do", method=RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "main";
	}
	

	//회원가입 화면으로 이동
	@RequestMapping(value="/movingcloset/register.do", method=RequestMethod.POST)
	public String register(Locale locale, Model model) {
		
		return "body/registerForm";
	}
	
	
	//회원가입 처리
	@RequestMapping(value="/movingcloset/registerAction.do", method=RequestMethod.POST)
	public String registerAction(Model model, HttpServletRequest req) {
		
		MemberDTO memberDTO = new MemberDTO();
		
		String userId = req.getParameter("user_id"); 
		String userPass = req.getParameter("pass2"); 
		String name = req.getParameter("name"); 
		
		// String type 의 birthday를 date 타입으로 변환하는 코드
		String birthday = req.getParameter("birthday");
		java.sql.Date birth = java.sql.Date.valueOf(birthday);
		
		String postcode = req.getParameter("postcode"); 
		String addr1 = req.getParameter("addr1"); 
		String addr2 = req.getParameter("addr2"); 
		String email1 = req.getParameter("email1"); 
		String email2 = req.getParameter("email2"); 
		String mobile1 = req.getParameter("mobile1"); 
		String mobile2 = req.getParameter("mobile2"); 
		String mobile3 = req.getParameter("mobile3"); 
		String tag1 = req.getParameter("tag1");
		String tag2 = req.getParameter("tag2");
		String tag3 = req.getParameter("tag3");
		String tag4 = req.getParameter("tag4");
		String tag5 = req.getParameter("tag5");
		String tag6 = req.getParameter("tag6");
		String tag7 = req.getParameter("tag7");
		String tag8 = req.getParameter("tag8");
		
		memberDTO.setUserid(userId);
		memberDTO.setUserpass(userPass);
		memberDTO.setName(name);
		memberDTO.setBirth(birth);
		memberDTO.setPostcode(postcode);
		memberDTO.setAddr(addr1+" "+addr2);
		memberDTO.setEmail(email1+"@"+email2);
		memberDTO.setPhone(mobile1+"-"+mobile2+"-"+mobile3);
		memberDTO.setTag(tag1+","+tag2+","+tag3+","+tag4+","+tag5+","+tag6+","+tag7+","+tag8);
		
		
		
		model.addAttribute("memberDTO",memberDTO);
		
		command = registerActionCommand;
		command.execute(model);
		
		return "body/registerComplete";
	}
		
	
	
	

	// 아이디 중복확인
	@RequestMapping(value="/movingcloset/idcheck.do", method=RequestMethod.POST)
	public String idcheck() {
		
		return "idCheckForm";
	}

	
	
	
	
	
	//이용약관
	@RequestMapping(value="/movingcloset/terms.do", method=RequestMethod.GET)
	public String terms(Locale locale, Model model) {
		return "body/terms";
	}
	//개인정보처리방침
	@RequestMapping(value="/movingcloset/privacy.do", method=RequestMethod.GET)
	public String privacy(Locale locale, Model model) {
		return "body/privacy";
	}
	//위치정보이용약관
	@RequestMapping(value="/movingcloset/rules_loc.do", method=RequestMethod.GET)
	public String rules_loc(Locale locale, Model model) {
		return "body/rules_loc";
	}
	
	
	
}
	
	