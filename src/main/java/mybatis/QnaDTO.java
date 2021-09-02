package mybatis;

import java.util.Date;

import lombok.Data;

@Data
public class QnaDTO {
	
	private String q_idx;
	private String userid;
	private String q_cate;
	private String q_content;
	private Date q_date;
	private String q_ofile;
	private String q_sfile;
	private String q_title;
	
	private int q_group;
	private int q_step;
	private int q_indent;
	
	//가상번호 부여를 위한 멤버변수 추가
	private int virtualNum;
	
}
