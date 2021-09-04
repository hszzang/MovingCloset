package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisQNAImpl {
	
	
	public QnaDTO getQnaDTO();
	public List<QnaDTO> getQnaList(QnaDTO qnaDTO);
	public QnaDTO getQnaDetail(String q_idx); 
	public void insertQNA(QnaDTO qnaDTO);

	// 관리자모드 질답 리스트 불러오기
	public List<QnaDTO> QnAList();
	// 관리자 답변
	public QnaDTO adminAnswer(QnaDTO qnaDTO);
}
