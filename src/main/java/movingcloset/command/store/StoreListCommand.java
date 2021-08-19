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
public class StoreListCommand implements CommandImpl {

		public StoreListCommand() {
			//System.out.println("스토어리스트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreListCommand 호출");
			
			ProductDTO productDTO = new ProductDTO();
			System.out.println("StoreListCommand 호출2");
			
			/*
			ProductDTO productDTO = sqlSession.getMapper(MybatisProductImpl.class).getProductDTO();
			model.addAttribute("storeList", productDTO);
			 */
			
			List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			//System.out.println(storeList);
			
			model.addAttribute("storeList", storeList);
			System.out.println("StoreListCommand 호출3");
			
			//Map<String, Object> paramMap = ((Model) storeList).asMap();
			//HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			//int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getTotalCount();
		}
}
