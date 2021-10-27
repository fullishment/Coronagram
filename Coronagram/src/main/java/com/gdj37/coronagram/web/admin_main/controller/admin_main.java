package com.gdj37.coronagram.web.admin_main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class admin_main {

	@RequestMapping(value ="/admin_main")
	public ModelAndView admin_chart(ModelAndView mav) {
		
		
		mav.setViewName("admin_main/admin_main");
		
		return mav;
	}
}
