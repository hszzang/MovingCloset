package movingcloset.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.util.CookieManager;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Service
public class LoginCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		HttpServletResponse resp = (HttpServletResponse)paramMap.get("resp");
		
		
		// 파라미터로 전달된 id, pass를 받아 login() 메소드 호출
		MemberDTO memberDTO  = sqlSession.getMapper(MybatisMemberImpl.class).login(req.getParameter("userid"),req.getParameter("userpw"));
		String rememberid = req.getParameter("remember_id");
		
		try {
			String userid = memberDTO.getUserid();
			
			// 로그인에 성공한 경우 세션영역에 속성을 저장한다
			session.setAttribute("siteUserInfo", userid);
			session.setAttribute("username", memberDTO.getName());
			session.removeAttribute("LoginNG");
			
			if(rememberid != null && rememberid.equals("Y")) {
				// 쿠키명 : loginId, 쿠키값 : 입력한 아이디, 유효시간 : 30일
				CookieManager.makeCookie(resp, "loginId", userid, 86400*30*30);
			}else {
				CookieManager.deleteCookie(resp, "loginId");
			}
				
			
			
		}catch (NullPointerException e) {
			e.printStackTrace();
			session.setAttribute("LoginNG","아이디/패스워드가 틀렸습니다.");
		}catch (Exception e2) {
			e2.printStackTrace();
		}
		

		
	}

}
