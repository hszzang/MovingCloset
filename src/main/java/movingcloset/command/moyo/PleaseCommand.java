package movingcloset.command.moyo;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisMoyoImpl;
import mybatis.PleaseDTO;
import mybatis.ProductDTO;

@Service
public class PleaseCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("PleaseCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		ArrayList<PleaseDTO> plzList = sqlSession
				.getMapper(MybatisMoyoImpl.class).getPlzList();
		model.addAttribute("plzList", plzList);

		if(!plzList.isEmpty()) {
			
			for(PleaseDTO p : plzList) {
				ArrayList<ProductDTO> plzProduct = sqlSession
						.getMapper(MybatisMoyoImpl.class).getPlzProduct(p.getP_code());
				model.addAttribute("plzProduct", plzProduct);
			}
		}
	}
}
