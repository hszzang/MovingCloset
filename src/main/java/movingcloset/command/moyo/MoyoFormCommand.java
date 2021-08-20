package movingcloset.command.moyo;

import java.util.ArrayList;
import java.util.HashMap;
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

@Service
public class MoyoFormCommand implements CommandImpl {
	
	public MoyoFormCommand() {
		System.out.println("모여폼커맨드 호출");
	}

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MoyoFormCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String m_idx = req.getParameter("m_idx");
		System.out.println("m_idx" + m_idx);
		
		MoyoDTO moyoDTO = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoData(m_idx);
		
		model.addAttribute("moyoDTO", moyoDTO);
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		if(userid != null) {
			MemberDTO memberDTO = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
			model.addAttribute("memberDTO", memberDTO);
			System.out.println(memberDTO);
		}
		
		
		System.out.println(moyoDTO);
	}
}
