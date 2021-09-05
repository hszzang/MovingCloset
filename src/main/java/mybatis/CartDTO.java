package mybatis;

import lombok.Data;

@Data
public class CartDTO {

	private int c_idx;
	private int c_qty;
	private String userid;
	private String p_code;
	private String p_ofile;
	private String p_sfile;
	private String p_flag;
	private String pd_size;
	private int p_price;
	private String p_brand;
	private String pd_color;
}
