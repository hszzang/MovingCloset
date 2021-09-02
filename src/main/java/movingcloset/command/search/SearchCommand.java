package movingcloset.command.search;

import java.util.ArrayList;
import java.util.Arrays;
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

@Service
public class SearchCommand implements CommandImpl {

	public SearchCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		String colorChecks = "";
		List<String> colorShow; // 색상 보기용
		List<String> tagShow; // 태그 보기용
		//ArrayList<String> sWords = new ArrayList<String>(); // 검색어 안에 스페이스 있을 경우 사용
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String keyword = req.getParameter("keyword"); // 검색 키워드
		String search = req.getParameter("search"); // 검색어
		System.out.println("search : " + search);
		//sWords.add(search);
		//System.out.println("sWords : " + sWords);
		
		if(search==null) {
			search = "";
			/*
			sWords.add(search);
			System.out.println("sWords2 : " + sWords);
			System.out.println(sWords.size());
			*/
		}
		/*
		else if(search.contains(" ")) {
			sWords = new ArrayList<String>();
			String[] searchs = search.split(" ");
			for(String str : searchs) {
				sWords.add(str);
			}	
			//System.out.println("sWords: " + sWords);
		}
		for(String i : sWords) {
			//System.out.println("sWords3 : " + sWords);
		}
		 */
		
		// 색상 보기
		colorShow = sqlSession.getMapper(MybatisSearchImpl.class).getColors();

		String[] colors = new String[colorShow.size()];
		colors = colorShow.toArray(colors);
		
		String[] viewColors =  new String[colors.length];
		String temp = null;
		String[] temp2 = null;
		
		for(int i = 0; i < colors.length; i++) {
			temp = colors[i];
			temp2 = temp.split(",");
			viewColors[i] = temp2[0].toUpperCase();	
		}
		Arrays.sort(viewColors);

		// 보기에서 색상 선택
		String color = req.getParameter("color");
		if(color != null) {
			color = color.toLowerCase();
			keyword="color";
			search = color;
		}
		
		//태그 보기
		//tagShow = sqlSession.getMapper(MybatisSearchImpl.class).getTags();
		String[] tags = {"댄디", "클래식", "캐주얼", "스포티", "모던", "스트릿", "빈티지", "러블리" };
		//tags = tagShow.toArray(tags);
		//String[] viewTags =  new String[tags.length];
		String[] viewTags = {"댄디", "클래식", "캐주얼", "스포티", "모던", "스트릿", "빈티지", "러블리" };
		String temp3 = null;
		String[] temp4 = null;
		for(int i = 0; i < tags.length; i++) {
			temp3 = tags[i];
			temp4 = temp3.split(",");
			//viewTags[i] = temp4[0].toUpperCase();	
			System.out.println("tags : " + viewTags[i]);
		}
		Arrays.sort(viewTags);

		// 보기에서 태그 선택
		String tag = req.getParameter("tag");
		if(tag != null) {
			//tag = tag.toLowerCase();
			keyword="tag";
			search = tag;
		}
		
		System.out.println("keyword : " + keyword);
		System.out.println("search : " + search);
		System.out.println("color : " + color);
		System.out.println("tag : " + tag);
		
		// 정렬
		String order = req.getParameter("order");
		
		//List<ProductDTO> searchList = sqlSession.getMapper(MybatisSearchImpl.class).searchProducts(keyword, sWords, order);
		List<ProductDTO> searchList = sqlSession.getMapper(MybatisSearchImpl.class).searchProducts(keyword, search, order);
		
		model.addAttribute("viewColors",viewColors );
		model.addAttribute("viewTags", viewTags );
		
		model.addAttribute("color", color);
		model.addAttribute("tag", tag);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("search", search);
		//model.addAttribute("sWords", sWords);
		model.addAttribute("order", order);
		//model.addAttribute("searchW", searchW);
		
		model.addAttribute("searchList", searchList );
		
	}
	
}
