package com.gdj37.coronagram.web.AdminUser.controller;

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
import com.gdj37.coronagram.common.bean.PagingBean;
import com.gdj37.coronagram.common.service.IPagingService;
import com.gdj37.coronagram.web.AdminUser.service.IServiceAdminUser;

@Controller
public class ControllerAdminUser {
	@Autowired
	public IServiceAdminUser iServiceAdminUser;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/adminUser")   //add
	public ModelAndView adminUser(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("admin_user/admin_user");

		return mav;
	}
	@RequestMapping(value="/adminUsers" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adminUsers(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iServiceAdminUser.getAuCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		List<HashMap<String,String>> list = iServiceAdminUser.getUserList(params);
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
}
