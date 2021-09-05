package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface MybatisCartImpl {
 
	public ArrayList<CartDTO> getCartList(CartDTO cartDTO);
	
	public void cartListRemove(CartDTO cartDTO);
	
	public void qtyTrans(CartDTO cartDTO);
	
	public int addcart(CartDTO cartDTO);
	
	public List<CartDTO> cartBuyList(String userid,String c_idx);
	public List<CartDTO> cartBuyListMap(Map<String, Object> param);
}
