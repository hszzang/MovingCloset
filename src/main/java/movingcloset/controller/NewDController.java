package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.newd.DesignerCommand;
import movingcloset.command.newd.NewDCommand;
import mybatis.NewdDTO;
import mybatis.ProductDTO;


@Controller
public class NewDController {
	
	CommandImpl command = null;
	
	@Autowired
	NewDCommand newDCommand;
	
	@Autowired
	DesignerCommand designerCommand;
	
	
	//뉴디리스트
	@RequestMapping(value="/movingcloset/newD.do", method=RequestMethod.GET)
	public String newdList(Model model, HttpServletRequest req, NewdDTO newdDTO, ProductDTO productDTO) {
		
		//뉴디컨트롤러 실행해라
		model.addAttribute("req", req);
		command = newDCommand;
		command.execute(model);
		
		
		command = designerCommand;
		command.execute(model);
		
		return "body/newD_main";
		
	}
	
	/*
	 * //디자이너리스트
	 * 
	 * @RequestMapping(value="/movingcloset/designer.do", method=RequestMethod.GET)
	 * public String designerList(Model model, HttpServletRequest req, NewdDTO
	 * newdDTO) {
	 * 
	 * 
	 * model.addAttribute("req", req);
	 * 
	 * 
	 * return "body/newD_main";
	 * 
	 * }
	 */
	
	
	
	
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
