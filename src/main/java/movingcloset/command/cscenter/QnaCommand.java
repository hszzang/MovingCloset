package movingcloset.command.cscenter;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;


import mybatis.MybatisQNAImpl;
import mybatis.QnaDTO;



@Service
public class QnaCommand implements CommandImpl {
	
	public QnaCommand() {
		//System.out.println("faq커맨드 호출");
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("QNA커맨드 호출");
		
		QnaDTO qnaDTO = new QnaDTO();
		List<QnaDTO> qnaList = sqlSession.getMapper(MybatisQNAImpl.class).getQnaList(qnaDTO);
		
		
		model.addAttribute("qnaList", qnaList);
		
		

	}
	
	
}
