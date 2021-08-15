package mybatis;

import org.springframework.stereotype.Service;

@Service
public interface MybatisProductImpl {

	// 스토어 리스트 불러오기
	public ProductDTO getStoreList();
	
}
