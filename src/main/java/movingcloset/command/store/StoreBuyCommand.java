package movingcloset.command.store;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.BuyAndGroupDTO;
import mybatis.MemberDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.ProductAndDetailDTO;

@Service
public class StoreBuyCommand implements CommandImpl{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		//p_code, image, p_brand,p_name, p_price,bd_count,p_size 

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = req.getSession();
		ProductAndDetailDTO productAndDetailDTO = new ProductAndDetailDTO();
		
		String userid = (String)session.getAttribute("siteUserInfo");
		String p_idx = req.getParameter("p_idx");
		String p_code = req.getParameter("p_code");
		String p_brand = req.getParameter("p_brand");  
		String p_name = req.getParameter("p_name");
		String p_price = req.getParameter("p_price");
		String p_sfile = req.getParameter("p_sfile");
		String pd_size = req.getParameter("size");
		String bd_count = req.getParameter("bd_count");
		
		productAndDetailDTO.setP_idx(p_idx);
		productAndDetailDTO.setP_code(p_code);
		productAndDetailDTO.setP_brand(p_brand);
		productAndDetailDTO.setP_name(p_name);
		productAndDetailDTO.setP_price(p_price);
		productAndDetailDTO.setP_sfile(p_sfile);
		productAndDetailDTO.setPd_size(pd_size);
		
		if(userid != null) {
			MemberDTO memberDTO = sqlSession
					.getMapper(MybatisMoyoImpl.class).getMemberData(userid);
			
			
			
			model.addAttribute("memberDTO", memberDTO);
			model.addAttribute("productAndDetailDTO",productAndDetailDTO);
			model.addAttribute("bd_count",bd_count);
		
		}
		
		
		
		
		
		
	}
	
}
