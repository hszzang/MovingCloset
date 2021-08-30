package movingcloset.command.search;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisSearchImpl;
import mybatis.ProductDTO;
import mybatis.ProductDetailDTO;

@Service
public class SearchCommand implements CommandImpl {

	public SearchCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		ProductDTO productDTO = new ProductDTO();
		ProductDetailDTO detailDTO = new ProductDetailDTO();
		String keyword, search;
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		keyword = req.getParameter("keyword");
		/*
		if(keyword==null)
			keyword=" ";
		else if(keyword=="color") {
			String p_code = sqlSession.getMapper(MybatisSearchImpl.class).getDetailDTO(keyword);
		}
		*/
		System.out.println("keyword: " + keyword);
		
		search = req.getParameter("search");
		System.out.println("search: " + search);
		if(search==null)
			search=" ";
		
		String order = req.getParameter("order");
		System.out.println("order: " + order);
		
		List<ProductDTO> searchList = sqlSession.getMapper(MybatisSearchImpl.class).searchProducts(keyword, search, order);
		
		model.addAttribute("searchList", searchList );
		
	}
	
}
