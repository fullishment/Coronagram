package com.gdj37.coronagram.web.coinfo_step.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class coinfo_step {
	
	@RequestMapping(value ="/coinfo_step")
	public ModelAndView coinfo_step(ModelAndView mav) {
		
		mav.setViewName("coinfo_step/coinfo_step");
		
		return mav;
	}
}
