package movingcloset.command.zzim;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl2;
import mybatis.MybatisZzimImpl;
import mybatis.ZzimDTO;

@Service
public class ZzimListCommand implements CommandImpl2 {
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {}

	@Override
	public void mapexecute(Map<String, Object> map) {
	
		ZzimDTO zzimDTO = (ZzimDTO)map.get("zzimDTO");
		
		System.out.println(zzimDTO);
		ArrayList<ZzimDTO> zzimList =
				sqlSession.getMapper(MybatisZzimImpl.class)
				.getZzimList(zzimDTO);
		
		map.put("zzimList", zzimList);
	}
}
