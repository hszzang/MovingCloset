package movingcloset.command.cscenter;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.FaqDTO;
import mybatis.MybatisFAQImpl;



@Service
public class FaqCommand implements CommandImpl {
	
	public FaqCommand() {
		//System.out.println("faq커맨드 호출");
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("FAQ커맨드 호출");
		
		FaqDTO faqDTO = new FaqDTO();
		List<FaqDTO> faqList = sqlSession.getMapper(MybatisFAQImpl.class).getFaqList(faqDTO);
		model.addAttribute("faqList", faqList);
		

	}
	
	
}
