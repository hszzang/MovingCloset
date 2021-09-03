package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisQNAImpl {
	
	
	public QnaDTO getQnaDTO();
	public List<QnaDTO> getQnaList(QnaDTO qnaDTO);
	public QnaDTO getQnaDetail(String q_idx); 
	public void insertQNA(QnaDTO qnaDTO);

	
}
