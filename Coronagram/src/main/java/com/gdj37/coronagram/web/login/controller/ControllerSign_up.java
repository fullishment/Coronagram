package com.gdj37.coronagram.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.login.service.IServiceSign_up;

@Controller
public class ControllerSign_up {
	@Autowired
	public IServiceSign_up iServiceSign_up;
	
	@RequestMapping(value= "/sign_up")
	public ModelAndView sign_up(ModelAndView mav) {
		
		mav.setViewName("sign_up/sign_up");
		
		return mav;
	}
}
