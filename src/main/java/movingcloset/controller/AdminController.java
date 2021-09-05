package movingcloset.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import movingcloset.command.CommandImpl;
import movingcloset.command.admin.AdminAnswerCommand;
import movingcloset.command.admin.AdminMainCommand;
import movingcloset.command.admin.AdminMemberCommand;
import movingcloset.command.admin.AdminMoyoCommand;
import movingcloset.command.admin.AdminMoyoDeleteCommand;
import movingcloset.command.admin.AdminMoyoDetailCommand;
import movingcloset.command.admin.AdminMoyoInsertCommand;
import movingcloset.command.admin.AdminMoyoUpdateCommand;
import movingcloset.command.admin.AdminNewDCommand;
import movingcloset.command.admin.AdminOrderCommand;
import movingcloset.command.admin.AdminQnACommand;
import movingcloset.command.admin.AdminStoreCommand;
import movingcloset.command.admin.AdminZzimCommand;
import movingcloset.command.cscenter.QnaCommand;
import mybatis.MoyoDTO;

@Controller
public class AdminController {
	
	CommandImpl command = null;
	
	@Autowired
	AdminMainCommand adminMainCommand;
	@Autowired
	AdminMemberCommand adminMemberCommand;
	@Autowired
	AdminStoreCommand adminStoreCommand;
	@Autowired
	AdminNewDCommand adminNewDCommand;
	@Autowired
	AdminMoyoCommand adminMoyoCommand;
	@Autowired
	AdminMoyoInsertCommand adminMoyoInsertCommand;
	@Autowired
	AdminMoyoDetailCommand adminMoyoDetailCommand;
	@Autowired
	AdminMoyoUpdateCommand adminMoyoUpdateCommand;
	@Autowired
	AdminMoyoDeleteCommand adminMoyoDeleteCommand;
	@Autowired
	AdminQnACommand adminQnACommand;
	@Autowired
	AdminAnswerCommand adminAnswerCommand;
	@Autowired
	AdminOrderCommand adminOrderCommand;
	@Autowired
	AdminZzimCommand adminZzimCommand;
	
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
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1: " + uuid);
		// 중간에 포함된 하이픈 제거
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2: " + uuid);
		
		return uuid;
	}
	
	@RequestMapping(value = "/movingcloset/adminmoyoinsertact.do", method = RequestMethod.POST)
	public String adminMoyoInsertAction(Model model, MultipartHttpServletRequest req, HttpServletResponse resp, MoyoDTO moyoDTO) throws IOException {
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		Map returnObj = new HashMap();
		
		try {
			Iterator itr = req.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";
			List resultList = new ArrayList();
			
			File directory = new File(path);
			if(!directory.isDirectory()) {
				directory.mkdirs();
			}
			while(itr.hasNext()) {
				fileName = (String)itr.next();
				mfile = req.getFile(fileName);
				System.out.println("mfile = " + mfile);
				String ofile = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				
				if("".equals(ofile)) {
					continue;
				}
				
				String ext = ofile.substring(ofile.lastIndexOf('.'));
				String sfile = getUuid() + ext;
				File serverFullName = new File(path + File.separator + sfile);
				mfile.transferTo(serverFullName);
				
				Map file = new HashMap();
				file.put("ofile", ofile);
				System.out.println(ofile);
				file.put("sfile", sfile);
				System.out.println(sfile);
				file.put("serverFullName", serverFullName);
				System.out.println(serverFullName);
				//file.put("title", title);
				
				resultList.add(file);
				
			}
			
			returnObj.put("files", resultList);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(returnObj);
		model.addAttribute("returnObj", returnObj);
		// returnObj(맵)에 있는 files(resultlist(배열리스트))에서 ofile과 sfile을 꺼내오기^^...
		
		//System.out.println(returnObj.containsKey("files")); // true 
		//Object temp = returnObj.get("files");
		List<String> temp = (List<String>) returnObj.get("files");
		
		Object temp2 = temp.get(0);
		
		Object tempA = ((Map) temp2).get("ofile");
		String m_ofile = tempA.toString();
		System.out.println("ofile: " + m_ofile);
		
		Object tempB = ((Map) temp2).get("sfile");
		String m_sfile = tempB.toString();
		System.out.println("sfile: " + m_sfile);
		
		moyoDTO.setM_ofile(m_ofile);
		moyoDTO.setM_sfile(m_sfile);
		
		String m_name = req.getParameter("m_name");
		moyoDTO.setM_name(m_name);
		System.out.println(m_name);
		
		model.addAttribute("moyoDTO", moyoDTO);
		
		model.addAttribute("req", req);
		command = adminMoyoInsertCommand;
		command.execute(model);
		
		return "admin/admin_moyo";
	}
	
	// 모여 수정
	@RequestMapping(value = "/movingcloset/adminmoyoupdate.do", method = RequestMethod.GET)
	public String adminMoyoUpdate(Model model, HttpServletRequest req, MoyoDTO moyoDTO) {
		
		System.out.println("모여 업데이트 콘트롤러 들어옴");
		
		//String m_idx = moyoDTO.getM_idx();
		//String m_idx = req.getParameter("m_idx");
		//model.addAttribute("m_idx", m_idx);
		
		model.addAttribute("moyoDTO", moyoDTO);
		model.addAttribute("req", req);
		model.addAttribute("model", model);
		
		command = adminMoyoDetailCommand;
		command.execute(model);
		
		return "admin/admin_moyoUpdate";
	}
	
	@RequestMapping(value = "/movingcloset/adminmoyoupdateact.do", method = RequestMethod.POST)
	public String adminMoyoUpdateAction(Model model, MultipartHttpServletRequest req, HttpServletResponse resp, MoyoDTO moyoDTO) throws IOException {
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		Map returnObj = new HashMap();
		
		try {
			Iterator itr = req.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";
			List resultList = new ArrayList();
			
			File directory = new File(path);
			if(!directory.isDirectory()) {
				directory.mkdirs();
			}
			while(itr.hasNext()) {
				fileName = (String)itr.next();
				mfile = req.getFile(fileName);
				System.out.println("mfile = " + mfile);
				String ofile = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				
				if("".equals(ofile)) {
					continue;
				}
				
				String ext = ofile.substring(ofile.lastIndexOf('.'));
				String sfile = getUuid() + ext;
				File serverFullName = new File(path + File.separator + sfile);
				mfile.transferTo(serverFullName);
				
				Map file = new HashMap();
				file.put("ofile", ofile);
				System.out.println(ofile);
				file.put("sfile", sfile);
				System.out.println(sfile);
				file.put("serverFullName", serverFullName);
				System.out.println(serverFullName);
				//file.put("title", title);
				
				resultList.add(file);
				
			}
			
			returnObj.put("files", resultList);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(returnObj);
		model.addAttribute("returnObj", returnObj);
		// returnObj(맵)에 있는 files(resultlist(배열리스트))에서 ofile과 sfile을 꺼내오기^^...
		
		//System.out.println(returnObj.containsKey("files")); // true 
		//Object temp = returnObj.get("files");
		List<String> temp = (List<String>) returnObj.get("files");
		
		Object temp2 = temp.get(0);
		
		Object tempA = ((Map) temp2).get("ofile");
		String m_ofile = tempA.toString();
		System.out.println("ofile: " + m_ofile);
		
		Object tempB = ((Map) temp2).get("sfile");
		String m_sfile = tempB.toString();
		System.out.println("sfile: " + m_sfile);
		
		moyoDTO.setM_ofile(m_ofile);
		moyoDTO.setM_sfile(m_sfile);
		
		model.addAttribute("moyoDTO", moyoDTO);
		
		model.addAttribute("req", req);
		command = adminMoyoUpdateCommand;
		command.execute(model);
		
		return "admin/admin_moyo";
	}
	
	// 모여 제거
		@RequestMapping(value="/movingcloset/adminmoyodelete.do", method = RequestMethod.GET)
		public String adminMoyoDelete(Model model, HttpServletRequest req) {
//			public String delete(Locale locale, Model model) {
				
			model.addAttribute("req", req);
			model.addAttribute("model", model);
				
			command = adminMoyoDeleteCommand;
			command.execute(model);
			
			return "admin/admin_moyo";
		}
	
		// 질답관리
		@RequestMapping(value = "/movingcloset/adminqna.do", method = RequestMethod.GET)
		public String adminQnA(Locale locale, Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = adminQnACommand;
			command.execute(model);
						
			return "admin/admin_qna";
		}
		
		@RequestMapping(value = "/movingcloset/adminanswer.do", method = RequestMethod.GET)
		public String adminAnswer(Locale locale, Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = adminQnACommand;
			command.execute(model);
						
			return "/body/cscenter/qna_answer";
		}
		
		@RequestMapping(value = "/movingcloset/adminansweract.do", method = RequestMethod.POST)
		public String adminAnswerAction(Locale locale, Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = adminAnswerCommand;
			command.execute(model);
						
			return "admin/admin_qna";
		}
		
		// 모든 주문 내역 조회
		@RequestMapping(value = "/movingcloset/adminorder.do")
		public String adminOrderList(Locale locale, Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = adminOrderCommand;
			command.execute(model);
						
			return "admin/admin_order";
		}
		
		// 모든 짬 내역 조회
		@RequestMapping(value = "/movingcloset/adminzzim.do")
		public String adminZzimList(Locale locale, Model model, HttpServletRequest req) {

			model.addAttribute("req", req);
			command = adminZzimCommand;
			command.execute(model);
								
			return "admin/admin_zzim";
		}
		
}
