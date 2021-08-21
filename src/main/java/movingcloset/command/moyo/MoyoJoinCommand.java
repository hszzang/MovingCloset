package movingcloset.command.moyo;

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
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;

@Service
public class MoyoJoinCommand implements CommandImpl {
	
	public MoyoJoinCommand() {
		System.out.println("모여폼커맨드 호출");
	}

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MoyoJoinCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		MoyoUseDTO moyoUseDTO = new MoyoUseDTO();
		
		String m_idx = req.getParameter("m_idx");
		moyoUseDTO.setM_idx(m_idx);
		moyoUseDTO.setMu_email(req.getParameter("email1") + "@" + req.getParameter("email2"));
		moyoUseDTO.setMu_name(req.getParameter("username"));
		moyoUseDTO.setMu_phone(req.getParameter("mobile1") 
				+ "-" + req.getParameter("mobile2") + "-" + req.getParameter("mobile3"));
		moyoUseDTO.setMu_time(req.getParameter("moyoHour") + ":" + req.getParameter("moyoMinute"));
		
		//로그인 id정보 얻어오기(임시로 hszzang 넣어두었습니다.)
		moyoUseDTO.setUserid("hszzang");
		
		int result = sqlSession
				.getMapper(MybatisMoyoImpl.class).moyoFormDataInsert(moyoUseDTO);
		
		MoyoDTO moyoDTO = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoData(m_idx);
		
		if(result == 1) {
			System.out.println("moyouse insert 성공");
			model.addAttribute("moyoUseDTO", moyoUseDTO);
			model.addAttribute("moyoDTO", moyoDTO);
		}
		else {
			System.out.println("insert 실패");
		}
		
	}
}
