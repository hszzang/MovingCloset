package movingcloset.command.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoBusDTO;
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;

@Service
public class MypageMoyoBusCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MypageMoyoBusCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		ArrayList<MoyoUseDTO> moyoUseList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMyMoyoUse(userid);
		model.addAttribute("moyoUseList", moyoUseList);
		
		HashMap<String, MoyoDTO> moyoList = new HashMap<String, MoyoDTO>();
		HashMap<String, MoyoBusDTO> moyoBusList = new HashMap<String, MoyoBusDTO>();
		if(!moyoUseList.isEmpty()) {
			
			for(MoyoUseDTO m : moyoUseList) {
				
				moyoList.put(m.getM_idx(), sqlSession
						.getMapper(MybatisMoyoImpl.class).getMyMoyoList(m.getM_idx()));
				moyoBusList.put(m.getM_idx(), sqlSession
						.getMapper(MybatisMoyoImpl.class).getMyMoyoBus(m.getM_idx()));
			}
			
			model.addAttribute("moyoList", moyoList);
			model.addAttribute("moyoBusList", moyoBusList);
		}
	}
}
