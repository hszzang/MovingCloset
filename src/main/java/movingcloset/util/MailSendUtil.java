package movingcloset.util;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;


public class MailSendUtil {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	public String sendNewPw(String toMailAddr) {
		
		
		String newPassword = UUID.randomUUID().toString().replaceAll("-", "").substring(10);

		final MailVO vo = new MailVO();
		vo.setTo("<"+ toMailAddr +">");
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

		return newPassword;
	}
	
}
