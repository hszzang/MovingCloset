package mybatis;



import lombok.Data;

@Data
public class QnaDTO {
	
	private String q_idx;
	private String userid;
	private String q_cate;
	private String q_content;
	private String q_date;
	private String q_ofile;
	private String q_sfile;
	private String q_title; 
	private String q_status; // 관리자의 답변 여부
	private String q_flag; // 소비자 질문인지 관리자 답변인지 구분
	
	private int q_group;
	private int q_step;
	private int q_indent;
	
	//가상번호 부여를 위한 멤버변수 추가
	private int virtualNum;
	
}
