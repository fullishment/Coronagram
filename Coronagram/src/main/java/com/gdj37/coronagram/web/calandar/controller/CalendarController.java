package com.gdj37.coronagram.web.calandar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {
	@RequestMapping(value ="/calendar")
	public ModelAndView calendar(ModelAndView mav) {
		
		mav.setViewName("co_calendar/co_calendar");
		return mav;
	}
	
}
