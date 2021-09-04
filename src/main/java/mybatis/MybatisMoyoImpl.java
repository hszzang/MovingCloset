package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMoyoImpl {
	
	//현재 로그인 계정의 주소 불러오기
	public String getMyAddr(String userid);
	
	//모여 리스트 불러오기
	public ArrayList<MoyoDTO> getMoyoList(String nowLat, String nowLon);
	
	//모인 인원 가져오기
	public int countMoyoUser(String m_idx);
	
	//모여폼에 모여데이터 가져오기
	public MoyoDTO getMoyoData(String m_idx);
	
	//모여폼에 기존 회원정보 가져오기
	public MemberDTO getMemberData(String userid);

	//모여폼 제출 데이터 insert
	public int moyoFormDataInsert(MoyoUseDTO moyoUseDTO);

	//관리자용 모여 리스트 불러오기
	public ArrayList<MoyoDTO> MoyoList();
	//public ArrayList<String> MoyoList();
	

	
	
	/****** 마이페이지 모여버스 ******/
	//내 모여신청내역(MoyoUse) 조회
	public ArrayList<MoyoUseDTO> getMyMoyoUse(String userid);
	
	//내 모여신청내역(Moyo) 조회
	public MoyoDTO getMyMoyoList(String m_idx);
	
	//내 모여신청내역(MoyoBus) 조회
	public MoyoBusDTO getMyMoyoBus(String m_idx);


}
