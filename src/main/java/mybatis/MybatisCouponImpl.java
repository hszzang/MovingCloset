package mybatis;

import java.util.ArrayList;

public interface MybatisCouponImpl {
 
	public ArrayList<CouponDTO> getCouponList(CouponDTO couponDTO);
	
	public void couponDown(CouponDTO couponDTO);
	
}
