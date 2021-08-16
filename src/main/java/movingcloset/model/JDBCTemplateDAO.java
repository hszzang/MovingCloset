package movingcloset.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


// K11JDBCTemplateAuto/src/main/java/springboard/model/JDBCTemplateDAO.java 참조함
@Repository
public class JDBCTemplateDAO {

	
	@Autowired
	JdbcTemplate template;

	public JDBCTemplateDAO() {
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}
	
	
	public void close() {
		/*
		JdbcTemplate에서는 자원해제를 하지 않는다
		Spring 설정파일에서 빈을 생성하므로 자원을 해제하면
		다시 new를 통해 생성해야 하므로 자원해제를 사용하지않는다.
		 */
		
	
	}
	
	
	
	
	
	
	
	
	
}
