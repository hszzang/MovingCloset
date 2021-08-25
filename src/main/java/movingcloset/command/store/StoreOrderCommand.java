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
public class StoreOrderCommand implements CommandImpl {

		public StoreOrderCommand() {
			//System.out.println("스토어리스트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("order 호출");
			
			ProductDTO productDTO = new ProductDTO();
			List<ProductDTO> orderedList;
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			
			String order = req.getParameter("order");
			System.out.println(order);
			
			if(order == "new") {
				orderedList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			}
			else if(order == "lowprice") {
				orderedList = sqlSession.getMapper(MybatisProductImpl.class).ascPrice(productDTO); 
			}
			else if(order == "highprice") {
				orderedList = sqlSession.getMapper(MybatisProductImpl.class).descPrice(productDTO);
			}
			else {
				orderedList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);
			}
			
			/*
			int totalProduct = sqlSession.getMapper(MybatisProductImpl.class).getTotalCount(); 
			System.out.println(totalProduct);
			*/
			
			model.addAttribute("order", order);
			model.addAttribute("orderedList", orderedList);
			System.out.println("order 출력 완료");
		}


		
		
}
