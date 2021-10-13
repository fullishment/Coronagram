package com.gdj37.coronagram.web.prod_dtl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

	@Controller
	public class prod_dtl {

			@RequestMapping(value ="/prod_dtl")
			public ModelAndView qna(ModelAndView mav) {
				
				mav.setViewName("prod_dtl/prod_dtl");
				return mav;
			}
	}