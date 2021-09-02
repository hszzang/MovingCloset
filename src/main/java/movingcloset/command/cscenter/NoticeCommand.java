package movingcloset.command.cscenter;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisNoticeImpl;
import mybatis.NoticeDTO;


@Service
public class NoticeCommand implements CommandImpl {
	
	public NoticeCommand() {
		//System.out.println("CS커맨드 호출");
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("CS커맨드 호출");
		
		NoticeDTO noticeDTO = new NoticeDTO();
		List<NoticeDTO> notiList = sqlSession.getMapper(MybatisNoticeImpl.class).getNotiList(noticeDTO);
		model.addAttribute("notiList", notiList);
		

	}
	
	
}
