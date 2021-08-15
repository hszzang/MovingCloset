package movingcloset.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;

@Service
public class StoreListCommand implements CommandImpl {

		public StoreListCommand() {
			System.out.println("스토어리스트 커맨드 호출");
		}
		
		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("StoreListCommand 호출");
			ProductDTO productDTO = sqlSession.getMapper(MybatisProductImpl.class).getStoreList();
			
			System.out.println(productDTO.getP_name());
		
		}
}
