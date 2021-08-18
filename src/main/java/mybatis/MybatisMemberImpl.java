package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public int register(MemberDTO memberDTO) ;
	public String idcheck(String userid);
	
}
