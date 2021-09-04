package movingcloset.command.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoBusDTO;
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.PleaseDTO;
import mybatis.ProductDTO;

@Service
public class MypagePlzDeleteCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MypagePlzDeleteCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String plz_idx = req.getParameter("plz_idx");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		int result = sqlSession
				.getMapper(MybatisMoyoImpl.class).deleteMyPlz(plz_idx, userid);
	}
}
