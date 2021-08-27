package movingcloset.command.store;

import java.util.ArrayList;
import java.util.HashMap;
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

		public StoreListCommand() {}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			ProductDTO productDTO = new ProductDTO();
			int pageC = -1;
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			//int pageReq = Integer.parseInt(req.getParameter("pageShow"));
			
			// paging값
			String pageReq = req.getParameter("pageShow");
			// 정렬 기준
			String order = req.getParameter("order");
			// 플래그 분류
			String flag = req.getParameter("flag");
			
			if(pageReq == null) {
				pageC = 1;
			}
			else if(pageReq != null)
				pageC = Integer.parseInt(pageReq);
			
			// totalRecordCount: 상품 총 갯수
			int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getTotalCount();
			// 한 페이지당 보여주는 상품 갯수 단위 60개!
			int show = 60;
			
			// 페이지 갯수
			int pagesNum = (int)(Math.ceil((double)totalRecordCount/show));
			// 셀렉트문으로 페이징을 하니깐 배열로 해서 forEach문으로 나열 ㄱㄱ
			int[] pages = new int[pagesNum];
			for(int i = 0; i < pagesNum; i++) {
				pages[i] = i+1;
			}
			// 페이징 시작과 끝
			int startP = pages[0];
			int endP = pages[pagesNum - 1]; // 마지막 페이징
			// 한 페이지당 시작/끝 상품번호
			int start = totalRecordCount - (show * pageC) + 1;
			if(start <= 0)
				start = 1;
			int end = totalRecordCount - (show * (pageC - 1));
			System.out.println("start : " + start);
			System.out.println("end : " + end);
			System.out.println("pageC : " + pageC);
			
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);		
			List<ProductDTO> pagedList = sqlSession.getMapper(MybatisProductImpl.class).getPagedList(start, end, order, flag);

			//model.addAttribute("storeList", storeList);
			model.addAttribute("pagedList", pagedList);
			
			model.addAttribute("pageC", pageC);
			model.addAttribute("pages", pages);
			model.addAttribute("start", startP);
			model.addAttribute("pageEnd", endP);
			
		}
		
		
}