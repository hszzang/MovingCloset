package movingcloset.command.moyo;

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
		
		ArrayList<MoyoDTO> moyoList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoList("37.4787305", "126.8781986");
		
		//Mapper에서 동적으로 생성되는 쿼리문을 로그로 출력
//		String sql = sqlSession
//				.getConfiguration().getMappedStatement("getMoyoList")
//				.getBoundSql().getSql();
		
		System.out.println(moyoList);

		
	}
}
