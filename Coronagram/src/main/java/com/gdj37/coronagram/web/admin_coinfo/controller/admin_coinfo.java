package com.gdj37.coronagram.web.admin_coinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.admin_coinfo.service.IServiceAdmin_Coinfo;

@Controller
public class admin_coinfo {
	@Autowired
	public IServiceAdmin_Coinfo iServiceAdmin_Coinfo;
	
	@RequestMapping(value="/admin_coinfo")
	public ModelAndView admin_coinfo(ModelAndView mav) {
		
		mav.setViewName("admin_coinfo/admin_coinfo");
		
		return mav;
	}
}