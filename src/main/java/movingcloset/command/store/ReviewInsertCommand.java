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
import mybatis.ReviewDTO;

@Service
public class ReviewInsertCommand implements CommandImpl {

		public ReviewInsertCommand() {
			//System.out.println("스토어인서트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("ReviewInsertCommand 호출");

			ReviewDTO reviewDTO = new ReviewDTO();
			
			Map<String, Object>paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			reviewDTO = (ReviewDTO)paramMap.get("reviewDTO");
			
			System.out.println("되냐고1");
			 
			String r_idx = req.getParameter("r_idx");

			sqlSession.getMapper(MybatisProductImpl.class).insertReview(reviewDTO);

			model.addAttribute("reviewDTO", reviewDTO);
			//model.addAttribute("insertedList", insertedList);
			//System.out.println(reviewDTO.getP_name() + "상품입력 완료");
			
			
		}
}
