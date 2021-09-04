package movingcloset.command.zzim;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MemberDTO;
import mybatis.MybatisZzimImpl;
import mybatis.ZzimDTO;

@Service
public class ZzimAllListCommand implements CommandImpl {
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession(); 
		ZzimDTO zzimDTO = new ZzimDTO();
		
		String userid = (String) session.getAttribute("siteUserInfo");
		zzimDTO.setUserid(userid);
		
		ArrayList<ZzimDTO> zzimlist = sqlSession.getMapper(MybatisZzimImpl.class).zzimAllList(zzimDTO);
		
		model.addAttribute("zzimlist",zzimlist);
	}

}
