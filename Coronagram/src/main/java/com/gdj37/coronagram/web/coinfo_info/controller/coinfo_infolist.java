package com.gdj37.coronagram.web.coinfo_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.web.coinfo_info.service.IServiceCoinfo_Infolist;

@Controller
public class coinfo_infolist {
	@Autowired
	public IServiceCoinfo_Infolist iServiceCoinfo_Infolist;

	@RequestMapping(value="/coinfo_infolist")
	public ModelAndView coinfoinfolist(
			@RequestParam HashMap<String, String> params, 
			ModelAndView mav) throws Throwable {
		
		/*
		if(session.getAttribute("sMNo")!=null) {
			mav.setViewName("coinfo_infolist/coinfo_infolist");
		}else {
			mav.setViewName("login/login");
		}
		
		*/
		
		List<HashMap<String, String>> list = iServiceCoinfo_Infolist.getInfolist(params);
	      
	    mav.addObject("list", list);
		
		mav.setViewName("coinfo_infolist/coinfo_infolist");
		
		
		return mav;

	}
	
	
	

//dtl 상세보기
		@RequestMapping(value = "/coinfo_coinfopage")
		public ModelAndView coinfo_infopage(
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
			
			HashMap<String, String> data = iServiceCoinfo_Infolist.getInfopage(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("coinfo_infopage/coinfo_infopage");
			
			return mav;
		}

		
}	



	
	