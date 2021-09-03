package movingcloset.command.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

@Service
public class AdminMoyoCommand implements CommandImpl {

	public AdminMoyoCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		ArrayList<MoyoDTO> MoyoList = sqlSession.getMapper(MybatisMoyoImpl.class).MoyoList();
		//ArrayList<String> MoyoList = sqlSession.getMapper(MybatisMoyoImpl.class).MoyoList();
		
		//List<ProductAndDetailDTO> StoreList = sqlSession.getMapper(MybatisProductImpl.class).StoreList(start, end);
		
		model.addAttribute("MoyoList", MoyoList);
		
		
	}
	
}
