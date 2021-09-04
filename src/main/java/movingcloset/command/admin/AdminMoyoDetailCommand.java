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
public class AdminMoyoDetailCommand implements CommandImpl {

	public AdminMoyoDetailCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("AdminMoyoDetailCommand 호출");
		MoyoDTO moyoDTO = new MoyoDTO();
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//moyoDTO = (MoyoDTO)paramMap.get("moyoDTO");
		//System.out.println("AdminMoyoUpdateCommand 호출2");
		
		String m_idx = req.getParameter("m_idx");
		moyoDTO = sqlSession.getMapper(MybatisMoyoImpl.class).getMoyoData(m_idx);
		
		//sqlSession.getMapper(MybatisMoyoImpl.class).MoyoUpdate(moyoDTO);
		
		model.addAttribute("moyoDTO", moyoDTO);
		
		System.out.println("AdminMoyoDetailCommand 완료");
	}
	
}
