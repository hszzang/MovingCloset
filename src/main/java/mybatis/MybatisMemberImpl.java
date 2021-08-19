package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public int idcheck(String userid);
	
	//아이디 찾기
	public String findId(String name, String email);
	
	//비밀번호 찾는 회원의 이메일이 맞는지 확인
	public String findPwEmail(String name, String email);
	
}
