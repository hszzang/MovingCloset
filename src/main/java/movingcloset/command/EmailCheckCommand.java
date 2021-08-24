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
public class EmailCheckCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
		String email = (String) request.getAttribute("email");
		MemberDTO memberDTO = sqlSession.getMapper(MybatisMemberImpl.class).emailcheck(email);
		
		//System.out.println("email : "+memberDTO.getEmail());
		System.out.println("name : "+memberDTO.getName());
		HttpSession session = request.getSession();
		
		try {
			// 로그인에 성공한 경우 세션영역에 속성을 저장한다
			session.setAttribute("siteUserInfo", memberDTO.getEmail());
			session.setAttribute("username", memberDTO.getName());
	
		}catch (NullPointerException e) {
			e.printStackTrace();
		}catch (Exception e2) {  
			e2.printStackTrace();
		}
		
		
	}
	
	
	
	
}
