package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.admin.AdminMainCommand;
import movingcloset.command.admin.AdminMemberCommand;
import movingcloset.command.admin.AdminMoyoCommand;
import movingcloset.command.admin.AdminNewDCommand;
import movingcloset.command.admin.AdminStoreCommand;

@Controller
public class AdminController {
	
	CommandImpl command = null;
	
	@Autowired
	AdminMainCommand adminMainCommand;
	@Autowired
	AdminStoreCommand adminStoreCommand;
	@Autowired
	AdminNewDCommand adminNewDCommand;
	@Autowired
	AdminMoyoCommand adminMoyoCommand;
	@Autowired
	AdminMemberCommand adminMemberCommand;
	
	// 관리자 페이지 메인
	@RequestMapping(value = "/movingcloset/admin.do", method = RequestMethod.GET)
	public String adminMain(Locale locale, Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		//command = adminMainCommand;
		command = adminMainCommand;
		command.execute(model);
		
		return "admin/admin";
	}
	
	// 회원관리
	@RequestMapping(value = "/movingcloset/adminmember.do", method = RequestMethod.GET)
	public String adminMember(Locale locale, Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = adminMemberCommand;
		command.execute(model);
		
		return "admin/admin_member";
	}
	
	// 스토어관리
	@RequestMapping(value = "/movingcloset/adminstore.do", method = RequestMethod.GET)
	public String adminStore(Locale locale, Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = adminStoreCommand;
		command.execute(model);
			
		return "admin/admin_store";
	}
	
	// 뉴디관리 
	@RequestMapping(value = "/movingcloset/adminnewd.do", method = RequestMethod.GET)
	public String adminNewD(Locale locale, Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = adminNewDCommand;
		command.execute(model);
				
		return "admin/admin_newd";
	}
	
	// 모여관리
	@RequestMapping(value = "/movingcloset/adminmoyo.do", method = RequestMethod.GET)
	public String adminMoyo(Locale locale, Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = adminMoyoCommand;
		command.execute(model);
					
		return "admin/admin_moyo";
	}
	// 모여 추가
	@RequestMapping(value = "/movingcloset/adminmoyoinsert.do", method = RequestMethod.GET)
	public String adminMoyoInsert(Locale locale, Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = adminMoyoCommand;
		command.execute(model);
		
		return "admin/admin_moyoInsert";
	}
	// 모여 수정
	@RequestMapping(value = "/movingcloset/adminmoyoupdate.do", method = RequestMethod.GET)
	public String adminMoyoUpdate(Locale locale, Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		command = adminMoyoCommand;
		command.execute(model);
		
		return "admin/admin_moyoUpdate";
	}
	
	
	
}
