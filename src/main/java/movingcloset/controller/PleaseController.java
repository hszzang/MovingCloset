package movingcloset.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PleaseController {

	@RequestMapping(value="/movingcloset/please.do", method=RequestMethod.GET)
	public String Please(Locale locale, Model model) {
		return "body/please";
	}
}
