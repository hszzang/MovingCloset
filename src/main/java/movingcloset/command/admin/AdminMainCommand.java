package movingcloset.command.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

@Service
public class AdminMainCommand implements CommandImpl {

	public AdminMainCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		int pageC = -1;
		String flag = null;

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String pageReq = req.getParameter("pageShow");
		System.out.println("Admin pageReq: " + pageReq);
		
		// 페이지 선택
		if(pageReq == null) {
			pageC = 1;
		}
		else if(pageReq != null)
			pageC = Integer.parseInt(pageReq);
		System.out.println("요청된 스토어 관리자 페이지 번호 pageC : " + pageC);
		// 불러올 상품의 총 갯수 -> 플래그 없으면 전체 / 있으면 해당 플래그의 상품만.. 
		int totalRecordCount = sqlSession.getMapper(MybatisProductImpl.class).getCount(flag);
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
		
		
		List<ProductAndDetailDTO> StoreList = sqlSession.getMapper(MybatisProductImpl.class).StoreList(start, end);
		
		model.addAttribute("StoreList", StoreList);
		
		
	}
	
}
