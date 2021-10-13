package com.gdj37.coronagram.web.admin_chart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_ChartController {

	@RequestMapping(value ="/admin_chart")
	public ModelAndView admin_chart(ModelAndView mav) {
		
		
		mav.setViewName("admin_chart/admin_chart");
		
		return mav;
	}
}