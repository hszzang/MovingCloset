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
import mybatis.MybatisMoyoImpl;

@Service
public class MoyoCommand implements CommandImpl {
	
	public MoyoCommand() {
		System.out.println("모여커맨드 호출");
	}

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
		
		
		//로그인기능 구현 후 추가
//		String myAddr = sqlSession
//				.getMapper(MybatisMoyoImpl.class).getMyAddr("현재로그인아이디");
//		model.addAttribute("myAddr", myAddr);
		
		ArrayList<MoyoDTO> moyoList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoList(nowLat, nowLon);
		
		model.addAttribute("moyoList", moyoList);
		
		ArrayList<String> moyoIdxList = new ArrayList<String>();
		for(MoyoDTO m : moyoList) {
			moyoIdxList.add(m.getM_idx());
		}
		
		if(!moyoList.isEmpty()) {
			
			HashMap<String, Integer> countMoyoUser = sqlSession
					.getMapper(MybatisMoyoImpl.class).countMoyoUser(moyoIdxList);
			
			System.out.println(countMoyoUser);
			model.addAttribute("countMoyoUser", countMoyoUser);
		}
		
		
		System.out.println(moyoList);
	}
}