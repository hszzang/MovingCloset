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

import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;
import movingcloset.command.CommandImpl;
import movingcloset.util.PagingUtil;
 
@Service
public class StoreDeleteCommand implements CommandImpl {

		public StoreDeleteCommand() {
			//System.out.println("스토어 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreDeleteCommand 호출");
			
			ProductDTO productDTO = new ProductDTO();
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			String p_idx = req.getParameter("p_idx");
			productDTO = sqlSession.getMapper(MybatisProductImpl.class).getProductDTO(p_idx);
			
			sqlSession.getMapper(MybatisProductImpl.class).deleteDetail(productDTO.getP_code());
			sqlSession.getMapper(MybatisProductImpl.class).deleteProduct(p_idx);
			
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			
			System.out.println("StoreDeleteCommand 완료");
			
			//model.addAttribute("storeList", storeList);
			
			
		}


		
		
}
