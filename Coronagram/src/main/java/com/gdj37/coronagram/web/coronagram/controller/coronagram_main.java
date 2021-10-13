package com.gdj37.coronagram.web.coronagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coronagram.service.IServiceCoronagram;

@Controller
public class coronagram_main {
	@Autowired
	public IServiceCoronagram iServiceCoronagram;
	
	@RequestMapping(value="/coronagram_main")
	public ModelAndView coronagram_main(ModelAndView mav) {
		mav.setViewName("coronagram_main/coronagram_main");
		return mav;
	}
}
