package movingcloset.command.moyo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;

@Service
public class PleaseJoinCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("PleaseJoinCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		HttpSession session = req.getSession();
		String siteUserInfo = (String)session.getAttribute("siteUserInfo");
		
		String plz_idx = req.getParameter("plz_idx");
		
		int result = sqlSession
				.getMapper(MybatisMoyoImpl.class).insertPlzJoin(plz_idx, siteUserInfo);
		
		if(result == 1) {
			System.out.println("insert 성공");
		}
		else {
			System.out.println("insert 실패");
		}
		
	}
}
