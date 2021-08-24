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

@Service
public class StoreInsertCommand implements CommandImpl {

		public StoreInsertCommand() {
			//System.out.println("스토어인서트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreInsertCommand 호출");

			ProductDTO productDTO = new ProductDTO();
			
			Map<String, Object>paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			productDTO = (ProductDTO)paramMap.get("productDTO");
			ProductDetailDTO detailDTO = (ProductDetailDTO)paramMap.get("detailDTO");

			//int p_idx = Integer.parseInt(req.getParameter("p_idx"));
			String p_idx = req.getParameter("p_idx");
			String p_brand = req.getParameter("p_brand");
			String p_name = req.getParameter("p_name");
			String p_code = req.getParameter("p_code");
			int p_price = Integer.parseInt(req.getParameter("p_price"));
			String p_flag = req.getParameter("p_flag");

			String pd_color = req.getParameter("pd_color");
			String pd_size = req.getParameter("pd_size");
			String pd_stock = req.getParameter("pd_stock");

			productDTO.setP_idx(p_idx);
			productDTO.setP_brand(p_brand);
			productDTO.setP_name(p_name);
			productDTO.setP_code(p_code);
			productDTO.setP_price(p_price);
			productDTO.setP_flag(p_flag);
			
			detailDTO.setP_code(p_code);
			detailDTO.setPd_color(pd_color);
			detailDTO.setPd_size(pd_size);
			detailDTO.setPd_stock(pd_stock);

			sqlSession.getMapper(MybatisProductImpl.class).insertProduct(productDTO);
			sqlSession.getMapper(MybatisProductImpl.class).insertDetail(detailDTO);

			model.addAttribute("productDTO", productDTO);
			model.addAttribute("detailDTO", detailDTO);
			
			System.out.println(productDTO.getP_name() + "상품입력 완료");
			
		}
}
