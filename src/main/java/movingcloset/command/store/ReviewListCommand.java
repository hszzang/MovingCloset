package movingcloset.command.store;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;
import mybatis.ReviewDTO;

@Service
public class ReviewListCommand implements CommandImpl {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object>paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String pidx = req.getParameter("p_idx");
		System.out.println("리뷰리스트커맨드 : "+pidx);
		
		ProductAndDetailDTO productAndDetailDTO = new ProductAndDetailDTO();
		
		productAndDetailDTO = sqlSession.getMapper(MybatisProductImpl.class).reviewList(pidx);
		
		model.addAttribute("productAndDetailDTO",productAndDetailDTO);
		
	}
}
