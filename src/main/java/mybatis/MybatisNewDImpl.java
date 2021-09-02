package mybatis;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisNewDImpl {
	
	    
	// 뉴디 리스트 불러오기
	public ProductDTO getProductDTO();
	public NewdDTO getNewdDTO();
	//public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public List<ProductDTO> getNewdList(ProductDTO productDTO);
	
	
	
	public ArrayList<NewdDTO> getDesignerList(NewdDTO newdDTO);
	
	
}
