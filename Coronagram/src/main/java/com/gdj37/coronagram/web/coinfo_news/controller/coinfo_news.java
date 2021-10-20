package com.gdj37.coronagram.web.coinfo_news.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.common.service.IPagingService;
import com.gdj37.coronagram.web.coinfo_news.service.IServiceCoinfo_News;

@Controller
public class coinfo_news {
	@Autowired
	public IServiceCoinfo_News iServiceCoinfo_News;
	
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value="/coinfo_news")
	public ModelAndView coinfo_news(@RequestParam HashMap<String,String> params,
									ModelAndView mav) throws Throwable {
		

		mav.setViewName("coinfo_news/coinfo_news");
		
		return mav;
	}
	
}
	
