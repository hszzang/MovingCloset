package movingcloset.command.cscenter;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import movingcloset.command.CommandImpl;
import mybatis.MybatisNoticeImpl;
import mybatis.NoticeDTO;


@Service
public class NoticeDetailCommand implements CommandImpl {
	
	public NoticeDetailCommand() {
		//System.out.println("CS커맨드 호출");
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("노티스디테일 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String noti_idx = req.getParameter("noti_idx");
		System.out.println("noti_idx" + noti_idx);
		
		NoticeDTO noticeDTO = sqlSession
				.getMapper(MybatisNoticeImpl.class).getNotiDetail(noti_idx);
		
		model.addAttribute("noticeDTO", noticeDTO);
		

	}
	
	
}
