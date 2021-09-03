package mybatis;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductAndDetailDTO {
	
	private String p_code;
	private String pd_color;
	private String pd_size;
	private String pd_stock;
	
	private String p_idx;
	private String p_name;
	private String p_price;
	private String p_brand;
	private String p_ofile;
	private String p_sfile;
	private String p_flag;
	private String p_tag;

	private MultipartFile uploadFile;
	
	

}
