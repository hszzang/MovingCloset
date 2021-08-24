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
public class StoreListCommand implements CommandImpl {

		public StoreListCommand() {
			//System.out.println("스토어리스트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			ProductDTO productDTO = new ProductDTO();
			
			List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);

			int totalProduct = sqlSession.getMapper(MybatisProductImpl.class).getTotalCount(); 
			System.out.println(totalProduct);
			
			model.addAttribute("storeList", storeList);
			
		}


		
		
}