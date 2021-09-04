package movingcloset.command.newd;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisNewDImpl;
import mybatis.MybatisProductImpl;
import mybatis.NewdDTO;
import mybatis.ProductDTO;

@Service
public class NewDCommand implements CommandImpl {
	
	public NewDCommand() {
		System.out.println("뉴디커맨드 호출");
		
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("newDCommand 호출");
		
		ProductDTO productDTO = new ProductDTO();
		
		List<ProductDTO> newdList = sqlSession.getMapper(MybatisNewDImpl.class).getNewdList(productDTO);
		
		
		model.addAttribute("newdList", newdList);
		 
		
		
	}
}
