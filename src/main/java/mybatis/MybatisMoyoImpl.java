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

	
	/****** 쪼르기 ******/
	//쪼르기 리스트 불러오기
	public ArrayList<PleaseDTO> getPlzList();
	
	//쪼르기 상품정보 불러오기
	public ProductDTO getPlzProduct(String p_code);
	
	//쪼르기별 모인 인원수 가져오기
	public int countPlzUser(String plz_idx);
	
	//쪼르기 신청
	public int insertPlzJoin(String plz_idx, String userid);
	
	
	/****** 마이페이지 모여버스 ******/
	//내 모여신청내역(MoyoUse) 조회
	public ArrayList<MoyoUseDTO> getMyMoyoUse(String userid);
	
	//내 모여신청내역(Moyo) 조회
	public MoyoDTO getMyMoyoList(String m_idx);
	
	//내 모여신청내역(MoyoBus) 조회
	public MoyoBusDTO getMyMoyoBus(String m_idx);
	
	//내 모여 삭제
	public int deleteMyMoyo(String m_idx, String userid);

	
	/****** 마이페이지 쪼르기내역 ******/
	public ArrayList<PleaseDTO> getMyPlzList(String userid);
	
	public ProductDTO getMyPlzProduct(String p_code);
	
	public int deleteMyPlz(String plz_idx, String userid); 
	
	
	/****** 지난모여쪼르기 ******/
	public ArrayList<MoyoDTO> endMoyoList();
	
	public ArrayList<PleaseDTO> endPlzList();
	
	
	
	

}
