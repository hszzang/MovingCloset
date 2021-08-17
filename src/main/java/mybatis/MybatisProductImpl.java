package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisProductImpl {

	// 스토어 리스트 불러오기
	public ProductDTO getProductDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public int getTotalCount();
	
	public void insertProduct(ProductDTO productDTO);
	public void updateProduct(ProductDTO productDTO);
	public void deleteProduct(ProductDTO productDTO);
	//public ArrayList<ProductDTO> getStoreList();
	
	//public ProductDTO view();
}
