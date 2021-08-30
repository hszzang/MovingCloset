package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisSearchImpl {
	
	public List<ProductDTO> searchProducts(@Param("keyword") String keyword,
											@Param("search") String search,
											@Param("order") String order);
	
	public List<String> getColors();
	public List<String> getTags();
	
	
	public String getDetailDTO(String pd_color);
	
}
