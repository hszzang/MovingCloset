package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisAndroidImpl {
	
	//안드로이드 로그인하기
	public MemberDTO androidLogin(String userid, String userpass);
	
	//안드로이드 모여리스트 가져오기
	public ArrayList<MoyoDTO> andGetMoyoList(String latitude, String longitude);
	
	//안드로이드 내 모여리스트 보기
	public ArrayList<MoyoDTO> andGetMyMoyoList(String userid);
	
	//안드로이드 내 모여 신청 정보 보기
	public MoyoUseDTO andGetMyMoyoInfo(String m_idx, String userid);
	
	

}
