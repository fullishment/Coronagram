package com.gdj37.coronagram.web.menu_bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

	@Controller
	public class menu_bar {

			@RequestMapping(value ="/menu_bar")
			public ModelAndView qna(ModelAndView mav) {
				
				mav.setViewName("menu_bar/menu_bar");
				return mav;
			}
}
