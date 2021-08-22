package mybatis;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private String p_code;
	private int p_rate;
	private String r_content;
	private String userid;
	private Date r_date;
	private String r_ofile;
	private String r_sfile;
	private String r_idx;

}
