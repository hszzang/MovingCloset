package movingcloset.command.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisProductImpl;
import mybatis.ReviewDTO;

@Service
public class ReviewUpdateCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		ReviewDTO reviewDTO = new ReviewDTO();
		// p_code,r_idx,userid 필요
		// r_content 와 sfile ofile도 필요함
		
		int result = sqlSession.getMapper(MybatisProductImpl.class).updateReview(reviewDTO);
		
	}
}
