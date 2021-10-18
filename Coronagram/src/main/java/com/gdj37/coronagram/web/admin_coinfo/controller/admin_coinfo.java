package com.gdj37.coronagram.web.admin_coinfo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.web.admin_coinfo.service.IServiceAdmin_Coinfo;

@Controller
public class admin_coinfo {
	@Autowired
	public IServiceAdmin_Coinfo iServiceAdmin_Coinfo;
	
	@RequestMapping(value="/admin_coinfo")
	public ModelAndView admin_coinfo(ModelAndView mav)throws Throwable {
		
		
			mav.setViewName("admin_coinfo/admin_coinfo");
			
		return mav;
	}

	

	@RequestMapping(value = "/coinfoAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody 
	public String coinfoAddAjax(@RequestParam HashMap<String, String> params) throws Throwable { 
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iServiceAdmin_Coinfo.coinfoAdd(params);
			
			if(cnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			result = "error";
		}
		
		modelMap.put("result", result);

		return mapper.writeValueAsString(modelMap);
	}
}
