package movingcloset.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Service
public class MemberEditCommand implements CommandImpl {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("request");
		HttpSession session = req.getSession(); 
		MemberDTO memberDTO = new MemberDTO();
		
		String userId = (String) session.getAttribute("siteUserInfo");
		System.out.println("memberedit커맨드 : "+userId);

		
		
		if(req.getAttribute("passcheck")=="OK") {

			String userpass = req.getParameter("userpass");
			int passResult = sqlSession.getMapper(MybatisMemberImpl.class).memberPassCheck(userpass);
			
			session.setAttribute("DBPass", passResult);
			
			
			
		}else {
			String phone = req.getParameter("userphone");
			String email = req.getParameter("useremail");
			int result = sqlSession.getMapper(MybatisMemberImpl.class).memberEdit(email,phone,userId); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
			System.out.println("입력결과"+result);
			
			model.addAttribute("result",result);
		}
		
		
		
		
	}
}
