package movingcloset.command.store;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import movingcloset.command.CommandImpl;
import mybatis.MybatisProductImpl;
import mybatis.ReviewDTO;

@Service
public class ReviewInsertCommand implements CommandImpl {

		@Autowired
		private SqlSession sqlSession;
		
		@Override
		public void execute(Model model) {
			
			System.out.println("ReviewInsertCommand 호출");

			Map<String, Object>paramMap = model.asMap();
			MultipartHttpServletRequest req = (MultipartHttpServletRequest)paramMap.get("req");
			HttpServletResponse resp = (HttpServletResponse)paramMap.get("resp");
			HttpSession session = req.getSession();
						
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO = (ReviewDTO)paramMap.get("reviewDTO");
			
			System.out.println("ofileCheck이당 : "+req.getParameter("ofileCheck"));
			
			if(req.getParameter("ofileCheck").equals("fileOK")) {
				String path = req.getSession().getServletContext().getRealPath("/resources/upload");
				resp.setContentType("text/html; charset=utf-8");
				
				Map returnObj = new HashMap();
				
				
				try {
					PrintWriter pw = resp.getWriter();
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
						System.out.println("revieOfile : "+ofile);
						file.put("sfile", sfile);
						System.out.println("reviewSfile : "+sfile);
						file.put("serverFullName", serverFullName);
						System.out.println("rfileFullname : " + serverFullName);
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
				
				reviewDTO.setR_ofile(p_ofile);
				reviewDTO.setR_sfile(p_sfile);				
				
				String userid = (String) session.getAttribute("siteUserInfo");
				String p_code = req.getParameter("p_code");
				String r_rate = req.getParameter("starRate");
				String rt_fabric = req.getParameter("rt_fabric");
				String rt_fit = req.getParameter("rt_fit");
				String rt_size = req.getParameter("rt_size");
				String rt_finish = req.getParameter("rt_finish");
				String r_content = req.getParameter("reviewText");
				
				reviewDTO.setUserid(userid);
				reviewDTO.setP_code(p_code);
				reviewDTO.setR_rate(r_rate);
				reviewDTO.setRt_fabric(rt_fabric);
				reviewDTO.setRt_fit(rt_fit);
				reviewDTO.setRt_size(rt_size);
				reviewDTO.setRt_finish(rt_finish);
				reviewDTO.setR_content(r_content);
				
				int result = sqlSession.getMapper(MybatisProductImpl.class).insertReview(reviewDTO);
				
				System.out.println("review insert : "+result);
				
				model.addAttribute("reviewDTO", reviewDTO);
				if(result==1) {
					session.setAttribute("complete","OK");				
				}  

				
				
			}else {
				
				String userid = (String) session.getAttribute("siteUserInfo");
				String p_code = req.getParameter("p_code");
				String r_rate = req.getParameter("starRate");
				String rt_fabric = req.getParameter("rt_fabric");
				String rt_fit = req.getParameter("rt_fit");
				String rt_size = req.getParameter("rt_size");
				String rt_finish = req.getParameter("rt_finish");
				String r_content = req.getParameter("reviewText");
				
				reviewDTO.setUserid(userid);
				reviewDTO.setP_code(p_code);
				reviewDTO.setR_rate(r_rate);
				reviewDTO.setRt_fabric(rt_fabric);
				reviewDTO.setRt_fit(rt_fit);
				reviewDTO.setRt_size(rt_size);
				reviewDTO.setRt_finish(rt_finish);
				reviewDTO.setR_content(r_content);
				
				/* 
					fabric : 1,2,3
					fit : 4,5,6
					size : 7,8,9
					finish : 10,11,12
				 */
				int result = sqlSession.getMapper(MybatisProductImpl.class).insertReviewNoFile(reviewDTO);
				
				System.out.println("review insert : "+result);
				
				model.addAttribute("reviewDTO", reviewDTO);
				if(result==1) {
					session.setAttribute("complete","OK");				
				}
				
			}
			
			
		}  
		
		
		public static String getUuid() {
			String uuid = UUID.randomUUID().toString();
			System.out.println("생성된UUID-1: " + uuid);
			// 중간에 포함된 하이픈 제거
			uuid = uuid.replaceAll("-", "");
			System.out.println("생성된UUID-2: " + uuid);
			
			return uuid;
		}
		
}
