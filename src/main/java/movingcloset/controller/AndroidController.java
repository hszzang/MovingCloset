package movingcloset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import movingcloset.command.CommandImpl;
import movingcloset.command.FindIdCommand;
import movingcloset.command.FindPwCommand;
import movingcloset.command.IdcheckCommand;
import movingcloset.command.LoginCommand;
import movingcloset.command.RegisterActionCommand;
import movingcloset.command.android.AndLoginCommand;
import mybatis.MemberDTO;
import mybatis.MybatisAndroidImpl;
import mybatis.MybatisMemberImpl;

@Controller
public class AndroidController {

	CommandImpl command = null;
	
	@Autowired
	SqlSession sqlSession;

	// 안드로이드 로그인
	@RequestMapping(value = "/android/AndLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andLogin(HttpServletRequest req) {
		
		System.out.println("androidLogin 호출");
		System.out.println(req.getParameter("userid") + " / " + req.getParameter("userpass"));

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MemberDTO memberDTO = sqlSession.getMapper(MybatisAndroidImpl.class)
				.androidLogin(req.getParameter("userid"), req.getParameter("userpass"));
		
		if(memberDTO == null) {
			//회원정보 불일치로 로그인에 실패한 경우.. 결과만 0으로 내려준다.
			returnMap.put("isLogin", 0);
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다.
			returnMap.put("memberDTO", memberDTO);
			returnMap.put("isLogin", 1);
		}
		
		return returnMap;
	}


}
