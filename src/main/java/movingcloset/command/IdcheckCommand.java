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
public class IdcheckCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
						Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String userid = req.getParameter("user_id");
		int result = sqlSession.getMapper(MybatisMemberImpl.class).idcheck(userid);
		
		HttpSession session = req.getSession();
		session.setAttribute("DBid", result);
		
	}


}
