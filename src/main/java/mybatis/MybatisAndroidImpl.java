package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisAndroidImpl {
	
	//안드로이드 로그인하기
	public MemberDTO androidLogin(String userid, String userpass);
	

}
