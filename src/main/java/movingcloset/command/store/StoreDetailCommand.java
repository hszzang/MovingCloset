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
import mybatis.ProductDetailDTO;
import mybatis.ReviewDTO;
import movingcloset.util.PagingUtil;

@Service
public class StoreDetailCommand implements CommandImpl {

		public StoreDetailCommand() {
			//System.out.println("스토어 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreDetailCommand 호출");
			
			ProductDTO storeDetail = new ProductDTO();
			ProductDetailDTO productDetail = new ProductDetailDTO();
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			//HttpServletRequest dto = (HttpServletRequest)paramMap.get("productDTO");
			
			String p_idx = req.getParameter("p_idx");
			storeDetail = sqlSession.getMapper(MybatisProductImpl.class).getStoreDetail(p_idx);
			
			String p_code = storeDetail.getP_code();
			productDetail = sqlSession.getMapper(MybatisProductImpl.class).getProductDetail(p_code);
			/*
			String p_size = productDetail.getPd_size();
			String[] sizes = p_size.split(",");
			
			String p_stock = productDetail.getPd_stock();
			String[] stocks = p_stock.split(",");
			*/
			List<ReviewDTO> reviews = sqlSession.getMapper(MybatisProductImpl.class).getReviews(p_code);
			
			model.addAttribute("storeDetail", storeDetail);
			
			//model.addAttribute("productDetail", productDetail);
			//model.addAttribute("sizes", sizes);
			//model.addAttribute("stocks", stocks);
			
			model.addAttribute("reviews", reviews);
			
			System.out.println("StoreDetailCommand 호출 완료");
			
			
		}


		
		
}
