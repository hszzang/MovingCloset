package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisSearchImpl {
	
	public List<ProductDTO> searchProducts(String search);
	
}
