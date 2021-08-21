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
			//HttpServletRequest dto = (HttpServletRequest)paramMap.get("productDTO");
			
			System.out.println("StoreDeleteCommand 호출2");
			String p_idx = req.getParameter("p_idx");
			System.out.println(p_idx);
			
			sqlSession.getMapper(MybatisProductImpl.class).deleteProduct(p_idx);
			
			System.out.println("StoreDeleteCommand 호출3");
			List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			
			System.out.println("StoreDeleteCommand 완료");
			//model.addAttribute("productDTO", productDTO);
			model.addAttribute("storeList", storeList);
			
			
		}


		
		
}
