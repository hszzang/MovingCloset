package movingcloset.command.moyo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.PleaseDTO;
import mybatis.ProductDTO;

@Service
public class EndMoyoPlzCommand implements CommandImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("EndMoyoPlzCommand 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String category = req.getParameter("category");
		
		if(category == null || category.equals("moyo")) {
			ArrayList<MoyoDTO> moyoList = sqlSession
					.getMapper(MybatisMoyoImpl.class).endMoyoList();
			model.addAttribute("moyoList", moyoList);
			
			if(!moyoList.isEmpty()) {
				HashMap<String, Integer> countMoyoUser = new HashMap<String, Integer>();
				for(MoyoDTO m : moyoList) {
					countMoyoUser.put(m.getM_idx(), sqlSession
							.getMapper(MybatisMoyoImpl.class).countMoyoUser(m.getM_idx()));
				}
				model.addAttribute("countMoyoUser", countMoyoUser);
			}
			
			model.addAttribute("moyoBtn", "btn-warning");
			model.addAttribute("plzBtn", "btn-outline-warning");
		}
		else if(category.equals("plz")) {
			ArrayList<PleaseDTO> plzList = sqlSession
					.getMapper(MybatisMoyoImpl.class).endPlzList();
			model.addAttribute("plzList", plzList);
			System.out.println(plzList);
			
			if(!plzList.isEmpty()) {
				
				HashMap<String, Integer> countPlzUser = new HashMap<String, Integer>();
				ArrayList<ProductDTO> plzProduct = new ArrayList<ProductDTO>();
				for(PleaseDTO p : plzList) {
					countPlzUser.put(p.getPlz_idx(), sqlSession
							.getMapper(MybatisMoyoImpl.class).countPlzUser(p.getPlz_idx()));
					plzProduct.add(sqlSession
							.getMapper(MybatisMoyoImpl.class).getPlzProduct(p.getP_code()));
				}
				model.addAttribute("countPlzUser", countPlzUser);
				model.addAttribute("plzProduct", plzProduct);
			}
			model.addAttribute("plzBtn", "btn-warning");
			model.addAttribute("moyoBtn", "btn-outline-warning");
		}
	}
}
