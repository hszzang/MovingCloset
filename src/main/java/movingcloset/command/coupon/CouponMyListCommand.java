package movingcloset.command.coupon;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.CouponDTO;
import mybatis.MemberDTO;
import mybatis.MybatisCouponImpl;
import mybatis.MybatisZzimImpl;
import mybatis.ZzimDTO;

@Service
public class CouponMyListCommand implements CommandImpl {
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession(); 
		CouponDTO couponDTO = new CouponDTO();
		
		String userid = (String) session.getAttribute("siteUserInfo");
		couponDTO.setUserid(userid);
		
		ArrayList<CouponDTO> couponlist = sqlSession.getMapper(MybatisCouponImpl.class).MyCouponList(couponDTO);
		
		model.addAttribute("couponlist",couponlist);
	}

}
