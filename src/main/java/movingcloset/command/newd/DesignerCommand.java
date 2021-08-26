package movingcloset.command.newd;



import java.util.ArrayList;
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
public class DesignerCommand implements CommandImpl {
	
	public DesignerCommand() {
		System.out.println("디자이너커맨드 호출");
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	////////////////////////작성전 복붙만해둠
	
	@Override
	public void execute(Model model) {
		
		System.out.println("designerCommand 호출");
		
		NewdDTO newdDTO = new NewdDTO();
		
		ArrayList<NewdDTO> designerList = sqlSession.getMapper(MybatisNewDImpl.class).getDesignerList(newdDTO);
		
		System.out.println(designerList.get(0));
		model.addAttribute("designerList", designerList);
		 
		
		
	}
}
