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
			
			// 플래그 분류
			String flag = req.getParameter("flag");
			System.out.println("flag: " + flag);
			// 정렬 기준
			String order = req.getParameter("order");
			System.out.println("order : " + order);

			// paging값 pageReq
			String pageReq = req.getParameter("pageShow");
			System.out.println("몇 페이지? pageReq: " + pageReq);
						
			// 페이지 선택
			if(pageReq == null) {
				pageC = 1;
			}
			else if(pageReq != null)
				pageC = Integer.parseInt(pageReq);
			System.out.println("요청 페이지 번호 pageC : " + pageC);
			// 불러올 상품의 총 갯수 -> 플래그 없으면 전체 / 있으면 해당 플래그의 상품만.. 
			int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getCount(flag);
			//int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getCount(flag);
			System.out.println("불러내는 상품 갯수: " + totalRecordCount);
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
			
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);		
			List<ProductDTO> pagedList = sqlSession.getMapper(MybatisProductImpl.class).getPagedList(flag, order, start, end);

			//model.addAttribute("storeList", storeList);
			model.addAttribute("pagedList", pagedList);
			
			model.addAttribute("flag", flag);
			model.addAttribute("pageC", pageC);
			model.addAttribute("pages", pages);
			model.addAttribute("start", startP);
			model.addAttribute("pageEnd", endP);
			model.addAttribute("order", order);
			
		}
		
		
}