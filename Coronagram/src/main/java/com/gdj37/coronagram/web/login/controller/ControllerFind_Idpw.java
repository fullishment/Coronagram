package com.gdj37.coronagram.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.login.service.IServiceFind_Idpw;

@Controller
public class ControllerFind_Idpw {
	@Autowired
	public IServiceFind_Idpw iServiceFind_Idpw;
	
	@RequestMapping(value="/find_idpw")
	public ModelAndView find_idpw(ModelAndView mav) {	
		
		mav.setViewName("find_idpw/find_idpw");
		
		return mav;
	}
}
