package com.gdj37.coronagram.web.coinfo_info.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_info.service.IServiceCoinfo_Infopage;

@Controller
public class coinfo_infopage {
	@Autowired
	public IServiceCoinfo_Infopage iServiceCoinfo_Infopage;
	
	@RequestMapping(value="/coinfo_infopage")
	public ModelAndView coinfo_infopage(@RequestParam HashMap<String, String> params,
            ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iServiceCoinfo_Infopage.getInfopage(params);
	      
	    mav.addObject("data", data);
		
		mav.setViewName("coinfo_infopage/coinfo_infopage");
		
		return mav;
	}

}
