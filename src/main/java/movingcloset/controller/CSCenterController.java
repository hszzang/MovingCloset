package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.cscenter.NoticeCommand;
import movingcloset.command.cscenter.NoticeDetailCommand;
import mybatis.NoticeDTO;

@Controller
public class CSCenterController {
	
	CommandImpl command = null;
	
	@Autowired
	NoticeCommand noticeCommand;
	@Autowired
	NoticeDetailCommand noticeDetailCommand;
	

	
	// 공지사항
	@RequestMapping(value="/movingcloset/notice.do", method=RequestMethod.GET)
	public String noticeList(HttpServletRequest req, Model model, NoticeDTO noticeDTO) {
		
		model.addAttribute("req", req);
		command = noticeCommand;
		command.execute(model);
		
		
		return "body/cscenter/notice_list";
	}
	// 공지사항_내용
	@RequestMapping(value="/movingcloset/noticedetail.do", method=RequestMethod.GET)
	public String noticeDetail(HttpServletRequest req, Model model, NoticeDTO noticeDTO) {
		
		model.addAttribute("req", req);
		command = noticeDetailCommand;
		command.execute(model);
		
		
		return "body/cscenter/notice_detail";
	}
	
	
	
	
	
	
		
	// FAQ랑 QnA
	@RequestMapping(value="/movingcloset/qnalist.do", method=RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
				
		return "body/cscenter/qna_list";
	}
	// QnA 상세
	@RequestMapping(value="/movingcloset/qnadetail.do", method=RequestMethod.GET)
	public String qnaDetail(Locale locale, Model model) {
				
		return "body/cscenter/qna_detail";
	}
	// 질문 폼
	@RequestMapping(value="/movingcloset/question.do", method=RequestMethod.GET)
	public String qnaForm(Locale locale, Model model) {
			
		return "body/cscenter/qna_form";
	}
	
	
}
