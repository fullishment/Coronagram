package com.gdj37.coronagram.web.coinfo_main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_main.service.IServiceCoinfo_Main;

@Controller
public class coinfo_main {
	@Autowired
	public IServiceCoinfo_Main iServiceCoinfo_Main;

	@RequestMapping(value="/coinfo_main")
	public ModelAndView coinfo_main(ModelAndView mav) {
		
		mav.setViewName("coinfo_main/coinfo_main");
		
		return mav;
	}
}
