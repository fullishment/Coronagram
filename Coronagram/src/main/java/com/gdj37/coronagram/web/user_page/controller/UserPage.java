package com.gdj37.coronagram.web.user_page.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.user_page.service.IServiceUserPage;

@Controller
public class UserPage {
	@Autowired
	public IServiceUserPage iServiceUserPage;
	
	@RequestMapping(value="/user_page")
	public ModelAndView user_page(ModelAndView mav) {
		
		mav.setViewName("user_page/user_page");
		return mav;
	}
}
