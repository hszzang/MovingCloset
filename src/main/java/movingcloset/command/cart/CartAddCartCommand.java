package movingcloset.command.cart;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl2;
import mybatis.CartDTO;
import mybatis.MybatisCartImpl;

@Service
public class CartAddCartCommand implements CommandImpl2 {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {}

	@Override
	public void mapexecute(Map<String, Object> map) {
		
		CartDTO cartDTO = (CartDTO)map.get("cartDTO");
		
		int result = sqlSession.getMapper(MybatisCartImpl.class).addcart(cartDTO);
		System.out.println(result);
	}

}
