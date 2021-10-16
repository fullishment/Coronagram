package com.gdj37.coronagram.web.coinfo_info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_info.service.IServiceCoinfo_Infolist;

@Controller
public class coinfo_infolist {
	@Autowired
	public IServiceCoinfo_Infolist iServiceCoinfo_Infolist;
	
	@RequestMapping(value="/coinfo_infolist")
	public ModelAndView coinfo_infolist(HttpSession session, ModelAndView mav)throws Throwable {
		
		if(session.getAttribute("sMNo")!=null) {
			mav.setViewName("coinfo_infolist/coinfo_infolist");
		}else {
			mav.setViewName("login/login");
		}
		
		return mav;
	}

}
