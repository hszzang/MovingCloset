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
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import movingcloset.command.CommandImpl;
import movingcloset.command.store.StoreInsertCommand;
import movingcloset.command.store.StoreListCommand;
import mybatis.MybatisProductImpl;
import mybatis.ProductDTO;

@Controller
public class StoreController {
	
	CommandImpl command = null;
	
	@Autowired
	StoreListCommand storelistCommand;
	@Autowired
	StoreInsertCommand storeInsertCommand;
	
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
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1: " + uuid);
		// 중간에 포함된 하이픈 제거
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2: " + uuid);
		
		return uuid;
	}
	
	// 상품 추가 처리 - post방식으로 전송되므로 value, method 둘 다 명시
	@RequestMapping(value="/store/insertAction.do", method=RequestMethod.POST)
	public String insertAction(Model model, MultipartHttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO) throws IOException {
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		//pw.print("/upload 디렉토리의 물리적 경로: " + path);
		
		Map returnObj = new HashMap();
		
		try {
			Iterator itr = req.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";
			List resultList = new ArrayList();
			
			//String title = req.getParameter("title");
			//System.out.println("title = " + title);
			
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
		
		System.out.println(returnObj.containsKey("files")); // true 
		//Object temp = returnObj.get("files");
		List<String> temp = (List<String>) returnObj.get("files");
		System.out.println("temp: " + temp);
		
		Object temp2 = temp.get(0);
		System.out.println("temp2 : " + temp2);
		
		Object tempA = ((Map) temp2).get("ofile");
		System.out.println("tempA : " + tempA);
		String p_ofile = tempA.toString();
		System.out.println("ofile: " + p_ofile);
		
		Object tempB = ((Map) temp2).get("sfile");
		System.out.println("tempB : " + tempB);
		String p_sfile = tempB.toString();
		System.out.println("sfile: " + p_sfile);
		

		productDTO.setP_ofile(p_ofile);
		productDTO.setP_sfile(p_sfile);
		
		// 뷰에서 전송된 폼 값을 저장한 커맨드 객체를 model에 저장
		//model.addAttribute("p_ofile", p_ofile);
		//model.addAttribute("p_sfile", p_sfile);
		//model.addAttribute("productDTO", productDTO);
		System.out.println("콘트롤러에서productDTO.name = " + productDTO.getP_name());
		System.out.println("콘트롤러에서productDTO.ofile = " + productDTO.getP_ofile());
		System.out.println("콘트롤러에서productDTO.ofile = " + productDTO.getP_sfile());
				
		
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("req", req);
		command = storeInsertCommand; 
		command.execute(model);
			
		/*
		redirect:
		이동한 페이지 경로(요청명)와 같이 하면 뷰를 호출 않고 페이지 이동
		 */
		return "redirect:/movingcloset/store.do";
		}
	

	// 상품 업로드
	@RequestMapping("/store/update.do")
	public String upload(Locale locale, Model model) {
		System.out.println("upload 들어옴");
		return "body/store/update";
	}
	
}
