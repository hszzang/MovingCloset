package movingcloset.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.search.SearchCommand;
import mybatis.ProductDTO;

@Controller
public class SearchController {

	CommandImpl command = null;
	
	@Autowired
	SearchCommand searchCommand;
	/*
	// 스토어 리스트
		@RequestMapping(value="/movingcloset/search.do", method=RequestMethod.GET)
		public String storeList(Model model, HttpServletRequest req, ProductDTO productDTO) {
		//public String storeList(Locale locale, Model model) {		

			model.addAttribute("req", req);
			command = searchCommand;
			command.execute(model);
			
			return "body/store/search";
		}
	*/
}
