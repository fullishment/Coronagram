package com.gdj37.coronagram.web.user_page.controller;

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
import com.gdj37.coronagram.web.user_page.service.IServiceUserPage;

@Controller
public class UserPage {
	@Autowired
	public IServiceUserPage iServiceUserPage;
	
	@RequestMapping(value="/userpage")
	public ModelAndView userpage(ModelAndView mav) {
		
		mav.setViewName("user_page/user_page");
		return mav;
	}
	@RequestMapping(value="/userpages" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String userpages(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> list = iServiceUserPage.getMPostList(params);
		HashMap<String,String> intro = iServiceUserPage.getIntroM(params);
		List<HashMap<String, String>> fcnt = iServiceUserPage.getFollowCnt(params);

		modelMap.put("fcnt", fcnt);
		modelMap.put("intro", intro);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/modalpages" ,method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String modalpages(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		
		HashMap<String,String> modalM = iServiceUserPage.getModalM(params);
		List<HashMap<String,String>> md = iServiceUserPage.getMDtlList(params);
		List<HashMap<String,String>> modalCmt = iServiceUserPage.getModalCmt(params);

		modelMap.put("md", md);
		modelMap.put("modalM", modalM);
		modelMap.put("modalCmt", modalCmt);
		
		return mapper.writeValueAsString(modelMap);
	}
}
