package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisProductImpl {

	// 스토어 리스트 불러오기
	public ProductDTO getProductDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public int getTotalCount();
	
	public int insertProduct(ProductDTO productDTO);
	
	/*
	public int insertProduct(
							@Param("p_idx") String p_idx,
							@Param("p_brand") String p_brand,
							@Param("p_name") String p_name,
							@Param("p_code") String p_code,
							@Param("p_price") String p_price,
							@Param("p_ofile")String p_ofile, 
							@Param("p_sfile") String p_sfile
							);
	*/
	public void updateProduct(ProductDTO productDTO);
	public void deleteProduct(ProductDTO productDTO);
	//public ArrayList<ProductDTO> getStoreList();
	
	//public int insertProduct(String parameter, String parameter2, String parameter3, String parameter4,
	//		String parameter5);
	
	
	//public ProductDTO view();
}
