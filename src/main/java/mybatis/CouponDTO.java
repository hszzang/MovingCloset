package mybatis;

import lombok.Data;

@Data
public class CouponDTO {

	private int cou_idx;
	private String cou_code;
	private String cou_name;
	private int cou_per; 
	private int cou_won;
	private java.sql.Date cou_start;
	private java.sql.Date cou_end;
	private String ev_code;
	private String cou_brand;
	private int cou_views;
	private String cou_cate;
	private String cou_content;
	private String userid;
	private String cou_ofile;
	private String cou_sfile;
	
	private String cou_use;
}
