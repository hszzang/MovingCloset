package mybatis;


import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisNewDImpl {
	
	     
	// 뉴디 리스트 불러오기
	/*
	 * public ProductDTO getProductDTO(); public NewdDTO getNewdDTO(); //public
	 * List<ProductDTO> getStoreList(ProductDTO productDTO); public List<NewdDTO>
	 * getNewdList(NewdDTO newdDTO); public int getTotalCount();
	 */
	
	//해야해 이건 예시일뿐이야
	/*
	public ProductDTO getProductDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public int getTotalCount();
	*/
	
	// 뉴디 리스트 불러오기
	public ProductDTO getProductDTO();
	public NewdDTO getNewdDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public List<NewdDTO> getNewdList(NewdDTO newdDTO);
	public int getTotalCount();
	
	//해야해 이건 예시일뿐이야
	/*
	public ProductDTO getProductDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public int getTotalCount();
	*/
	
}
