package mybatis;

import lombok.Data;

@Data
public class BuyAndGroupDTO {
	
	private String  b_idx;
	private String  b_totalpay;
	private java.sql.Date  b_date;
	private String  b_buyer; 
	private String  b_phone; 
	private String  b_postcode;
	private String  b_addr;
	private String  b_payment;
	private String  b_waybill;
	private String  userid;
	private String  bd_idx;
	private String  p_code;
	private String  bd_count;
	private String  bd_size;
	private String 	email;
	private String  b_status; // 관리자용 확인 (결제 전/ 결제 완료/ 배송준비/ 배송중/ 배송완료)
	
	//accountnumber null 가능
	private String  accountnumber;

	//cou_code null 가능
	private String  cou_code;
	private String  cou_per;
	
	// 장바구니-구매폼 주문내역 출력시 쓸 sfile 저장
	
	private String p_name;
	private String p_price;
	private String p_brand;
	private String p_ofile;
	private String p_sfile;
	private String p_flag;
	private String p_tag;

	
	
}
