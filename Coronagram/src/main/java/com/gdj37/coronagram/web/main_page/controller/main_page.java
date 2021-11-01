package com.gdj37.coronagram.web.main_page.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.main_page.service.IServiceMainPage;

@Controller
public class main_page {
	@Autowired
	public IServiceMainPage iServiceMainPage;
	
	@RequestMapping(value="/main")
	public ModelAndView main_page(ModelAndView mav) {
		mav.setViewName("main_page/main_page");
		return mav;
	}
	
	
}
