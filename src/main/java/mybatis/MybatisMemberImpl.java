package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public int idcheck(String userid);
	
	//아이디 찾기
	public String findId(String name, String phone);
	
}
