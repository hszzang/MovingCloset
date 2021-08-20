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

import movingcloset.util.MailSendUtil;
import movingcloset.util.MailVO;
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
		
		
		String newPassword = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);

		System.out.println(newPassword);
		
		final MailVO vo = new MailVO();
		vo.setTo("<"+ email +">");
		vo.setFrom("MovingCloset<movingcloset@movingcloset.com>");
		vo.setSubject("[MovingCloset] 임시 비밀번호를 발송하였습니다.");
		vo.setContents("<div>MovingCloset 회원님의 임시 비밀번호를 발급드립니다.</h5><br/>"
				+ "<h4>[" + newPassword + "]</h4><br/>"
				+ "해당 비밀번호는 임시 비밀번호이므로, 로그인 후 비밀번호를 변경해주세요.</div>");
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				helper.setText(vo.getContents(), true);
			}
		};
		mailSender.send(preparator);

//		String newPw = new MailSendUtil().sendNewPw(findPwEmail);
		int changeNewPw = sqlSession.getMapper(MybatisMemberImpl.class).changeNewPw(newPassword, userid, email);
		
		model.addAttribute("findPwEmail", findPwEmail);
		System.out.println(findPwEmail);
		
	}
}
