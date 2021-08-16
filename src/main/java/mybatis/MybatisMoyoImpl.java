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
	public HashMap<String, Integer> countMoyoUser(ArrayList<String> moyoIdxList);
	

}
