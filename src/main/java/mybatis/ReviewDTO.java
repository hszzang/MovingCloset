package mybatis;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private String p_code;
	private String r_rate;
	private String r_content;
	private String userid;
	private Date r_date;
	private String r_ofile;
	private String r_sfile;
	private String r_idx;
	private String rt_fabric;
	private String rt_fit;
	private String rt_size;
	private String rt_finish;

	
	

	
	
}
