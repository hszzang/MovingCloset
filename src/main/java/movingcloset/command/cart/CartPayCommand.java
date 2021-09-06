package movingcloset.command.cart;

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
public class CartPayCommand implements CommandImpl {

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
		String couidx = req.getParameter("couidx");
		System.out.println("couidx : "+couidx);
		
		BuyAndGroupDTO buyAndGroupDTO = new BuyAndGroupDTO();

		int random = (int) (Math.random() * 1000);

		buyAndGroupDTO.setB_buyer(b_buyer);
		buyAndGroupDTO.setUserid(userid);
		buyAndGroupDTO.setB_phone(mobile1 + "-" + mobile2 + "-" + mobile3);
		buyAndGroupDTO.setB_postcode(postcode);
		buyAndGroupDTO.setB_addr(addr1 + " " + addr2);
		buyAndGroupDTO.setEmail(email1 + "@" + email2);
		buyAndGroupDTO.setB_totalpay(b_totalpay);
		buyAndGroupDTO.setB_payment(b_payment);
		buyAndGroupDTO.setB_waybill("MC"+random);
		buyAndGroupDTO.setAccountnumber(accountnumber);

		String[] coulist = cou_code.split(",");

		// intnum 은 쿠폰의 총개수
		/*
		만약 num은 1인데 cou_check2가 되었으면
		cou_check2 가 되어야 하는데 이때 value는 어떻게 가져오나 
		*/
		try {
			int intnum = Integer.parseInt(num);
			if(intnum != 0) {
				for (int i = 0; i < intnum; i++) {
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
			}
		} catch (NumberFormatException e) {
			System.out.println("coucode 안들어옴");
			System.out.println(temp);
		} catch (Exception e) {

		}
		
		String[] bd_counts = req.getParameterValues("bd_count");
		String[] p_codes = req.getParameterValues("p_code");
		String[] bd_sizes = req.getParameterValues("bd_size");

		if (userid != null) {
		
			sqlSession.getMapper(MybatisProductImpl.class).insertBuyForm(buyAndGroupDTO);
			
			
			if (cou_code == "" || coulist.length == 1) {
				buyAndGroupDTO.setCou_code(cou_code);
				for(int x=0; x<=bd_counts.length-1; x++) {
					
					buyAndGroupDTO.setBd_count(bd_counts[x].toString());
					buyAndGroupDTO.setP_code(p_codes[x].toString());
					buyAndGroupDTO.setBd_size(bd_sizes[x].toString());	
					sqlSession.getMapper(MybatisProductImpl.class).insertBuy_groupForm(buyAndGroupDTO);
				}
				
				
			} else if (coulist.length > 1) {
			
				for (int y = 0; y < Integer.parseInt(num); y++) { 
					String cou = coulist[y];
					buyAndGroupDTO.setCou_code(cou); 
					
					for(int x=0; x<=bd_counts.length-1; x++) {
						
						buyAndGroupDTO.setBd_count(bd_counts[x].toString());
						buyAndGroupDTO.setP_code(p_codes[x].toString());
						buyAndGroupDTO.setBd_size(bd_sizes[x].toString());	
						sqlSession.getMapper(MybatisProductImpl.class).insertBuy_groupForm(buyAndGroupDTO);
					}

				} 
			}
			
				
			
			
		}
		

		
	
	

		/************ 주문내역 메일발송 ************/
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분");
			Date time = new Date();
			String nowTime = format1.format(time);

			messageHelper.setFrom("MovingCloset<movingcloset@movingcloset.com>");
			messageHelper.setTo("<" + buyAndGroupDTO.getEmail() + ">");
			messageHelper.setSubject("[MovingCloset] 주문이 완료되었습니다.");
			messageHelper.setText(
					"<div><br/><h2 style='text-align: center;'><strong>MovingCloset</strong> 회원님의 주문내역입니다.</h2>"
							+ "<table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  </td></tr></tbody></table> </td></tr></tbody></table>   "
							+ "             <table><tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='800' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:15px;padding-top:20px;padding-left:40px;'> <p style='Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:19px;color:#000000;'><strong>구매내역</strong></p> </td></tr></tbody></table> </td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:40px;padding-left:40px;padding-right:40px;background-position:center top;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:center top;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  "
							+ "                       <table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0px;border-bottom:2px solid #FF7A19;background:none;height:1px;width:100%;margin:0px;'></td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0;'>  "
							+ "                       <!-- 주문내역 -->  "
							+ "                       <table style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed;width:100%;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>주문일시</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ nowTime
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "결제수단</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_payment()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "거래금액</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_totalpay()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "입금계좌</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getAccountnumber()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "상품명</th><td colspan='3' style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ productDTO.getP_name()
							+ " 등</td></tr></tbody></table></td></tr></tbody></table> </td></tr></tbody></table> </td></tr></tbody></table> "
							+ "<table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  </td></tr></tbody></table> </td></tr></tbody></table>   "
							+ "             <table><tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='800' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:15px;padding-top:20px;padding-left:40px;'> <p style='Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:19px;color:#000000;'><b>주문자 정보</b></p> </td></tr></tbody></table> </td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td align='left' style='padding:0;Margin:0;padding-bottom:40px;padding-left:40px;padding-right:40px;background-position:center top;'>  "
							+ "               <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                 <tbody><tr style='border-collapse:collapse;'><td align='center' valign='top' width='720' style='padding:0;Margin:0;'>  "
							+ "                   <table cellpadding='0' cellspacing='0' width='100%' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:center top;'>  "
							+ "                     <tbody><tr style='border-collapse:collapse;'><td align='center' style='padding:0;Margin:0;'>  "
							+ "                       <table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0px;border-bottom:2px solid #FF7A19;background:none;height:1px;width:100%;margin:0px;'></td></tr></tbody></table> </td></tr><tr style='border-collapse:collapse;'><td style='padding:0;Margin:0;'>  "
							+ "                       <!-- 주문자정보 -->  "
							+ "                       <table style='mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed;width:100%;'>  "
							+ "                         <tbody><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "주문자명</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_buyer()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "전화번호</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_phone()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "우편번호</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_postcode()
							+ "</td><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "이메일</th><td style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getEmail()
							+ "</td></tr><tr style='border-collapse:collapse;'><th colspan='1' rowspan='1' style='border-bottom:1px solid #DDDDDD;line-height:26px;text-align:center;font-size:14px;padding:9px;color:#434343;word-break:break-all;width:120px;font-weight:700;background-color:#F8F8F8;'>"
							+ "주소</th><td colspan='3' style='padding:9px;Margin:0;border-bottom:1px solid #DDDDDD;line-height:26px;text-align:left;font-size:14px;color:#434343;word-break:break-all;'>"
							+ buyAndGroupDTO.getB_addr()
							+ "</td></tr></tbody></table></td></tr></tbody></table> </td></tr></tbody></table> </td></tr></tbody></table>"
							+ "<br/><h4  >자세한 사항은 MovingCloset 홈페이지에서 확인주세요.></h4><br/><h5>감사합니다.</h5><br/><br/><br/></div>",
					true);
			System.out.println("mainsend");
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
