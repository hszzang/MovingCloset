package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public int idcheck(String userid);
	public String login(String userid, String userpass);
	
}
