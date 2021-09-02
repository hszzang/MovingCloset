package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisFAQImpl {
	
	
	public FaqDTO getFaqDTO();
	public List<FaqDTO> getFaqList(FaqDTO faqDTO);
	public FaqDTO getFaqDetail(String faq_idx);

	
}
