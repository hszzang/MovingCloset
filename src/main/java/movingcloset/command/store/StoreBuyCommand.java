package movingcloset.command.store;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.BuyAndGroupDTO;
import mybatis.CouponAndUseDTO;
import mybatis.MemberDTO;
import mybatis.MybatisEventCouponImpl;
import mybatis.MybatisMoyoImpl;
import mybatis.MybatisProductImpl;
import mybatis.ProductAndDetailDTO;
import mybatis.ProductDTO;

@Service
public class StoreBuyCommand implements CommandImpl {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public void execute(Model model) {
		// p_code, image, p_brand,p_name, p_price,bd_count,p_size

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		HttpSession session = req.getSession();
		ProductDTO productDTO = new ProductDTO();
		
		String userid = (String) session.getAttribute("siteUserInfo");
		String b_buyer = req.getParameter("b_buyer");
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");
		String mobile3 = req.getParameter("mobile3");
		String postcode = req.getParameter("postcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String b_totalpay = req.getParameter("b_totalpay");
		String b_payment = req.getParameter("b_payment");
		String accountnumber = req.getParameter("accountnumber");
		String num = req.getParameter("num");
		String cou_code = "";
		String temp = "";

		BuyAndGroupDTO buyAndGroupDTO = new BuyAndGroupDTO();


		String bd_count = req.getParameter("bd_count");
		String p_code = req.getParameter("p_code");
		String bd_size = req.getParameter("bd_size");

		try {
			int intnum = Integer.parseInt(num);
			for (int i = 0; i <= intnum; i++) {
				temp = req.getParameter("cou_check" + i);
				if (temp != null) {
					if (i == 0) {
						cou_code = temp;
					} else {
						cou_code = cou_code + "," + temp;
					}
					System.out.println("coucode : " + cou_code);
				}
			}
		} catch (NumberFormatException e) {
			System.out.println("coucode ????????????");
			System.out.println(temp);
		} catch (Exception e) {

		}

		int random = (int) (Math.random() * 1000);

		buyAndGroupDTO.setB_buyer(b_buyer);
		buyAndGroupDTO.setUserid(userid);
		buyAndGroupDTO.setB_phone(mobile1 + "-" + mobile2 + "-" + mobile3);
		buyAndGroupDTO.setB_postcode(postcode);
		buyAndGroupDTO.setB_addr(addr1 + " " + addr2);
		buyAndGroupDTO.setEmail(email1 + "@" + email2);
		buyAndGroupDTO.setBd_count(bd_count);
		buyAndGroupDTO.setP_code(p_code);
		buyAndGroupDTO.setBd_size(bd_size);
		buyAndGroupDTO.setB_totalpay(b_totalpay);
		buyAndGroupDTO.setB_payment(b_payment);
		buyAndGroupDTO.setB_waybill("MC"+random);
		buyAndGroupDTO.setAccountnumber(accountnumber);

		String[] coulist = cou_code.split(",");

		if (userid != null) {

			int result = sqlSession.getMapper(MybatisProductImpl.class).insertBuyForm(buyAndGroupDTO);
			int result2 = 0;
			if (cou_code == "" || coulist.length == 1) {
				buyAndGroupDTO.setCou_code(cou_code);
				result2 = sqlSession.getMapper(MybatisProductImpl.class).insertBuy_groupForm(buyAndGroupDTO);
			} else if (coulist.length > 1) {

				for (int j = 0; j < Integer.parseInt(num); j++) {
					String cou = coulist[j];
					buyAndGroupDTO.setCou_code(cou);
					result2 = sqlSession.getMapper(MybatisProductImpl.class).insertBuy_groupForm(buyAndGroupDTO);
				}
			}

			productDTO = sqlSession.getMapper(MybatisProductImpl.class).getProductDTOsfile(p_code);

			model.addAttribute("buyAndGroupDTO", buyAndGroupDTO);
			model.addAttribute("productDTO", productDTO);
			System.out.println("????????? insert : " + result + "?????????group insert : " + result2);
		}
	

		/************ ???????????? ???????????? ************/
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			SimpleDateFormat format1 = new SimpleDateFormat("yyyy??? MM???dd??? HH???mm???");
			Date time = new Date();
			String nowTime = format1.format(time);

			messageHelper.setFrom("MovingCloset<movingcloset@movingcloset.com>");
			messageHelper.setTo("<" + buyAndGroupDTO.getEmail() + ">");
			messageHelper.setSubject("[MovingCloset] ????????? ?????????????????????.");
			messageHelper.setText(
					"<div><br/><h2 style='text-align: center;'><strong>MovingCloset</strong> ???????????? ?????????????????????.</h2>"
							+ "<table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  </td></tr></tbody></table> </td></tr></tbody></table>   "
							+ "             <table><tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='800' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:15px;padding-top:20px;padding-left:40px;'> <p style='Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:19px;color:#000000;'><strong>????????????</strong></p> </td></tr></tbody></table> </td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:40px;padding-left:40px;padding-right:40px;background-position:center top;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:center top;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  "
							+ "                       <table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0px;border-bottom:2px solid #FF7A19;background:none;height:1px;width:100%;margin:0px;'></td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0;'>  "
							+ "                       <!-- ???????????? -->  "
							+ "                       <table style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed;width:100%;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ nowTime
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_payment()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_totalpay()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getAccountnumber()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "?????????</th><td colspan='3' style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ productDTO.getP_name()
							+ " ???</td></tr></tbody></table></td></tr></tbody></table> </td></tr></tbody></table> </td></tr></tbody></table> "
							+ "<table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  </td></tr></tbody></table> </td></tr></tbody></table>   "
							+ "             <table><tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='800' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:15px;padding-top:20px;padding-left:40px;'> <p style='Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:19px;color:#000000;'><b>????????? ??????</b></p> </td></tr></tbody></table> </td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:40px;padding-left:40px;padding-right:40px;background-position:center top;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:center top;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  "
							+ "                       <table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0px;border-bottom:2px solid #FF7A19;background:none;height:1px;width:100%;margin:0px;'></td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0;'>  "
							+ "                       <!-- ??????????????? -->  "
							+ "                       <table style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed;width:100%;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_buyer()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_phone()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "????????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_postcode()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "?????????</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getEmail()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "??????</th><td colspan='3' style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_addr()
							+ "</td></tr></tbody></table></td></tr></tbody></table> </td></tr></tbody></table> </td></tr></tbody></table>"
							+ "<br/><h4  >????????? ????????? MovingCloset ?????????????????? ???????????????.></h4><br/><h5>???????????????.</h5><br/><br/><br/></div>",
					true);
			System.out.println("mainsend");
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
