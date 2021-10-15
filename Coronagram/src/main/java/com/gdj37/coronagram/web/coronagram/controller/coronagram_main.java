package com.gdj37.coronagram.web.coronagram.controller;

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
import com.gdj37.coronagram.web.coronagram.service.IServiceCoronagram;

@Controller
public class coronagram_main {
	@Autowired
	public IServiceCoronagram iServiceCoronagram;

	@RequestMapping(value="/coronagram")
	public ModelAndView coronagram(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		mav.setViewName("coronagram_main/coronagram_main");
		return mav;
	}

}
