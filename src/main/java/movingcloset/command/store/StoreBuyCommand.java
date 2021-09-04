package movingcloset.command.store;

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
import mybatis.BuyAndGroupDTO;
import mybatis.CouponAndUseDTO;
import mybatis.MemberDTO;
import mybatis.MybatisEventCouponImpl;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

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
		ProductDTO productDTO = new ProductDTO();
		
		/*
			-private String  b_totalpay;
			-private String  b_buyer;
			-private String  b_phone;
			-private String  b_postcode;
			-private String  b_addr;
			-private String  b_payment;
			-private String  b_waybill;
			-private String  userid;
			-private String  p_code;
			private String  cou_code;
			private String  bd_count;
			private String  bd_size;
		 */
		
		String userid = (String)session.getAttribute("siteUserInfo");
		String b_buyer = req.getParameter("b_buyer");
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");  
		String mobile3 = req.getParameter("mobile3");
		String postcode = req.getParameter("postcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String bd_count = req.getParameter("bd_count");
		String p_code = req.getParameter("p_code");
		String bd_size = req.getParameter("bd_size");
		String b_totalpay = req.getParameter("b_totalpay");
		String b_payment = req.getParameter("b_payment");
		String accountnumber = req.getParameter("accountnumber");
		String num = req.getParameter("num");
		List<String> cou_code = new ArrayList();

		try {
			int intnum = Integer.parseInt(num);
			for(int i=0; i<= intnum ; i++) {
				cou_code.add(req.getParameter("cou_check"+i));
			}			
		} catch (NumberFormatException e) {

		} catch (Exception e) {
		
		}
			

		BuyAndGroupDTO buyAndGroupDTO = new BuyAndGroupDTO();
		
		
		buyAndGroupDTO.setB_buyer(b_buyer);
		buyAndGroupDTO.setUserid(userid);
		buyAndGroupDTO.setB_phone(mobile1+"-"+mobile2+"-"+mobile3);
		buyAndGroupDTO.setB_postcode(postcode);
		buyAndGroupDTO.setB_addr(addr1+" "+addr2);
		buyAndGroupDTO.setEmail(email1+"@"+email2);
		buyAndGroupDTO.setBd_count(bd_count);
		buyAndGroupDTO.setP_code(p_code);
		buyAndGroupDTO.setBd_size(bd_size);
		buyAndGroupDTO.setB_totalpay(b_totalpay);
		buyAndGroupDTO.setB_payment(b_payment);
		buyAndGroupDTO.setB_waybill("MC"+p_code);
		buyAndGroupDTO.setAccountnumber(accountnumber);
		buyAndGroupDTO.setCou_code(cou_code.toString());
		
		Map<String, Object> buylist = new HashMap<String, Object>();
		buylist.put("buyAndGroupDTO", buyAndGroupDTO);
		buylist.put("cou_code", cou_code);
		

		
		if(userid != null) {
			
			int result = sqlSession.getMapper(MybatisProductImpl.class).insertBuyForm(buyAndGroupDTO);
			int result2 = sqlSession.getMapper(MybatisProductImpl.class).insertBuy_groupForm(buyAndGroupDTO);
			model.addAttribute("buyAndGroupDTO",buyAndGroupDTO);
			productDTO = sqlSession.getMapper(MybatisProductImpl.class).getProductDTOsfile(p_code);
			
			model.addAttribute("productDTO",productDTO);
			System.out.println("구매폼 insert : "+result+"구매폼group insert : "+result2);
		
		
		
		
		}
		
	}
	
}
