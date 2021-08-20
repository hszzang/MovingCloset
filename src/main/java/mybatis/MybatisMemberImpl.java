package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public int idcheck(String userid);
	
	//아이디 찾기
	public String findId(String name, String email);
	
	//비밀번호 찾는 회원의 이메일이 맞는지 확인
	public String findPwEmail(String userid, String email);
	
	//새로 생성한 임시비밀번호로 회원정보 변경
	public int changeNewPw(String newPw, String userid, String email);
	
}
