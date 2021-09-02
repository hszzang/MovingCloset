package movingcloset.command.mypage;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;

@Service
public class MypageMoyoBusCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MypageMoyoBusCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		ArrayList<MoyoUseDTO> moyoUseList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMyMoyoUse(userid);


		
		

	}

}
