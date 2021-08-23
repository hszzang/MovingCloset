package movingcloset.command.store;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;
import mybatis.ReviewDTO;
import movingcloset.util.PagingUtil;

@Service
public class ReviewDeleteCommand implements CommandImpl {

		public ReviewDeleteCommand() {
			//System.out.println("스토어 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreDeleteCommand 호출");
			
			ReviewDTO reviewDTO = new ReviewDTO();
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			String p_code = req.getParameter("p_code");
			//String p_code = req.getParameter("p_code");
			
			String r_idx = req.getParameter("r_idx");
			
			sqlSession.getMapper(MybatisProductImpl.class).deleteReview(r_idx);
			//String p_idx = sqlSession.getMapper(MybatisProductImpl.class).getPidx(p_code);
			
			//System.out.println("p_idx : " + p_idx);
			System.out.println("r_idx : " + r_idx);

			//List<ReviewDTO> reviewList = sqlSession.getMapper(MybatisProductImpl.class).getReviews(p_code);
			
			System.out.println("ReviewDeleteCommand 완료");
			
			//model.addAttribute("reviewList", reviewList);
			//model.addAttribute("p_idx", p_idx);
			
		}


		
		
}
