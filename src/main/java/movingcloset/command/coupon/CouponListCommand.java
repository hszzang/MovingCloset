package movingcloset.command.coupon;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl2;
import mybatis.CouponDTO;
import mybatis.MybatisCouponImpl;

@Service
public class CouponListCommand implements CommandImpl2 {
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {}

	@Override
	public void mapexecute(Map<String, Object> map) {
	
		CouponDTO couponDTO = (CouponDTO)map.get("couponDTO");
		
		ArrayList<CouponDTO> couponList =
				sqlSession.getMapper(MybatisCouponImpl.class)
				.getCouponList(couponDTO);
		
		map.put("couponList", couponList);
	}
}
