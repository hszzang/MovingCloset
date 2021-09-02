package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisEventCouponImpl {

	public List<CouponAndUseDTO> couponCheck(String userid);
}
