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

import org.apache.ibatis.session.SqlSession;
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
import movingcloset.command.cart.CartBuyCommand;
import movingcloset.command.cart.CartPayCommand;
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
import mybatis.MybatisProductImpl;
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
	@Autowired
	CartBuyCommand cartBuyCommand;
	@Autowired
	CartPayCommand cartPayCommand;
	@Autowired
	private SqlSession sqlSession;
	
	// ????????? ?????????
	@RequestMapping(value="/movingcloset/store.do", method=RequestMethod.GET)
	public String storeList(Model model, HttpServletRequest req, ProductDTO productDTO) {
	//public String storeList(Locale locale, Model model) {		

		model.addAttribute("req", req);
		command = storelistCommand;
		command.execute(model);
		
		return "body/store/store_list";
	}
	
	// ????????? ??????
	@RequestMapping(value="/store/detail.do", method=RequestMethod.GET)
	public String storedetail(Model model, HttpServletRequest req, ProductDTO productDTO) {
	//public String storedetail(Locale locale, Model model) {
		
		model.addAttribute("req", req);
		command = storeDetailCommand;
		command.execute(model);
		
		return "body/store/store_detail";
	}
	
	// ?????? ??????
	@RequestMapping("/store/insert.do")
	public String insert(Locale locale, Model model) {
		System.out.println("insert ?????????");
		return "body/store/store_insert";
	}
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("?????????UUID-1: " + uuid);
		// ????????? ????????? ????????? ??????
		uuid = uuid.replaceAll("-", "");
		System.out.println("?????????UUID-2: " + uuid);
		
		return uuid;
	}
	
	// ?????? ?????? ?????? - post???????????? ??????????????? value, method ??? ??? ??????
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
		// returnObj(???)??? ?????? files(resultlist(???????????????))?????? ofile??? sfile??? ????????????^^...
		
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
		????????? ????????? ??????(?????????)??? ?????? ?????? ?????? ?????? ?????? ????????? ??????
		 */
		return "redirect:/movingcloset/store.do";
		//return "/movingcloset/adminstore.do";
		}
	
	// ?????? ??????
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
		// returnObj(???)??? ?????? files(resultlist(???????????????))?????? ofile??? sfile??? ????????????^^...
		
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
		//return "/movingcloset/adminstore.do";
	}
	
	// ?????? ??????
	@RequestMapping(value="/store/delete.do", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest req) {
//		public String delete(Locale locale, Model model) {
		System.out.println("delete ?????????");
			
		model.addAttribute("req", req);
		model.addAttribute("model", model);
			
		command = storeDeleteCommand;
		command.execute(model);
		return "redirect:/movingcloset/store.do";
	}
	
	
	
	// ????????? ??????????????? ?????? ??????
	@RequestMapping("/store/reviewPage.do")
	public String review(Model model, HttpServletRequest req) {
		System.out.println("?????? ???????????? ?????????");
		System.out.println("?????? ???????????? : "+req.getParameter("p_idx"));
		
		
		model.addAttribute("req", req);
		command = reviewListCommand;
		command.execute(model);
		
		return "reviewPage";
	}
	
	// ????????????
	@RequestMapping(value="/movingcloset/store/insertReview.do", method=RequestMethod.POST)
	public void insertReview( Model model, MultipartHttpServletRequest req, 
			HttpServletResponse resp, ReviewDTO reviewDTO, HttpSession session) throws IOException {
		System.out.println("???????????? ???????????? ?????????");
		// ??????????????????????????? ???????????? ?????????
		System.out.println("??????insert?????????.");
		System.out.println("????????? : "+req.getParameter("reviewText"));
		
		model.addAttribute("req", req);
		model.addAttribute("resp",resp);
		model.addAttribute("reviewDTO",reviewDTO);
		
		command = reviewInsertCommand;
		command.execute(model);
		
		if(session.getAttribute("complete")=="OK") {
			resp.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = resp.getWriter();
			 
			out.println("<script> "
					+ "var check = confirm('????????? ??????????????? ?????? ???????????????'); "
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
		
		System.out.println("??????r_idx : "+req.getParameter("r_idx"));
		System.out.println("???????????? ???????????? : "+req.getParameter("ofileCheck"));
		
		command = reviewUpdateCommand;
		command.execute(model);
		

		return "redirect:/store/detail.do?p_idx=" + req.getParameter("p_idx");
	}

	
	
	// ????????????
	@RequestMapping("/store/deleteReview.do")
	public String deleteReview(Model model, HttpServletRequest req) {
	
		System.out.println("delete ?????????");
		
		model.addAttribute("req", req);
		model.addAttribute("model", model);
			
		command = reviewDeleteCommand;
		command.execute(model);
		
		// ?????? ?????? ???????????? ???????????? ??????.
		return "redirect:/store/detail.do?p_idx=" + req.getParameter("p_idx");
		
	}
	
	// ??????????????? ??????
	@RequestMapping(value="/store/buy.do", method=RequestMethod.POST)
	public String buy(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = getMemberProductCommand;
		command.execute(model);
		
		return "body/store/buyForm";
	}
	
	
	
	// ?????? ????????????
	@RequestMapping("/store/buyProduct.do")
	public String buyProduct(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = storeBuyCommand;
		command.execute(model);
		
		return "body/store/payForm";
	}
	
	// ?????????????????? ??????????????? ??????
	@RequestMapping(value="/store/cartbuy.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartbuy(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = cartBuyCommand;
		command.execute(model);
		
		return "body/cart/cartbuyForm";
	}
	
	// ?????? ????????????
	@RequestMapping("/store/cartbuyProduct.do")
	public String cartbuyProduct(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = cartPayCommand;
		command.execute(model);
		
		List<BuyAndGroupDTO> bgDTO = new ArrayList<BuyAndGroupDTO>();
		
		int idx = sqlSession.getMapper(MybatisProductImpl.class).getMaxBidx();
		String b_idx = Integer.toString(idx);
		bgDTO = sqlSession.getMapper(MybatisProductImpl.class).getbuyAndGroup(b_idx);
		model.addAttribute("bgDTO", bgDTO);

		
		return "body/cart/cartPayForm";
	}
	
	
}
