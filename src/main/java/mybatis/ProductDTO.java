package mybatis;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
	
	// 스토어 리스트용
	
	//private File upload;
	
	private int p_idx;
	private String p_name;
	private String p_code;
	private int p_price;
	private String p_brand;
	private String p_ofile;
	private String p_sfile;
	
	private MultipartFile uploadFile;

}
