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
public class StoreDetailCommand implements CommandImpl {

		public StoreDetailCommand() {
			//System.out.println("스토어 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreDetailCommand 호출");
			
			ProductDTO storeDetail = new ProductDTO();
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			//HttpServletRequest dto = (HttpServletRequest)paramMap.get("productDTO");
			
			System.out.println("StoreDetailCommand 호출2");
			String p_idx = req.getParameter("p_idx");
			
			System.out.println("커맨드에서 " + p_idx);
			storeDetail = sqlSession.getMapper(MybatisProductImpl.class).getStoreDetail(p_idx);
			
			System.out.println("보냈니?" + storeDetail.getP_idx());
			System.out.println(storeDetail.getP_brand());
			System.out.println(storeDetail.getP_name());
			System.out.println(storeDetail.getP_code());
			System.out.println(storeDetail.getP_price());
			System.out.println(storeDetail.getP_ofile());
			System.out.println(storeDetail.getP_sfile());
			
			model.addAttribute("storeDetail", storeDetail);
			System.out.println("StoreDetailCommand 호출3");
			
			
		}


		
		
}
