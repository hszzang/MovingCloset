package movingcloset.controller;

import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.company.CompanyCommand;
import movingcloset.command.newd.NewDCommand;


@Controller
public class NewDController {
	
	CommandImpl command = null;
	
	@Autowired
	NewDCommand newDCommand;
	
	//뉴디
	@RequestMapping(value="/movingcloset/newD.do", method=RequestMethod.GET)
	public String newDmain(Locale locale, Model model) {
		
		return "body/newD_main";
	}
	
	
	
}
