package movingcloset.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
		
		// 파라미터로 전달된 id, pass를 받아 login() 메소드 호출
		String userid  = sqlSession.getMapper(MybatisMemberImpl.class).login(req.getParameter("userid"), req.getParameter("userpw"));
		

		if(userid == null) {
			// 로그인에 실패한 경우 실패 메세지를 model에 저장한 후
			session.setAttribute("LoginNG","아이디/패스워드가 틀렸습니다.");
			
			// 다시 로그인 페이지를 호출한다.
			//return "body/login";

		}else if(userid.equals(req.getAttribute("userid"))) {
			// 로그인에 성공한 경우 세션영역에 속성을 저장한다
			session.setAttribute("siteUserInfo", userid);
		}
		
		// 로그인 후 돌아갈 페이지가 없는 경우에는 로그인 페이지로 이동한다.
		/*
		 * String backUrl = req.getParameter("backUrl"); if(backUrl==null ||
		 * backUrl.equals("")) { model.addAttribute("redirectpage","body/login"); }else
		 * { mv.setViewName(backUrl); } return mv;
		 */
		
		
	}

}
