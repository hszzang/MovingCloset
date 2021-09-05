package movingcloset.command.cscenter;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MemberDTO;
import mybatis.MybatisMoyoImpl;
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
		
		System.out.println("QNA 리스트 커맨드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		QnaDTO qnaDTO = new QnaDTO();
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		if(userid != null) {
			MemberDTO memberDTO = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
			model.addAttribute("memberDTO", memberDTO);
			System.out.println(memberDTO);
					
		}
		
		qnaDTO.setUserid(userid);
		
		List<QnaDTO> qnaList = sqlSession.getMapper(MybatisQNAImpl.class).getQnaList(qnaDTO);		
		model.addAttribute("qnaList", qnaList);
		

	}
	
	
}
