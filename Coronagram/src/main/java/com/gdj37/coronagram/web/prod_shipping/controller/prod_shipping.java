package com.gdj37.coronagram.web.prod_shipping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

	@Controller
	public class prod_shipping {

			@RequestMapping(value ="/prod_shipping")
			public ModelAndView qna(ModelAndView mav) {
				
				mav.setViewName("prod_shipping/prod_shipping");
				return mav;
			}
}
