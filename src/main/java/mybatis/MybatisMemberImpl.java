package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMemberImpl {

	public MemberDTO register(MemberDTO memberDTO) ;
	
}
