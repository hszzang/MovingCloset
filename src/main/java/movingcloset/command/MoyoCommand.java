package movingcloset.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		MoyoDTO moyoDTO = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMoyoList();
		
		//Mapper에서 동적으로 생성되는 쿼리문을 로그로 출력
//		String sql = sqlSession
//				.getConfiguration().getMappedStatement("getMoyoList")
//				.getBoundSql().getSql();
		
		System.out.println(moyoDTO.getM_addr());

		
	}
}
