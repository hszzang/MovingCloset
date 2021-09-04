package movingcloset.command.zzim;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;

@Service
public class ZzimAllListCommand implements CommandImpl {
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
	}

}
