package movingcloset.command.company;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;


@Service
public class CompanyCommand implements CommandImpl {
	
	public CompanyCommand() {
		//System.out.println("컴퍼니커맨드 호출");
	}
	
	////////////////////////작성전 복붙만해둠
	
	@Override
	public void execute(Model model) {
		
		System.out.println("CompanyCommand 호출");
		
		
		
		
	}
}
