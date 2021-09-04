package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public int idcheck(String userid);
	public MemberDTO login(String userid, String userpw);
	public int membercheck(String email, String loginbrand);
	public MemberDTO memberInfo(String email, String loginbrand);
	
	
	//아이디 찾기
	public String findId(String name, String email);
	
	//비밀번호 찾는 회원의 이메일이 맞는지 확인
	public String findPwEmail(String userid, String email);
	
	//새로 생성한 임시비밀번호로 회원정보 변경
	public int changeNewPw(String newPw, String userid, String email);
	
	//회원탈퇴
	public int memberOut(String userid);

	// 관리자모드 회원명단
	public List<MemberDTO> getMemberList ();

	//회원정보수정
	public int memberEdit(String email,String phone,String userid);
	
	// 회원 비밀번호 확인(회원 정보 수정하기)
	public int memberPassCheck(String userpass);
	

	
}
