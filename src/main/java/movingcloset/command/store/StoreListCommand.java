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

import movingcloset.util.PagingUtil;

@Service
public class StoreListCommand implements CommandImpl {

		public StoreListCommand() {}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			ProductDTO productDTO = new ProductDTO();
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			
			model.addAttribute("storeList", storeList);
			
		}
		
		
}
