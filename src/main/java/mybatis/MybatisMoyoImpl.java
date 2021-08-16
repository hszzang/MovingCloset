package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMoyoImpl {
	
	//모여 리스트 불러오기
	public MoyoDTO getMoyoList();

}
