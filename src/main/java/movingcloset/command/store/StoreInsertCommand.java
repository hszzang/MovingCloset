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
			/*
			System.out.println("idx = " + productDTO.getP_idx());
			System.out.println("productDTO.brand = " + productDTO.getP_brand());
			System.out.println("productDTO.name = " + productDTO.getP_name());
			System.out.println("productDTO.code = " + productDTO.getP_code());
			System.out.println("productDTO.price = " + productDTO.getP_price());
			System.out.println("productDTO.ofile = " + productDTO.getP_ofile());
			System.out.println("productDTO.sfile = " + productDTO.getP_sfile());
			*/
			System.out.println("되냐고1");
			
			int p_idx = Integer.parseInt(req.getParameter("p_idx"));
			String p_brand = req.getParameter("p_brand");
			String p_name = req.getParameter("p_name");
			String p_code = req.getParameter("p_code");
			int p_price = Integer.parseInt(req.getParameter("p_price"));
			String p_ofile = req.getParameter("p_ofile");
			String p_sfile = req.getParameter("p_sfile");
			
			productDTO.setP_idx(p_idx);
			productDTO.setP_brand(p_brand);
			productDTO.setP_name(p_name);
			productDTO.setP_code(p_code);
			productDTO.setP_price(p_price);
			productDTO.setP_ofile(p_ofile);
			productDTO.setP_sfile(p_sfile);
			
			int result = sqlSession.getMapper(MybatisProductImpl.class).insertProduct(productDTO);
			/*
			int result = sqlSession.getMapper(MybatisProductImpl.class).insertProduct(
					req.getParameter("p_idx"),
					req.getParameter("p_brand"),
					req.getParameter("p_name"),
					req.getParameter("p_code"),
					req.getParameter("p_price"),
					req.getParameter("p_ofile"),
					req.getParameter("p_sfile")
					);
			*/
			
			System.out.println("되니>?");
			System.out.println("insert 결과 : " + result); 
			//ProductDTO inserted = sqlSession.getMapper(MybatisProductImpl.class).insertProduct(productDTO);
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			
			model.addAttribute("productDTO", productDTO);
			//model.addAttribute("insertedList", insertedList);
			System.out.println(productDTO.getP_name() + "상품입력 완료");
			
			
		}
}
