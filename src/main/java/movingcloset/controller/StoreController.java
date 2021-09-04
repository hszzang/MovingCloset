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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
 
import movingcloset.command.CommandImpl;
import movingcloset.command.CommandImpl2;
import movingcloset.command.GetMemberProductCommand;
import movingcloset.command.store.ReviewDeleteCommand;
import movingcloset.command.store.ReviewInsertCommand;
import movingcloset.command.store.ReviewListCommand;
import movingcloset.command.store.ReviewUpdateCommand;
import movingcloset.command.store.StoreBuyCommand;
import movingcloset.command.store.StoreDeleteCommand;
import movingcloset.command.store.StoreDetailCommand;
import movingcloset.command.store.StoreInsertCommand;
import movingcloset.command.store.StoreListCommand;
import movingcloset.command.store.StoreUpdateCommand;
import mybatis.BuyAndGroupDTO;
import mybatis.ProductDTO;
import mybatis.ProductDetailDTO;
import mybatis.ReviewDTO;
 
@Controller
public class StoreController {
	
	CommandImpl command = null;
	
	CommandImpl2 command2 = null;
	
	@Autowired
	StoreListCommand storelistCommand;
	@Autowired
	StoreInsertCommand storeInsertCommand;
	@Autowired
	StoreDetailCommand storeDetailCommand;
	@Autowired
	StoreUpdateCommand storeUpdateCommand;
	@Autowired
	StoreDeleteCommand storeDeleteCommand;
	@Autowired
	ReviewInsertCommand reviewInsertCommand;
	@Autowired
	ReviewDeleteCommand reviewDeleteCommand;
	@Autowired
	ReviewListCommand reviewListCommand;
	@Autowired
	ReviewUpdateCommand reviewUpdateCommand;
	@Autowired
	StoreBuyCommand storeBuyCommand;
	@Autowired
	GetMemberProductCommand getMemberProductCommand;
	 
	
	// 스토어 리스트
	@RequestMapping(value="/movingcloset/store.do", method=RequestMethod.GET)
	public String storeList(Model model, HttpServletRequest req, ProductDTO productDTO) {
	//public String storeList(Locale locale, Model model) {		

		model.addAttribute("req", req);
		command = storelistCommand;
		command.execute(model);
		
		return "body/store/store_list";
	}
	
	// 스토어 상세
	@RequestMapping(value="/store/detail.do", method=RequestMethod.GET)
	public String storedetail(Model model, HttpServletRequest req, ProductDTO productDTO) {
	//public String storedetail(Locale locale, Model model) {
		
		model.addAttribute("req", req);
		command = storeDetailCommand;
		command.execute(model);
		
		return "body/store/store_detail";
	}
	
	// 상품 추가
	@RequestMapping("/store/insert.do")
	public String insert(Locale locale, Model model) {
		System.out.println("insert 들어옴");
		return "body/store/store_insert";
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
	public String insertAction(Model model, MultipartHttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO, ProductDetailDTO detailDTO) throws IOException {
		
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
		String p_ofile = tempA.toString();
		System.out.println("ofile: " + p_ofile);
		
		Object tempB = ((Map) temp2).get("sfile");
		String p_sfile = tempB.toString();
		System.out.println("sfile: " + p_sfile);
		
		productDTO.setP_ofile(p_ofile);
		productDTO.setP_sfile(p_sfile);
		
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("detailDTO", detailDTO);
		model.addAttribute("req", req);
		
		command = storeInsertCommand; 
		command.execute(model);
			
		/*
		redirect:
		이동한 페이지 경로(요청명)와 같이 하면 뷰를 호출 않고 페이지 이동
		 */
		return "redirect:/movingcloset/store.do";
		}
	
	// 상품 수정
	@RequestMapping("/store/update.do")
	public String update(Model model, HttpServletRequest req, ProductDTO productDTO, ProductDetailDTO detailDTO) {
//		public String update(Locale locale, Model model, ProductDTO productDTO) {

		String p_idx = productDTO.getP_idx();
		model.addAttribute("p_idx", p_idx);
		
		model.addAttribute("req", req);
		model.addAttribute("model", model);
		
		command = storeDetailCommand;
		command.execute(model);
		
		return "body/store/store_update";
	}
	
	@RequestMapping(value="/store/updateAction.do", method=RequestMethod.POST)
	public String updateAction(Model model, MultipartHttpServletRequest req, HttpServletResponse resp, ProductDTO productDTO) throws IOException {
		
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
		String p_ofile = tempA.toString();
		System.out.println("ofile: " + p_ofile);
		
		Object tempB = ((Map) temp2).get("sfile");
		String p_sfile = tempB.toString();
		System.out.println("sfile: " + p_sfile);
		
		productDTO.setP_ofile(p_ofile);
		productDTO.setP_sfile(p_sfile);
		
		String[] sizes = req.getParameterValues("sizes");
		String[] stocks = req.getParameterValues("stocks");
		
		model.addAttribute("sizes", sizes);
		model.addAttribute("stocks", stocks);
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("req", req);
		
		command = storeUpdateCommand; 
		command.execute(model);
		
		return "redirect:/store/detail.do?p_idx=" + req.getParameter("p_idx");
	}
	
	// 상품 제거
	@RequestMapping("/store/delete.do")
	public String delete(Model model, HttpServletRequest req) {
//		public String delete(Locale locale, Model model) {
		System.out.println("delete 들어옴");
			
		model.addAttribute("req", req);
		model.addAttribute("model", model);
			
		command = storeDeleteCommand;
		command.execute(model);
		return "redirect:/movingcloset/store.do";
	}
	
	
	
	// 스토어 상세페이지 리뷰 팝업
	@RequestMapping("/store/reviewPage.do")
	public String review(Model model, HttpServletRequest req) {
		System.out.println("리뷰 컨트롤러 들어옴");
		System.out.println("리뷰 컨트롤러 : "+req.getParameter("p_idx"));
		
		
		model.addAttribute("req", req);
		command = reviewListCommand;
		command.execute(model);
		
		return "reviewPage";
	}
	
	// 리뷰쓰기
	@RequestMapping(value="/movingcloset/store/insertReview.do", method=RequestMethod.POST)
	public void insertReview( Model model, MultipartHttpServletRequest req, 
			HttpServletResponse resp, ReviewDTO reviewDTO, HttpSession session) throws IOException {
		System.out.println("리뷰쓰기 컨트롤러 들어옴");
		// 리뷰인서트커맨드로 리뷰쓰는 걸로???
		System.out.println("리뷰insert입니다.");
		System.out.println("한줄평 : "+req.getParameter("reviewText"));
		
		model.addAttribute("req", req);
		model.addAttribute("resp",resp);
		model.addAttribute("reviewDTO",reviewDTO);
		
		command = reviewInsertCommand;
		command.execute(model);
		
		if(session.getAttribute("complete")=="OK") {
			resp.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = resp.getWriter();
			 
			out.println("<script> "
					+ "var check = confirm('리뷰가 성공적으로 등록 되었습니다'); "
					+ " if(check) {"
					+ " window.close();"
					+ " }else{"
					+ " window.close();"
					+ " }"
					+ "</script>");
			 
			out.flush();



		}
		
	}
	

	@RequestMapping(value="/store/updateReview.do", method=RequestMethod.POST)
	public String updateReview(Model model, MultipartHttpServletRequest req, HttpServletResponse resp,
			HttpSession session,ReviewDTO reviewDTO) throws IOException{
		model.addAttribute("reviewDTO",reviewDTO);
		model.addAttribute("req",req);
		model.addAttribute("resp",resp);
		
		System.out.println("리뷰r_idx : "+req.getParameter("r_idx"));
		System.out.println("리뷰수정 파일여부 : "+req.getParameter("ofileCheck"));
		
		command = reviewUpdateCommand;
		command.execute(model);
		

		return "redirect:/store/detail.do?p_idx=" + req.getParameter("p_idx");
	}

	
	
	// 리뷰삭제
	@RequestMapping("/store/deleteReview.do")
	public String deleteReview(Model model, HttpServletRequest req) {
	
		System.out.println("delete 들어옴");
		
		model.addAttribute("req", req);
		model.addAttribute("model", model);
			
		command = reviewDeleteCommand;
		command.execute(model);
		
		// 해당 상세 페이지로 돌아가는 걸로.
		return "redirect:/store/detail.do?p_idx=" + req.getParameter("p_idx");
		
	}
	
	// 구매폼으로 이동
	@RequestMapping(value="/store/buy.do", method=RequestMethod.POST)
	public String buy(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = getMemberProductCommand;
		command.execute(model);
		
		return "body/store/buyForm";
	}
	
	
	
	// 상품 구매하기
	@RequestMapping("/store/buyProduct.do")
	public String buyProduct(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		
		command = storeBuyCommand;
		command.execute(model);
		
		return "body/store/payForm";
	}
	
}
