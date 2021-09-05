package movingcloset.command.admin;

import java.util.ArrayList;
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
import mybatis.MemberDTO;
import mybatis.MoyoDTO;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisMypageImpl;
import mybatis.MybatisProductImpl;
import mybatis.MybatisQNAImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;
import mybatis.QnaDTO;

@Service
public class AdminOrderCommand implements CommandImpl {

	public AdminOrderCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("관리자 오더 리스트 커맨드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		List<BuyAndGroupDTO> OrderList = sqlSession.getMapper(MybatisMypageImpl.class).allOrderList();
		
		model.addAttribute("OrderList", OrderList);
		
		
	}
	
}
