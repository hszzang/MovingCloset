package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisAndroidImpl {
	
	//안드로이드 로그인하기
	public MemberDTO androidLogin(String userid, String userpass);
	
	//안드로이드 모여버스 로그인하기
	public MoyoBusDTO androidMoyoBusLogin(String userid, String userpass);
	
	//안드로이드 모여리스트 가져오기
	public ArrayList<MoyoDTO> andGetMoyoList(String latitude, String longitude);
	
	//안드로이드 내 모여리스트 보기
	public ArrayList<MoyoDTO> andGetMyMoyoList(String userid);
	
	//안드로이드 내 모여 신청 정보 보기
	public MoyoUseDTO andGetMyMoyoInfo(String m_idx, String userid);
	
	//안드로이드 모여 정보 불러오기
	public MoyoDTO andGetMoyoInfo(String m_idx);
	
	//안드로이드에서 가져온 모여버스 정보 업데이트
	public int andUpdateMoyoBus(String latitude, String longitude, String mb_addr, String mb_status, String busid);
	
	//모여버스 정보 가져오기
	public MoyoBusDTO andGetMoyoBus(String m_idx);
	

}
