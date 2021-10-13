package com.gdj37.coronagram.web.edit_profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.edit_profile.service.IServiceEdit_Profile;

@Controller
public class ControllerEdit_Profile {
	@Autowired 
	public IServiceEdit_Profile iServiceEdit_Profile;
	
	@RequestMapping(value="/edit_profile")
	public ModelAndView edit_profile(ModelAndView mav) {
		
		mav.setViewName("edit_profile/edit_profile");
		
		return mav;
	}
}
