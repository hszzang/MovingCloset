package mybatis;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MybatisMypageImpl {

	public List<BuyAndGroupDTO> orderlist(String userid);
	
}
