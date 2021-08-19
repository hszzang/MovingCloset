package movingcloset.command;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import movingcloset.util.JSFunction;
import mybatis.MemberDTO;
import mybatis.MybatisMemberImpl;

@Service
public class RegisterActionCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {

		System.out.println("회원가입 커맨드 호출됨");
		Map<String, Object> paramMap = model.asMap();
		MemberDTO memberDTO = (MemberDTO)paramMap.get("memberDTO");
		
		int result = sqlSession.getMapper(MybatisMemberImpl.class).register(memberDTO); // 세션영역에 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용
		System.out.println("입력결과"+result);

		
	}
	
	/*
	 * @Override public void execute(Model model) { try {
	 * System.out.println("회원가입 커맨드 호출됨"); Map<String, Object> paramMap =
	 * model.asMap(); MemberDTO memberDTO = (MemberDTO)paramMap.get("memberDTO");
	 * 
	 * int result =
	 * sqlSession.getMapper(MybatisMemberImpl.class).register(memberDTO); // 세션영역에
	 * 저장된 VO객체로 부터 아이디를 얻어와 파라미터로 사용 System.out.println("입력결과"+result); }catch
	 * (DataIntegrityViolationException e) { try { HttpServletResponse response =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).
	 * getResponse(); response.setContentType("text/html; charset=UTF-8");
	 * PrintWriter out = response.getWriter(); String str = "" + "<script>" +
	 * "	alert('냐아아아');  " + "	history.back();  " + "</script>";
	 * out.println(str); System.out.println("냐아아아"); } catch (IOException e2) {
	 * e2.printStackTrace(); }
	 * 
	 * } }
	 */

}
