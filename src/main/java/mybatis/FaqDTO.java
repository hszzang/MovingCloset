package mybatis;

import java.util.Date;

import lombok.Data;

@Data
public class FaqDTO {
	
	private String faq_idx;
	private String faq_title;
	private String faq_contents;
	private String faq_cate;
	private Date faq_postdate;
	
	
}
