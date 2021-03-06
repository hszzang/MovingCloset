package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisProductImpl {
	// 특정 상품 불러오기
	public ProductDTO getProductDTO(String p_idx);  
	public ProductDTO getProductDTOsfile(String p_code);  
	//public String getDetailDTO(String pd_color);
	
	// 관리자 모드용
	public List<ProductAndDetailDTO> StoreList(@Param("start")int start,
												@Param("end") int end);
	public List<ProductDTO> NewDList();
	
	// 스토어 리스트 불러오기
	public List<ProductDTO> getStoreList(ProductDTO productDTO);
	//public List<ProductDTO> getOrderedList(@Param("order") String order,
	//									@Param("flag") String flag);
	// 페이징처리한 리스트 불러오기
	public List<ProductDTO> getPagedList(@Param("flag") String flag,
										@Param("order") String order,
										@Param("start")int start,
										@Param("end") int end);
	/*
	public List<ProductDTO> getPagedList(List<ProductDTO> list,
										@Param("start")int start,
										@Param("end") int end
										);
	*/
	//public List<ProductDTO> getPagedList(Map<Integer, Integer> range);
	//public List<ProductDTO> getPagedList();
	
	// 페이징 위한 상품 수 카운트
	public int getCount(@Param("flag") String flag);
	public int getNewDCount();
	
	// 가격정렬
	public List<ProductDTO> descPrice(ProductDTO productDTO);
	public List<ProductDTO> ascPrice(ProductDTO productDTO);
	
	// 상품/디테일 입력
	public void insertProduct(ProductDTO productDTO);
	public void insertDetail(ProductDetailDTO detailDTO);

	// 상세페이지 정보 가져오기 
	public ProductDTO getStoreDetail(String p_idx);
	public ProductDetailDTO getProductDetail(String p_code);
	
	// 상품/디테일 업데이트
	public void updateProduct(ProductDTO productDTO);
	public void updateDetail(ProductDetailDTO productDetailDTO);
	
	// 상품/디테일 삭제
	public void deleteProduct(String p_idx);
	public void deleteDetail(String p_code);
	
	// 리뷰들~!
	public List<ReviewDTO> getReviews(String p_code);
	public int insertReview(ReviewDTO reviewDTO);
	public int insertReviewNoFile(ReviewDTO reviewDTO);
	public int updateReview(ReviewDTO reviewDTO);
	public int updateReviewNoFile(ReviewDTO reviewDTO);
	public void deleteReview(String r_idx);
	public ProductAndDetailDTO reviewList(String p_idx);
	
	public String getPidx(String p_code);
	
	public BuyAndGroupDTO buyReview(String userid, String p_code);
	
	public int insertBuyForm(BuyAndGroupDTO buyAndGroupDTO);
	public int insertBuy_groupForm(BuyAndGroupDTO buyAndGroupDTO);

	public int insertBuyFormMap(Map<String, Object> param);
	public int insertBuy_groupFormMap(Map<String, Object> param);

	public List<BuyAndGroupDTO> getbuyAndGroup(String b_idx);
	public int getMaxBidx();
	
	
	
	//마이페이지 리뷰리스트
	public ArrayList<ReviewDTO> mypageReviewList(String userid);
}
