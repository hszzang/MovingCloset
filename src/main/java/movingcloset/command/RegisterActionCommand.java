package movingcloset.command;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.model.JDBCTemplateDAO;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Service
public class RegisterActionCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	// Dao 빈 자동주입 받기
	@Autowired
	JDBCTemplateDAO dao; 
	
	@Override
	public void execute(Model model) {
		System.out.println("회원가입 커맨드 호출됨");
		Map<String, Object> paramMap = model.asMap();
		MemberDTO memberDTO = (MemberDTO)paramMap.get("memberDTO");
		
		sqlSession.getMapper(MybatisMemberImpl.class)
			.register(memberDTO); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
		//System.out.println("입력결과"+result);
		
	}

}
