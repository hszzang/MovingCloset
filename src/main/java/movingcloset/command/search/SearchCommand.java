package movingcloset.command.search;

import java.util.ArrayList;
import java.util.HashMap;
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
		List<String> colorList;
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		keyword = req.getParameter("keyword");
		System.out.println("keyword: " + keyword);
		
		if(keyword == "color") {
			colorList = sqlSession.getMapper(MybatisSearchImpl.class).getColors();
		}
			
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
