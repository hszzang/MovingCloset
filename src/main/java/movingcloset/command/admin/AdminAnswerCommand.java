package movingcloset.command.admin;

import java.util.ArrayList;
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
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.MybatisQNAImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;
import mybatis.QnaDTO;

@Service
public class AdminAnswerCommand implements CommandImpl {

	public AdminAnswerCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("관리자 Anwer 커맨드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		QnaDTO qnaDTO = new QnaDTO();
		
		String q_idx = req.getParameter("q_idx");
		String q_cate = req.getParameter("q_cate");
		String q_title = req.getParameter("q_title");
		String q_content = req.getParameter("q_content");
		//String q_date = req.getParameter("q_date");
		
		
		qnaDTO.setQ_idx(q_idx);
		qnaDTO.setQ_cate(q_cate);
		qnaDTO.setQ_title(q_title);
		qnaDTO.setQ_content(q_content);
		//qnaDTO.setQ_date(q_date);
		
		//추가중
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		if(userid != null) {
			MemberDTO memberDTO = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
			model.addAttribute("memberDTO", memberDTO);
			System.out.println(memberDTO);
					
		}
		
		qnaDTO.setUserid(userid);
		
		sqlSession.getMapper(MybatisQNAImpl.class).insertQNA(qnaDTO);
		
		model.addAttribute("qnaDTO", qnaDTO);
		
		//List<QnaDTO> qnaList = sqlSession.getMapper(MybatisQNAImpl.class).QnAList();
		
		//model.addAttribute("qnaList", qnaList);
		
		
	}
	
}
