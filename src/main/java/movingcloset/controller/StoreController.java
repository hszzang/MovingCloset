package movingcloset.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.StoreListCommand;
import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;

@Controller
public class StoreController {
	
	CommandImpl command = null;
	
	@Autowired
	StoreListCommand storelistCommand;
	
	// 스토어 리스트
	@RequestMapping(value="/movingcloset/store.do", method=RequestMethod.GET)
	public String storeList(Model model, HttpServletRequest req, ProductDTO productDTO) {
	//public String storeList(Locale locale, Model model) {
		
		//model.addAttribute("storeList", storeList);
		
		model.addAttribute("req", req);
		command = storelistCommand;
		command.execute(model);
		
		return "body/store/store_list";
	}
	
	/*
	@RequestMapping(value="/movingcloset/storeupload.do", method=RequestMethod.GET)
	public String storeUpload(Locale locale, Model model) {

		return "body/store/Write";
	}
	 */
	
	@RequestMapping(value="/store/detail.do", method=RequestMethod.GET)
	public String storedetail(Locale locale, Model model) {
		
		return "body/store/store_detail";
	}
	
	// 스토어 상세페이지에서 리뷰쓰기 버튼
	@RequestMapping("/store/reviewPage.do")
	public String review(Locale locale, Model model) {
		System.out.println("컨트롤러 들어옴");
		return "reviewPage";
	}
	
	// 상품 추가
	@RequestMapping("/store/insert.do")
	public String insert(Locale locale, Model model) {
		System.out.println("insert 들어옴");
		return "body/store/insert";
	}
	
	// 상품 업로드
	@RequestMapping("/store/update.do")
	public String upload(Locale locale, Model model) {
		System.out.println("upload 들어옴");
		return "body/store/update";
	}
	
}
