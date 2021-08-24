package mybatis;

import lombok.Data;

@Data
public class MemberDTO {

	// 멤버변수
	private String userid;
	private String userpass ;
	private String email;
	private String phone ;
	private String tag ;
	private String postcode ;
	private String addr;
	private String name ;
	private String birth ;
	private java.sql.Date regidate;
	private String loginbrand;
	
	
	
}
