package movingcloset.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import movingcloset.command.CommandImpl2;
import movingcloset.command.cart.CartAddCartCommand;
import movingcloset.command.cart.CartListCommand;
import movingcloset.command.cart.CartListRemoveCommand;
import movingcloset.command.cart.CartQtyTransCommand;
import mybatis.CartDTO;

@Controller
public class CartController {
	
	CommandImpl2 command = null;
	
	@Autowired
	CartListCommand cartListCommand;
	
	@Autowired
	CartListRemoveCommand cartListRemoveCommand;
	
	@Autowired
	CartQtyTransCommand cartQtyTransCommand;
	
	@Autowired
	CartAddCartCommand cartAddCartCommand;
	
	// 장바구니메인
	@RequestMapping(value = "/movingcloset/cart.do", method = RequestMethod.GET)
	public String cart() {
		 
		return "body/cart/cart_main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cartlist", method = RequestMethod.POST)
	public ArrayList<CartDTO> cartList(CartDTO cartDTO) {
		
		System.out.println("cartlist호출");
		
		System.out.println(cartDTO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartDTO", cartDTO);
		command = cartListCommand;
		command.mapexecute(map);
		ArrayList<CartDTO> cartList = (ArrayList<CartDTO>) map.get("cartList");
		System.out.println("카트리스트출력"+cartList);
		return cartList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/listremove", method = RequestMethod.POST)
	public void listRemove(CartDTO cartDTO) {
		
		System.out.println("listremove호출");
		System.out.println(cartDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartDTO", cartDTO);
		command = cartListRemoveCommand;
		command.mapexecute(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/qtytrans", method = RequestMethod.POST)
	public void qtyTrans(CartDTO cartDTO) {
		
		System.out.println("qtytrans호출");
		System.out.println(cartDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartDTO", cartDTO);
		command = cartQtyTransCommand;
		command.mapexecute(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public void addCart(CartDTO cartDTO) {
		
		System.out.println("addcart호출");
		System.out.println(cartDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartDTO", cartDTO);
		command = cartAddCartCommand;
		command.mapexecute(map);
	}	
}
