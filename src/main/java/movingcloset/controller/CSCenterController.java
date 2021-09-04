package movingcloset.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movingcloset.command.CommandImpl;
import movingcloset.command.cscenter.FaqCommand;
import movingcloset.command.cscenter.FaqDetailCommand;
import movingcloset.command.cscenter.NoticeCommand;
import movingcloset.command.cscenter.NoticeDetailCommand;
import movingcloset.command.cscenter.QnaDetailCommand;
import movingcloset.command.cscenter.QnaInsertCommand;
import mybatis.FaqDTO;
import mybatis.NoticeDTO;
import mybatis.QnaDTO;


@Controller
public class CSCenterController {
	
	CommandImpl command = null;
	
	@Autowired
	NoticeCommand noticeCommand;
	@Autowired
	NoticeDetailCommand noticeDetailCommand;
	@Autowired
	FaqCommand faqCommand;
	@Autowired
	FaqDetailCommand faqDetailCommand;
	@Autowired
	QnaDetailCommand qnaDetailCommand;
	@Autowired
	QnaInsertCommand qnaInsertCommand;
	

	
	// 공지사항, FAQ
	@RequestMapping(value="/movingcloset/notice.do", method=RequestMethod.GET)
	public String noticeList(HttpServletRequest req, Model model, NoticeDTO noticeDTO) {
		
		model.addAttribute("req", req);
		command = noticeCommand;
		command.execute(model);
		
		command = faqCommand;
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
	// FAQ_내용
	@RequestMapping(value="/movingcloset/faqdetail.do", method=RequestMethod.GET)
	public String faqDetail(HttpServletRequest req, Model model, FaqDTO faqDTO) {
		
		model.addAttribute("req", req);
		command = faqDetailCommand;
		command.execute(model);
		
		return "body/cscenter/faq_detail";
	}
	
		
	/*
	 * // FAQ랑 QnA ------> 마이페이지에서 보이게 변경
	 * 
	 * @RequestMapping(value="/movingcloset/qnalist.do", method=RequestMethod.GET)
	 * public String qnaList(Locale locale, Model model) {
	 * 
	 * return "body/cscenter/qna_list"; }
	 */
	
	
	// QnA상세보기
	@RequestMapping(value="/movingcloset/qnadetail.do", method=RequestMethod.GET)
	public String qnaDetail(HttpServletRequest req, Model model, QnaDTO qnaDTO) {
		
		model.addAttribute("req", req);
		command = qnaDetailCommand;
		command.execute(model);
		
		
		return "body/cscenter/qna_detail";
	}
	
	//QnA폼
	@RequestMapping(value="/movingcloset/question.do", method=RequestMethod.GET)
	public String qnaForm(Locale locale, Model model) {
		System.out.println("qna폼은뜨냐-컨트롤러");
		return "body/cscenter/qna_form";
	}
	//QnA글쓰기처리 - post방식으로 전송되므로 value,method를 둘 다 명시했음
	@RequestMapping(value="/movingcloset/qnaWriteAction.do",
			method=RequestMethod.POST)
	public String qnaWriteAction(Model model,
			HttpServletRequest req, QnaDTO qnaDTO) throws IOException{
		/*
		글쓰기 페이지에 전송된 모든 폼 값을 SpringBbsDTO객체가 한번에 받는다.
		Spring에서는 커맨드 객체를 통해 이와같이 할 수 있다.
		*/
		System.out.println("인서트컨트롤러 뜬다");
		//뷰에서 전송된 폼값을 저장한 커맨드객체를  model에 저장한다.
		model.addAttribute("qnaDTO", qnaDTO);
		model.addAttribute("req", req);
		command = qnaInsertCommand;
		command.execute(model);
		
		/*
		redirect:이동판페이지경로(요청명)와 같이 하면 뷰를 호출하지 않고
			페이지 이동이 된다.
		*/
		return "redirect:/movingcloset/mypage_myqna.do";
	}
	
}
