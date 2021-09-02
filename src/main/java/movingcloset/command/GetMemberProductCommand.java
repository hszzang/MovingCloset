package movingcloset.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mybatis.BuyAndGroupDTO;
import mybatis.CouponAndUseDTO;
import mybatis.MemberDTO;
import mybatis.MybatisCompanyImpl;
import mybatis.MybatisEventCouponImpl;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

@Service
public class GetMemberProductCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		ProductAndDetailDTO productAndDetailDTO = new ProductAndDetailDTO();
		
		String userid = (String)session.getAttribute("siteUserInfo");
		String p_idx = req.getParameter("p_idx");
		String p_code = req.getParameter("code");
		String p_brand = req.getParameter("p_brand");
		String p_name = req.getParameter("p_name");
		String p_price = req.getParameter("p_price");
		String pd_size = req.getParameter("size");
		String bd_count = req.getParameter("bd_count");
		
		productAndDetailDTO.setP_idx(p_idx);
		productAndDetailDTO.setP_code(p_code);
		productAndDetailDTO.setP_brand(p_brand);
		productAndDetailDTO.setP_name(p_name);
		productAndDetailDTO.setP_price(p_price);
		productAndDetailDTO.setPd_size(pd_size);
		
		if(userid != null) {
			MemberDTO memberDTO = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
			ProductDTO productDTO = sqlSession
					.getMapper(MybatisProductImpl.class).getProductDTO(p_idx);
			List<CouponAndUseDTO> couponAndUseDTO = sqlSession
					.getMapper(MybatisEventCouponImpl.class).couponCheck(userid);
			
			
			model.addAttribute("memberDTO", memberDTO);
			model.addAttribute("productAndDetailDTO",productAndDetailDTO);
			model.addAttribute("productDTO",productDTO);
			model.addAttribute("bd_count",bd_count);
			model.addAttribute("couponAndUseDTO",couponAndUseDTO);
			
		}
		
	}
}
