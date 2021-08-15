package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMoyoImpl {
	
	//모여 리스트 불러오기
	public ArrayList<MoyoDTO> getMoyoList(String nowLat, String nowLon);

}
