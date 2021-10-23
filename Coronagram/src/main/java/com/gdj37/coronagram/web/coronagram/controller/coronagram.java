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
		
		List<HashMap<String,String>> listFo = iServiceCoronagram.getListFollow(params);
		List<HashMap<String,String>> notFo = iServiceCoronagram.getNotFollow(params);		
		
		modelMap.put("post", post);
		modelMap.put("postCmt", postCmt);
		modelMap.put("notFo", notFo);
		modelMap.put("listFo", listFo);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/aHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int aHeart = iServiceCoronagram.aHeart(params);
			
			if(aHeart==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/dHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int dHeart = iServiceCoronagram.dHeart(params);
			if(dHeart==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/addPostCmt",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addModalCmt (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int addPCmt = iServiceCoronagram.addPostCmt(params);
			
			if(addPCmt==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/FollowAdd",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String FollowAdd (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int FollowA = iServiceCoronagram.FollowAdd(params);
			if(FollowA==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/FollowDel",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String FollowDel (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int FollowD = iServiceCoronagram.FollowDel(params);
			if(FollowD==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}	
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
}
