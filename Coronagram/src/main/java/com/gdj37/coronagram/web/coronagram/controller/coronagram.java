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
public class coronagram {
	@Autowired
	public IServiceCoronagram iServiceCoronagram;

	@RequestMapping(value="/coronagram")
	public ModelAndView main(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		mav.setViewName("coronagram_main/coronagram_main");
		return mav;
	}
	@RequestMapping(value="/crngPost" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String crngPost(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> post = iServiceCoronagram.getPostList(params);
		List<HashMap<String,String>> postCmt = iServiceCoronagram.getPostCmt(params);
		
		modelMap.put("post", post);
		modelMap.put("postCmt", postCmt);
		
		return mapper.writeValueAsString(modelMap);	
	}
}
