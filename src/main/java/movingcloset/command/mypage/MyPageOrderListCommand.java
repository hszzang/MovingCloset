package movingcloset.command.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.BuyAndGroupDTO;
import mybatis.MybatisMypageImpl;

@Service
public class MyPageOrderListCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {  

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("siteUserInfo");
		List<BuyAndGroupDTO> buylist = sqlSession.getMapper(MybatisMypageImpl.class).orderlist(userid);
		
		model.addAttribute("buylist",buylist);
		
		
	}

}
