package com.gdj37.coronagram.web.coronagram_add.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coronagram_add.service.IServiceCrngAdd;

@Controller
public class crngAdd {
	@Autowired
	public IServiceCrngAdd iServiceCrngAdd;

	@RequestMapping(value ="/coronagram/crngAdd")
	public ModelAndView crng_add(ModelAndView mav) {
		
		mav.setViewName("coronagram_add/coronagram_add");
		
		return mav;
	}
}
