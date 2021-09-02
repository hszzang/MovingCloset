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
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;

@Service
public class MoyoCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MoyoCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String nowLat = req.getParameter("nowLat");
		String nowLon = req.getParameter("nowLon");
		
		System.out.println(nowLat);
		System.out.println(nowLon);
		
		if(nowLat == null) {
			nowLat = "37.4787305";
			nowLon = "126.8781986";
			System.out.println("입력받은 위/경도값 없음");
		}
		
		System.out.println(nowLat);
		System.out.println(nowLon);
		model.addAttribute("nowLat", nowLat);
		model.addAttribute("nowLon", nowLon);
		
		HttpSession session = req.getSession();
		String siteUserInfo = (String)session.getAttribute("siteUserInfo");
		
		if(siteUserInfo != null) {
			System.out.println("현재 로그인 아이디 :" + siteUserInfo);

			String myAddr = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMyAddr(siteUserInfo);
			model.addAttribute("myAddr", myAddr);
		}
		
		ArrayList<MoyoDTO> moyoList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoList(nowLat, nowLon);
		
		model.addAttribute("moyoList", moyoList);
		
		if(!moyoList.isEmpty()) {
			
			HashMap<String, Integer> countMoyoUser = new HashMap<String, Integer>();
			for(MoyoDTO m : moyoList) {
				countMoyoUser.put(m.getM_idx(), sqlSession
						.getMapper(MybatisMoyoImpl.class).countMoyoUser(m.getM_idx()));
				String query = sqlSession.getConfiguration().getMappedStatement("countMoyoUser")
						.getBoundSql(m.getM_idx()).getSql();
				System.out.println("moyoQuery = " + query);
			}
			
			System.out.println(countMoyoUser);
			model.addAttribute("countMoyoUser", countMoyoUser);
		}
//		System.out.println(moyoList);
	}
}
