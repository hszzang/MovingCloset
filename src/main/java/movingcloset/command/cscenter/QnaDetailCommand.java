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
import mybatis.MybatisQNAImpl;
import mybatis.QnaDTO;



@Service
public class QnaDetailCommand implements CommandImpl {
	
	public QnaDetailCommand() {
		
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("QNA디테일 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String q_idx = req.getParameter("q_idx");
		System.out.println("q_idx" + q_idx);
		
		QnaDTO qnaDTO = sqlSession
				.getMapper(MybatisQNAImpl.class).getQnaDetail(q_idx);
		
		model.addAttribute("qnaDTO", qnaDTO);
		

	}
	
	
}
