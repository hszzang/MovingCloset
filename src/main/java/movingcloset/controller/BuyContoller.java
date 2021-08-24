package movingcloset.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BuyContoller {

	@RequestMapping(value="/store/buy.do", method=RequestMethod.GET)
	public String BuyForm (Locale locale, Model model) {
		
		return "body/store/buyForm";
	}
}
