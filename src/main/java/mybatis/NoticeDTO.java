package mybatis;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	private String noti_idx;
	private String noti_title;
	private String noti_contents;
	private Date noti_postdate;
	
	
}
