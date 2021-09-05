package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMypageImpl {

	// 마이페이지 구매내역
	public List<BuyAndGroupDTO> orderlist(String userid);
	
	// 마이페이지 구매내역 상세보기
	public BuyAndGroupDTO orderdetail(String userid, String b_idx);

	// 관리자용 모든 구매내역 조회
	public List<BuyAndGroupDTO> allOrderList();
	
}
