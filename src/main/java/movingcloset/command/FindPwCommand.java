package movingcloset.command;

import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mybatis.MybatisMemberImpl;

@Service
public class FindPwCommand implements CommandImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String userid = req.getParameter("userid");
		String email = req.getParameter("email");
		
		String findPwEmail = sqlSession.getMapper(MybatisMemberImpl.class).findPwEmail(userid, email);
		
		if(findPwEmail==null) {
			
		}
		else {
			String newPassword = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
			
			System.out.println(newPassword);
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom("MovingCloset<movingcloset@movingcloset.com>");
				messageHelper.setTo("<"+ email +">");
				messageHelper.setSubject("[MovingCloset] 임시 비밀번호를 발송하였습니다.");
				messageHelper.setText(
						"<div><br/><h2>MovingCloset 회원님의 임시 비밀번호를 발급드립니다.</h2><br/><br/>"
								+ "<h4>[ " + newPassword + " ]</h4><br/>"
								+ "해당 비밀번호는 임시 비밀번호이므로, 로그인 후 비밀번호를 변경해주세요.<br/></div>", true);
				mailSender.send(message);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			int changeNewPw = sqlSession.getMapper(MybatisMemberImpl.class).changeNewPw(newPassword, userid, email);
		}
		model.addAttribute("findPwEmail", findPwEmail);
	}
}
