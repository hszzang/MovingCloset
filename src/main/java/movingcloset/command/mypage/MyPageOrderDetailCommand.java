package movingcloset.command.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.BuyAndGroupDTO;
import mybatis.CouponAndUseDTO;
import mybatis.MemberDTO;
import mybatis.MybatisEventCouponImpl;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisMypageImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;

@Service
public class MyPageOrderDetailCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		String b_idx = req.getParameter("b_idx");
		String p_code = req.getParameter("p_code");
		
		BuyAndGroupDTO buyAndGroupDTO = new BuyAndGroupDTO();
		ProductDTO productDTO = new ProductDTO(); 
		buyAndGroupDTO = sqlSession.getMapper(MybatisMypageImpl.class).orderdetail(userid, b_idx);
		productDTO = sqlSession.getMapper(MybatisProductImpl.class).getProductDTOsfile(p_code);
		
		model.addAttribute("buyAndGroupDTO",buyAndGroupDTO);
		model.addAttribute("productDTO",productDTO);
		
	}
}
