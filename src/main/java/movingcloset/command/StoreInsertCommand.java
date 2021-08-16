package movingcloset.command;

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
			System.out.println("StoreInsertCommand 호출2");
			
			List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).insertProduct(productDTO);
			
			
			model.addAttribute("storeList", storeList);
			System.out.println("StoreInsertCommand 호출3");
			
			
		}
}
