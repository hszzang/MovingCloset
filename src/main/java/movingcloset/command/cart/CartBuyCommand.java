package movingcloset.command.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.CartDTO;
import mybatis.CouponAndUseDTO;
import mybatis.MemberDTO;
import mybatis.MybatisCartImpl;
import mybatis.MybatisEventCouponImpl;
import mybatis.MybatisMoyoImpl;

@Service
public class CartBuyCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();		
		
		
		String userid = (String)session.getAttribute("siteUserInfo");
		String totalprice = req.getParameter("totalprice");
		String allCidx = req.getParameter("hiddencidx");
		System.out.println("cidx 체크박스 : "+allCidx);
		List<CartDTO> cartDTO = new ArrayList<CartDTO>();
		List<String> arrlist = new ArrayList<String>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		String[] arrcidx = allCidx.split(",");
		if(arrcidx.length == 1) {
			cartDTO = sqlSession
					.getMapper(MybatisCartImpl.class).cartBuyList(userid,allCidx);
		}else {
		    for(int i=0; i< arrcidx.length; i++){
		         
		    	arrlist.add(arrcidx[i].toString());
		    	
		    }
		    param.put("arrlist", arrlist);
		    param.put("userid", userid);
			cartDTO = sqlSession
					.getMapper(MybatisCartImpl.class).cartBuyListMap(param);
		}
		
		
		
		MemberDTO memberDTO = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
		
		
		
		List<CouponAndUseDTO> couponAndUseDTO = sqlSession
				.getMapper(MybatisEventCouponImpl.class).couponCheck(userid);
		
		model.addAttribute("couponAndUseDTO",couponAndUseDTO);
		model.addAttribute("cartDTO",cartDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("totalprice", totalprice);

	}

}
