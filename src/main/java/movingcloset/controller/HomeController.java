package movingcloset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.movingcloset.KakaoService;
import com.project.movingcloset.NaverLoginBO;

import movingcloset.command.CommandImpl;
import movingcloset.command.EmailCheckCommand;
import movingcloset.command.FindIdCommand;
import movingcloset.command.FindPwCommand;
import movingcloset.command.IdcheckCommand;
import movingcloset.command.LoginCommand;
import movingcloset.command.RegisterActionCommand;
import mybatis.MemberDTO;

import mybatis.MybatisMemberImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/* NaverLoginBO */ 
	private NaverLoginBO naverLoginBO; 
	private String apiResult = null; 
	
	/* naver login api 연동 부분 */
	@Autowired 
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO; 
	}

	/* kakao login api 연동 부분 */
    @Autowired
    private KakaoService kakaoService;
	
	CommandImpl command = null;

	@Autowired
	RegisterActionCommand registerActionCommand;

	@Autowired
	IdcheckCommand idcheckCommand;
	
	@Autowired
	LoginCommand loginCommand;
	
	@Autowired
	FindIdCommand findIdCommand;

	@Autowired
	FindPwCommand findPwCommand;
	
	
	@Autowired
	EmailCheckCommand emailCheckCommand;
	
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	// 검색페이지
	@RequestMapping(value = "/movingcloset/search.do", method = RequestMethod.GET)
	public String searchPage(Locale locale, Model model) {

		return "body/search";
	}


	// 로그인(일반+네이버api)
	@RequestMapping(value = "/movingcloset/login.do",method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		System.out.println("네이버:" + naverAuthUrl); 
		model.addAttribute("url", naverAuthUrl); 
		
		return "body/login";
	}
	
	
	// 로그인 처리
	@RequestMapping(value="/movingcloset/loginAction.do",method=RequestMethod.POST)
	public String loginAction(Model model, HttpServletRequest req,HttpSession session,HttpServletResponse resp) {

		model.addAttribute("req",req);
		model.addAttribute("resp",resp);
		command = loginCommand;
		command.execute(model);
		
		
		return "body/login";			
		
		
		
	}
	
	/*
	 * //로그아웃
	 * 
	 * @RequestMapping(value = "/movingcloset/naverlogout.do", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String logout(HttpSession
	 * session)throws IOException { System.out.println("여기는 logout");
	 * session.invalidate(); return "body/login"; }
	 */
	
		
	@RequestMapping("/movingcloset/logout.do")
	public String logout(Model model, HttpSession session) {
		
		session.removeAttribute("siteUserInfo");
		session.removeAttribute("username");

		
		return "body/login";
	}
	
	
	
	//네이버 로그인 성공시 callback호출 메소드 
	@RequestMapping(value = "/movingcloset/callback.do", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String callback(Model model, @RequestParam String code, 
			@RequestParam String state, HttpSession session, HttpServletRequest request) throws IOException, ParseException {
		System.out.println("여기는 callback"); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state); 
		//1. 로그인 사용자 정보를 읽어온다. 
		apiResult = naverLoginBO.getUserProfile(oauthToken); 

		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj = parser.parse(apiResult); 
		JSONObject jsonObj = (JSONObject) obj; 
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱 
		JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
		System.out.println("response_obj : "+response_obj);
		
		
		//response의 nickname값 파싱 
		String phone = (String)response_obj.get("mobile"); 
		String email = (String)response_obj.get("email"); 
		String name = (String)response_obj.get("name"); 
		
		
		String[] phoneAll = phone.split("-");
		String phone1 = phoneAll[0];
		String phone2 = phoneAll[1];
		String phone3 = phoneAll[2];
		
		
		String[] emailAll = email.split("@");
		String email1 = emailAll[0];
		String email2 = emailAll[1];
		
		
		System.out.println(phone+" , "+email+" , "+name); 
		//4.파싱 닉네임 세션으로 저장 
		session.setAttribute("sessionPhone1",phone1); 
		session.setAttribute("sessionPhone2",phone2); 
		session.setAttribute("sessionPhone3",phone3); 
		session.setAttribute("sessionEmail1",email1); 
		session.setAttribute("sessionEmail2",email2); 
		session.setAttribute("sessionName",name); 
		
		
		//세션 생성 
		model.addAttribute("result", apiResult); 
	
		request.setAttribute("loginbrand", "naver");
        request.setAttribute("email", email);
        model.addAttribute("request",request);
		
		/*
		 * command = emailCheckCommand; command.execute(model);
		 */
		
        
		if(session.getAttribute("siteUserInfo") != null) {
			return "body/login";
			
		}else {
			return "body/registerForm";
			
		}
	} 
	

	
	// 카카오 로그인
    @RequestMapping("/movingcloset/kakaologin.do")
    public String kakaologin(@RequestParam(value = "code", required = false) String code, HttpSession session, Model model, HttpServletRequest request ) throws Exception{
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        
        String kemail = (String) userInfo.get("email");
        String[] kemailAll = kemail.split("@");
        String kemail1 = kemailAll[0];
        String kemail2 = kemailAll[1];
        
        
        session.setAttribute("kakaoNickname", userInfo.get("nickname"));
        session.setAttribute("kakaoEmail1", kemail1);
        session.setAttribute("kakaoEmail2", kemail2);
        
        
        request.setAttribute("email", kemail);
        request.setAttribute("loginbrand", "kakao");
        model.addAttribute("request",request);
		
		/*
		 * command = emailCheckCommand; command.execute(model);
		 */
		
        
		if(session.getAttribute("siteUserInfo") != null) {
			return "body/login";
			
		}else {
		
			return "body/registerForm";
			
		}
        
        
    }
	
	


	// 쪼르깅
	@RequestMapping(value = "/movingcloset/myplease2.do", method = RequestMethod.GET)
	public String myPlease2(Locale locale, Model model) {
		return "body/myPlease2";
	}

	// 메인
	@RequestMapping(value = "/movingcloset/main.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "main";
	}

	// 회원가입 화면으로 이동
	@RequestMapping(value = "/movingcloset/register.do")
	public String register(HttpServletRequest request) {
		request.setAttribute("loginbrand", "normal");
		return "body/registerForm";
	}

	// 회원가입 처리
	@RequestMapping(value = "/movingcloset/registerAction.do", method = RequestMethod.POST)
	public String registerAction(Model model, HttpServletRequest req) {

		model.addAttribute("req",req);    
		command = registerActionCommand;
		command.execute(model);

		return "body/registerComplete";
	}

	// 아이디 중복확인
	@RequestMapping(value = "/movingcloset/idcheck.do",produces = "application/json")
	public String idcheck(Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = idcheckCommand;
			command.execute(model);

		return "idCheckForm";
	}

	
	
	
	
	
	// 아이디/비밀번호찾기
	@RequestMapping(value = "/movingcloset/findIdPw.do", method = RequestMethod.GET)
	public String findIdPw(Model model, HttpServletRequest req) {
		return "body/findIdPw";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/movingcloset/findId.do", method = RequestMethod.GET)
	public String findId(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = findIdCommand;
		command.execute(model);
		
		return "body/findIdAction";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/movingcloset/findPw.do", method = RequestMethod.GET)
	public String findPw(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = findPwCommand;
		command.execute(model);
		
		return "body/findPwAction";
	}
	
	// 이용약관
	@RequestMapping(value = "/movingcloset/terms.do", method = RequestMethod.GET)
	public String terms(Locale locale, Model model) {
		return "body/terms";
	}

	// 개인정보처리방침
	@RequestMapping(value = "/movingcloset/privacy.do", method = RequestMethod.GET)
	public String privacy(Locale locale, Model model) {
		return "body/privacy";
	}

	// 위치정보이용약관
	@RequestMapping(value = "/movingcloset/rules_loc.do", method = RequestMethod.GET)
	public String rules_loc(Locale locale, Model model) {
		return "body/rules_loc";
	}

}
