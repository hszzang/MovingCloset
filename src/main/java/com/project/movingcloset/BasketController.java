package com.project.movingcloset;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BasketController {

	@RequestMapping(value="/movingcloset/basket.do", method=RequestMethod.GET)
	public String aboutRecruit(Locale locale, Model model) {
		
		return "body/basket/basket";
	}
}
