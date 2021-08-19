package com.project.movingcloset;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	//메인
	@RequestMapping(value="/movingcloset/main.do", method=RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "main";
	}
	

	//회원가입
	@RequestMapping(value="/movingcloset/register.do", method=RequestMethod.GET)
	public String register() {
		
		return "body/registerForm";
	}

	// 아이디 중복확인
	@RequestMapping(value="/movingcloset/idcheck.do", method=RequestMethod.GET)
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
	
	
