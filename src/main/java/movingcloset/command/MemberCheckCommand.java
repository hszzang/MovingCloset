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
public class MemberCheckCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		
		String email = (String) req.getAttribute("emailAll");
		String loginbrand = (String) req.getAttribute("loginbrand");
		MemberDTO memberDTO = new MemberDTO();
		
		
		int result = sqlSession.getMapper(MybatisMemberImpl.class).membercheck(email,loginbrand); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
		System.out.println("입력결과"+result);
		
		if(result==1) {
			
			memberDTO = sqlSession.getMapper(MybatisMemberImpl.class).memberInfo(email, loginbrand);
			
			session.setAttribute("siteUserInfo", memberDTO.getUserid());
			session.setAttribute("username", memberDTO.getName());
		}
		
		session.setAttribute("membercheck", result);
		
	}
	
}
