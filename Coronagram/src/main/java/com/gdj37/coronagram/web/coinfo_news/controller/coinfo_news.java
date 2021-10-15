package com.gdj37.coronagram.web.coinfo_news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_news.service.IServiceCoinfo_News;

@Controller
public class coinfo_news {
	@Autowired
	public IServiceCoinfo_News iServiceCoinfo_News;
	
	@RequestMapping(value="/coinfo_news")
	public ModelAndView coinfo_news(ModelAndView mav) {
		
		mav.setViewName("coinfo_news/coinfo_news");
		
		return mav;
	}

}
