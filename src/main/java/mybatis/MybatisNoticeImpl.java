package mybatis;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface MybatisNoticeImpl {
	
	
	public NoticeDTO getNoticeDTO();
	public List<NoticeDTO> getNotiList(NoticeDTO noticeDTO);
	public NoticeDTO getNotiDetail(String noti_idx);

	
}
