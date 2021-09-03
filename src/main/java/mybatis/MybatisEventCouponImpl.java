package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisEventCouponImpl {

	// 상세페이지 -> 구매폼 넘길때 쿠폰 받아오기
	public List<CouponAndUseDTO> couponCheck(String userid);
	
	
}
