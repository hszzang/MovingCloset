package movingcloset.command;


import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.http.HttpResponse;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import movingcloset.util.JSFunction;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Service
public class RegisterActionCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {

	
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession(); 
		MemberDTO memberDTO = new MemberDTO();
		
		String userId = req.getParameter("user_id");
		String userPass = req.getParameter("pass2");
		String name = req.getParameter("name");
		String birth = req.getParameter("birthday");
		String postcode = req.getParameter("postcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");
		String mobile3 = req.getParameter("mobile3");
				
		String tag1 = req.getParameter("dandy"); 
		String tag2 = req.getParameter("classic"); 
		String tag3 = req.getParameter("casual"); 
		String tag4 = req.getParameter("sporty"); 
		String tag5 = req.getParameter("modern");
		String tag6 = req.getParameter("street"); 
		String tag7 = req.getParameter("vintage"); 
		String tag8 = req.getParameter("lovely");
		 
		if(tag1 == null) {tag1 = "null";} else {tag1 = "dandy";}
		if(tag2 == null) {tag2 = "null";} else {tag2 = "classic";}
		if(tag3 == null) {tag3 = "null";} else {tag3 = "casual";}
		if(tag4 == null) {tag4 = "null";} else {tag4 = "sporty";}
		if(tag5 == null) {tag5 = "null";} else {tag5 = "modern";}
		if(tag6 == null) {tag6 = "null";} else {tag6 = "street";}
		if(tag7 == null) {tag7 = "null";} else {tag7 = "vintage";}
		if(tag8 == null) {tag8 = "null";} else {tag8 = "lovely";}

		memberDTO.setUserid(userId);
		memberDTO.setUserpass(userPass);
		memberDTO.setName(name);
		memberDTO.setBirth(birth);
		memberDTO.setPostcode(postcode);
		memberDTO.setAddr(addr1 + " " + addr2);
		memberDTO.setEmail(email1 + "@" + email2);
		memberDTO.setPhone(mobile1 + "-" + mobile2 + "-" + mobile3);
		memberDTO.setTag(tag1+","+tag2+","+tag3+","+tag4+","+tag5+","+tag6+","+tag7+","+tag8);


		System.out.println("회원가입 커맨드 호출됨");


		
		int result = sqlSession.getMapper(MybatisMemberImpl.class).register(memberDTO); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
		System.out.println("입력결과"+result);
		
		
	}
	
	

}
