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
			int pageC = 1;
			
			Map<String, Object> paramMap = model.asMap();
			HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
			//int pageReq = Integer.parseInt(req.getParameter("pageShow"));
			String pageReq = req.getParameter("pageShow");
			System.out.println("첨 pageReq : " + pageReq);
			
			if(pageReq != null)
				pageC = Integer.parseInt(pageReq);
			/*
			if("".equals(pageReq)) {
				pageC = 1;
			}
			else if(pageReq != null) {
				pageC = Integer.parseInt(pageReq);
			}
			*/
			System.out.println("다음 : " + pageC);
			
			// totalRecordCount: 상품 총 갯수
			int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getTotalCount();
			System.out.println("총 상품 갯수 : " + totalRecordCount);
			
			// 한 페이지당 보여주는 상품 갯수 단위 60개!
			int show = 60;
			
			// 젤 처음에는 최신 60개
			int defaultShow = totalRecordCount - show;
			System.out.println("디폴트: " + defaultShow);
			
			// 페이지 갯수
			int pagesNum = (int)(Math.ceil((double)totalRecordCount/show));
			System.out.println("pageNum : " + pagesNum); // 
			
			int[] pages = new int[pagesNum];
			for(int i = 0; i < pagesNum; i++) {
				pages[i] = i+1;
				System.out.println(pages[i]); //
			}
			
			// 페이징 시작과 끝
			int startP = pages[0];
			int endP = pages[pagesNum - 1]; // 마지막 페이징
			System.out.println("페이징 ) " + startP + " 에서 시작해서, " + endP + " 에서 끝"); //
			
			// 한 페이지당 시작/끝 상품번호
			int start = totalRecordCount - (show * pageC) + 1;
			if(start < 0)
				start=1;
			int end = totalRecordCount - (show * (pageC - 1));
			
			System.out.println("start : " +start);
			System.out.println("end : " + end);
			
			//List<ProductDTO> storeList = sqlSession.getMapper(MybatisProductImpl.class).getStoreList(productDTO);		
			List<ProductDTO> pagedList = sqlSession.getMapper(MybatisProductImpl.class).getPagedList(start, end);

			//model.addAttribute("storeList", storeList);
			model.addAttribute("pagedList", pagedList);
			
			model.addAttribute("pageC", pageC);
			model.addAttribute("pages", pages);
			model.addAttribute("pageEnd", endP);
		}
		
		
}