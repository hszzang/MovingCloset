package com.project.movingcloset;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	
	
	@RequestMapping(value="/movingcloset/event_main.do", method=RequestMethod.GET)
	public String event_main() {
		
		return "body/event/event_main";
	}

}
