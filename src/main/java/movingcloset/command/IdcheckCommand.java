package movingcloset.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
		
		
		//sqlSession.getMapper(MybatisMemberImpl.class).idcheck(id);
		
	}

}
