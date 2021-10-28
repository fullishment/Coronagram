package com.gdj37.coronagram.web.coinfo_step.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_step.service.IServiceCoinfo_Step;

@Controller
public class coinfo_step {
	@Autowired
	public IServiceCoinfo_Step iServiceCoinfo_Step;
	
	@RequestMapping(value ="/coinfo_step")
	public ModelAndView coinfostep(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iServiceCoinfo_Step.getSteplist(params);
	      
	    mav.addObject("list", list);
		
		mav.setViewName("coinfo_step/coinfo_step");
		
		return mav;
	}
}
