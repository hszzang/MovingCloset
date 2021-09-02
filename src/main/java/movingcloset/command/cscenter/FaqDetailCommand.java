package movingcloset.command.cscenter;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.FaqDTO;
import mybatis.MybatisFAQImpl;



@Service
public class FaqDetailCommand implements CommandImpl {
	
	public FaqDetailCommand() {
		
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("FAQ디테일 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String faq_idx = req.getParameter("faq_idx");
		System.out.println("faq_idx" + faq_idx);
		
		FaqDTO faqDTO = sqlSession
				.getMapper(MybatisFAQImpl.class).getFaqDetail(faq_idx);
		
		model.addAttribute("faqDTO", faqDTO);
		

	}
	
	
}
