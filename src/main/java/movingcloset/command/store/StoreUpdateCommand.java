package movingcloset.command.store;

import java.util.ArrayList;
import java.util.Arrays;
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

@Service
public class StoreUpdateCommand implements CommandImpl {

		public StoreUpdateCommand() {
			//System.out.println("스토어 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			System.out.println("업데이트 커맨드 호출");
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			ProductDTO productDTO = (ProductDTO)paramMap.get("productDTO");
			ProductDetailDTO detailDTO = new ProductDetailDTO();
			
			String p_idx = req.getParameter("p_idx");
			String p_brand = req.getParameter("p_brand");
			String p_name = req.getParameter("p_name");
			String p_code = req.getParameter("p_code");
			int p_price = Integer.parseInt(req.getParameter("p_price"));
			
			String pd_color = req.getParameter("pd_color");
			
			String[] sizes = req.getParameterValues("sizes");
			String pd_size = String.join(",", sizes);
			
			String[] stocks = req.getParameterValues("stocks");
			String pd_stock = String.join(",", stocks);

			productDTO.setP_idx(p_idx); 
			productDTO.setP_brand(p_brand);
			productDTO.setP_name(p_name);
			productDTO.setP_code(p_code);
			productDTO.setP_price(p_price);
			
			detailDTO.setP_code(p_code);
			detailDTO.setPd_color(pd_color);
			detailDTO.setPd_size(pd_size);
			detailDTO.setPd_stock(pd_stock);
			
			sqlSession.getMapper(MybatisProductImpl.class).updateProduct(productDTO);
			sqlSession.getMapper(MybatisProductImpl.class).updateDetail(detailDTO);

			model.addAttribute("p_idx", p_idx);
			model.addAttribute("productDTO", productDTO);

			System.out.println("StoreUpdateCommand 완료");
			
		}
}
