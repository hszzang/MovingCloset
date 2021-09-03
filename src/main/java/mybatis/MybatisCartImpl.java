package mybatis;

import java.util.ArrayList;

public interface MybatisCartImpl {
 
	public ArrayList<CartDTO> getCartList(CartDTO cartDTO);
	
	public void cartListRemove(CartDTO cartDTO);
	
	public void qtyTrans(CartDTO cartDTO);
	
	public int addcart(CartDTO cartDTO);
}
