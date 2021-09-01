package mybatis;

import lombok.Data;

@Data
public class CouponAndUseDTO {
	private String cou_idx; 
	private String cou_code; 
	private String cou_name; 
	private String cou_per; 
	private String cou_won; 
	private String cou_start; 
	private String cou_end; 
	private String ev_code; 
	
	private String userid; 
	private String cou_use;
}
