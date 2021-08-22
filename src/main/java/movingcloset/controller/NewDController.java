package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.company.CompanyCommand;
import movingcloset.command.newd.NewDCommand;
import mybatis.NewdDTO;
import mybatis.ProductDTO;


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
	
	
	
	/*
	 * //뉴디리스트
	 * 
	 * @RequestMapping(value="/movingcloset/newD.do", method=RequestMethod.GET)
	 * public String newdList(Model model, HttpServletRequest req, NewdDTO newdDTO,
	 * ProductDTO productDTO) {
	 * 
	 * //뉴디컨트롤러 실행해라 model.addAttribute("req", req); command = newDCommand;
	 * command.execute(model);
	 * 
	 * return "body/newD_main";
	 * 
	 * }
	 */
	
	
}
