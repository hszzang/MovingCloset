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
import mybatis.MybatisProductImpl;
import mybatis.ReviewDTO;

@Service
public class MypageReviewCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object>paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		ArrayList<ReviewDTO> mypageReview = sqlSession
				.getMapper(MybatisProductImpl.class).mypageReviewList(userid);
		model.addAttribute("mypageReview", mypageReview);
		
		
	}
}
