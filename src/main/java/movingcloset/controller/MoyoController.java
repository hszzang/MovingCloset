package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.moyo.MoyoCommand;
import movingcloset.command.moyo.MoyoFormCommand;
import movingcloset.command.moyo.MoyoJoinCommand;
import mybatis.MoyoDTO;

@Controller
public class MoyoController {

	CommandImpl command = null;
	
	@Autowired
	MoyoCommand moyoCommand;
	
	@Autowired
	MoyoFormCommand moyoFormCommand;
	
	@Autowired
	MoyoJoinCommand moyoJoinCommand;
	
	// 모여
	@RequestMapping(value="/movingcloset/moyo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String moyo(Model model, HttpServletRequest req, MoyoDTO moyoDTO) {
		
		model.addAttribute("req", req);
		command = moyoCommand;
		command.execute(model);
		 
		return "body/moyo/moyo";
	}
		
	// 모여신청폼
	@RequestMapping(value="/movingcloset/moyoForm.do", method=RequestMethod.GET)
	public String moyoForm(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = moyoFormCommand;
		command.execute(model);
		
		return "body/moyo/moyoForm";
	}
	
	// 모여신청완료폼
	@RequestMapping(value="/movingcloset/moyoJoin.do", method=RequestMethod.POST)
	public String moyoJoin(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = moyoJoinCommand;
		command.execute(model);
		
		return "body/moyo/moyoJoin";
	}

	// 조르기 목록
	@RequestMapping(value="/movingcloset/please.do", method=RequestMethod.GET)
	public String pleaseList() {
		
		return "body/moyo/please";
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
