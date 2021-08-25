package movingcloset.command.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.ProductDTO;

@Service
public class SearchCommand implements CommandImpl {

	public SearchCommand() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		ProductDTO productDTO = new ProductDTO();
		
		List<ProductDTO> searchList; 
		
	}
	
}
