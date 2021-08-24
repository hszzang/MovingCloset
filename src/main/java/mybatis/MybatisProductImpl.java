package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisProductImpl {

	// 스토어 리스트 불러오기
	public ProductDTO getProductDTO();
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	public int getTotalCount();
	
	public List<ProductDTO> descPrice(ProductDTO productDTO);
	public List<ProductDTO> ascPrice(ProductDTO productDTO);
	
	public void insertProduct(ProductDTO productDTO);
	public void insertDetail(ProductDetailDTO detailDTO);

	public ProductDTO getStoreDetail(String p_idx);

	public ProductDetailDTO getProductDetail(String p_code);
	
	public void updateProduct(ProductDTO productDTO);
	public void updateDetail(ProductDetailDTO productDetailDTO);
	
	public void deleteProduct(String p_idx);
	
	public List<ReviewDTO> getReviews(String p_code);
	public void insertReview(ReviewDTO reviewDTO);
	public void updateReview(ReviewDTO reviewDTO);
	public void deleteReview(String r_idx);
	
	public String getPidx(String p_code);
	
}
