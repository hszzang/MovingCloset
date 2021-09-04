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

import mybatis.BuyAndGroupDTO;
import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;
import movingcloset.command.CommandImpl;
import mybatis.ProductDetailDTO;
import mybatis.ReviewDTO;
import movingcloset.util.PagingUtil;

@Service
public class StoreDetailCommand implements CommandImpl {

		public StoreDetailCommand() {}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreDetailCommand 호출");
			
			ProductDTO storeDetail = new ProductDTO();
			ProductDetailDTO productDetail = new ProductDetailDTO();
			BuyAndGroupDTO buyAndGroupDTO = new BuyAndGroupDTO();
			  
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			HttpSession session = req.getSession();
			
			String check = req.getParameter("check");
			String p_idx = req.getParameter("p_idx");
			String p_code = req.getParameter("p_code");
			
			if(check == null) {
				storeDetail = sqlSession.getMapper(MybatisProductImpl.class).getStoreDetail(p_idx);				
			}else {
			 
				storeDetail = sqlSession.getMapper(MybatisProductImpl.class).getProductDTOsfile(p_code);	
			}
			
			productDetail = sqlSession.getMapper(MybatisProductImpl.class).getProductDetail(p_code);
			
			
			
			String p_size = productDetail.getPd_size();
			String[] sizes = p_size.split(",");
			System.out.println(p_size); 
			
			String p_stock = productDetail.getPd_stock();
			String[] stocks = p_stock.split(",");
			System.out.println(p_stock);
			
			/*
			 * List<ReviewDTO> reviews =
			 * sqlSession.getMapper(MybatisProductImpl.class).getReviews(p_code);
			 * 
			 * String userid = (String) session.getAttribute("siteUserInfo"); if(userid !=
			 * null) {
			 * 
			 * buyAndGroupDTO =
			 * sqlSession.getMapper(MybatisProductImpl.class).buyReview(userid,p_code);
			 * model.addAttribute("buyAndGroupDTO",buyAndGroupDTO);
			 * 
			 * } 잠시비활성화
			 */
			
			
			
			model.addAttribute("storeDetail", storeDetail);
			
			model.addAttribute("productDetail", productDetail);
			model.addAttribute("sizes", sizes);
			//model.addAttribute("sizes",p_size);
			model.addAttribute("stocks", stocks);
			//model.addAttribute("stocks", p_stock);
			
			/* model.addAttribute("reviews", reviews); 잠시비활성화*/

			
			System.out.println("StoreDetailCommand 호출 완료");
			
			
		}


		
		
}
