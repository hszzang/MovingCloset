package movingcloset.command.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

@Service
public class AdminMoyoUpdateCommand implements CommandImpl {

	public AdminMoyoUpdateCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("AdminMoyoUpdateCommand 호출");
		MoyoDTO moyoDTO = new MoyoDTO();
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		moyoDTO = (MoyoDTO)paramMap.get("moyoDTO");
		System.out.println("AdminMoyoUpdateCommand 호출2");
		
		//String m_idx = req.getParameter("m_idx");
		String m_name = req.getParameter("m_name");
		String m_addr = req.getParameter("m_addr");
		String m_lat = req.getParameter("m_lat");
		String m_lon = req.getParameter("m_lon");
		String m_goal = req.getParameter("m_goal");
		String m_dday = req.getParameter("m_dday");
		String m_desc = req.getParameter("m_desc");
		String m_start = req.getParameter("m_start");
		String m_end = req.getParameter("m_end");
		String m_status = req.getParameter("m_status");
		
		System.out.println("AdminMoyoUpdateCommand 호출3");
		
		//moyoDTO.setM_idx(m_idx);
		moyoDTO.setM_name(m_name);
		moyoDTO.setM_addr(m_addr);
		moyoDTO.setM_lat(m_lat);
		moyoDTO.setM_lon(m_lon);
		moyoDTO.setM_goal(m_goal);
		moyoDTO.setM_dday(m_dday);
		moyoDTO.setM_desc(m_desc);
		moyoDTO.setM_start(m_start);
		moyoDTO.setM_end(m_end);
		moyoDTO.setM_status(m_status);
		
		sqlSession.getMapper(MybatisMoyoImpl.class).MoyoUpdate(moyoDTO);
		
		model.addAttribute("moyoDTO", moyoDTO);
		
		System.out.println("AdminMoyoUpdateCommand 완료");
	}
	
}
