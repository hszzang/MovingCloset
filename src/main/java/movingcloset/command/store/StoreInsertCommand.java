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

			System.out.println("되냐고1");
			 
			//int p_idx = Integer.parseInt(req.getParameter("p_idx"));
			String p_idx = req.getParameter("p_idx");
			String p_brand = req.getParameter("p_brand");
			String p_name = req.getParameter("p_name");
			String p_code = req.getParameter("p_code");
			int p_price = Integer.parseInt(req.getParameter("p_price"));

			productDTO.setP_idx(p_idx);
			productDTO.setP_brand(p_brand);
			productDTO.setP_name(p_name);
			productDTO.setP_code(p_code);
			productDTO.setP_price(p_price);

			sqlSession.getMapper(MybatisProductImpl.class).insertProduct(productDTO);

			model.addAttribute("productDTO", productDTO);
			//model.addAttribute("insertedList", insertedList);
			System.out.println(productDTO.getP_name() + "상품입력 완료");
			
			
		}
}
