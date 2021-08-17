package movingcloset.command.newd;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;


@Service
public class NewDCommand implements CommandImpl {
	
	public NewDCommand() {
		//System.out.println("뉴디커맨드 호출");
	}
	
	////////////////////////작성전 복붙만해둠
	
	@Override
	public void execute(Model model) {
		
		System.out.println("newDCommand 호출");
		
		
		
		
	}
}
