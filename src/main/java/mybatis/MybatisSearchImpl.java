package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisSearchImpl {
	/*
	public List<ProductDTO> searchProducts(@Param("keyword") String keyword,
											@Param("search") String search,
											@Param("order") String order);
	*/
	public List<ProductDTO> searchProducts(@Param("keyword") String keyword,
											@Param("sWords") ArrayList<String> sWords,
											@Param("order") String order);
	
	//public List<String> getColors();
	public Set<String> getColors();
	public List<String> getTags();
	
	public List<ProductDTO> colorPicked(@Param("color") String color);
	
	public String getDetailDTO(String pd_color);
	
}
