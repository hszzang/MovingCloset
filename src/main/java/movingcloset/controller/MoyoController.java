package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.MoyoCommand;
import mybatis.MoyoDTO;

@Controller
public class MoyoController {

	CommandImpl command = null;
	
	@Autowired
	MoyoCommand moyoCommand;
	
	// 모여
	@RequestMapping(value="/movingcloset/moyo.do", method=RequestMethod.GET)
	public String moyo(Model model, HttpServletRequest req, MoyoDTO moyoDTO) {
		
		model.addAttribute("req", req);
		command = moyoCommand;
		command.execute(model);
		 
		return "body/moyo/moyo";
	}
		
	// 모여신청폼
	@RequestMapping(value="/movingcloset/moyoForm.do", method=RequestMethod.GET)
	public String moyoForm() {
		
		return "body/moyo/moyoForm";
	}
	
	// 조르기 목록
	@RequestMapping(value="/movingcloset/pleaseList.do", method=RequestMethod.GET)
	public String pleaseList() {
		
		return "body/moyo/pleaseList";
	}
	
	// 조르기 신청폼
	@RequestMapping(value="/movingcloset/pleaseForm.do", method=RequestMethod.GET)
	public String pleaseForm() {
		
		return "body/moyo/pleaseForm";
	}
	
	// 지난 모여/조르기 목록
	@RequestMapping(value="/movingcloset/endMoyoPlz.do", method=RequestMethod.GET)
	public String endMoyoPlz() {
		
		return "body/moyo/endMoyoPlz";
	}
	
	
	
}