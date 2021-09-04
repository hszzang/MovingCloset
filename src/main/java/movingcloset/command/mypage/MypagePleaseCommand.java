package movingcloset.command.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoBusDTO;
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.PleaseDTO;
import mybatis.ProductDTO;

@Service
public class MypagePleaseCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("MypagePleaseCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("siteUserInfo");
		
		ArrayList<PleaseDTO> myPlzList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getMyPlzList(userid);
		model.addAttribute("myPlzList", myPlzList);
		
		ArrayList<ProductDTO> myPlzProduct = new ArrayList<ProductDTO>();
		if(!myPlzList.isEmpty()) {
			
			for(PleaseDTO p : myPlzList) {
				
				myPlzProduct.add(sqlSession
						.getMapper(MybatisMoyoImpl.class).getMyPlzProduct(p.getP_code()));
			}
			model.addAttribute("myPlzProduct", myPlzProduct);
		}
	}
}
