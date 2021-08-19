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
public class FindIdCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		if(phone.length() == 020000000 9 01000000000 11 0220000000 10 020000000010)
		
		String result = sqlSession.getMapper(MybatisMemberImpl.class).findId(name, phone);
		System.out.println("id중복확인 "+result);
		
		
		HttpSession session = req.getSession();
		session.setAttribute("DBid", result);
		
	}

}
