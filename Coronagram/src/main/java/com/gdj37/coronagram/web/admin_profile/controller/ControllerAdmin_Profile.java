package com.gdj37.coronagram.web.admin_profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.admin_profile.service.IServiceAdmin_Profile;

@Controller
public class ControllerAdmin_Profile {
	@Autowired
	public IServiceAdmin_Profile iServiceAdmin_Profile;
	
	@RequestMapping(value="/admin_profile")
	public ModelAndView admin_profile(ModelAndView mav) {
		
		mav.setViewName("admin_profile/admin_profile");
		
		return mav;
	}
}
