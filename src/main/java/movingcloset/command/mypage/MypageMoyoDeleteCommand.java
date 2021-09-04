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
public class MypageMoyoDeleteCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MypagePlzDeleteCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String m_idx = req.getParameter("m_idx");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		System.out.println("m_idx입니다." + m_idx + "  userid입니다" + userid);
		
		int result = sqlSession
				.getMapper(MybatisMoyoImpl.class).deleteMyMoyo(m_idx, userid);
		
		if(result != 0) {
			System.out.println("모여신청 삭제 완료");
		}
	}
}
