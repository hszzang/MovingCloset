package mybatis;

import lombok.Data;

@Data
public class ProductDetailDTO {
	
	private String p_code;
	private String pd_color;
	private String pd_size;
	private int pd_stock;

}
