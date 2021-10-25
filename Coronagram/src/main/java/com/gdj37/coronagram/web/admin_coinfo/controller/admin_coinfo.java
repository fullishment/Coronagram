package com.gdj37.coronagram.web.admin_coinfo.controller;

import java.util.HashMap;
import java.util.List;
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
import com.gdj37.coronagram.common.bean.PagingBean;
import com.gdj37.coronagram.common.service.IPagingService;
import com.gdj37.coronagram.web.admin_coinfo.service.IServiceAdmin_Coinfo;

@Controller
public class admin_coinfo {
	@Autowired
	public IServiceAdmin_Coinfo iServiceAdmin_Coinfo;
	
	@Autowired
	public IPagingService iPagingService;	
	
	@RequestMapping(value = "/admin_coinfo_list")
	public ModelAndView admin_coinfo_list(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {

	
		String page = "1";
		
		if(params.get("page") != null) {
			page = params.get("page");
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("admin_coinfo/admin_coinfo_list");
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/adminCoinfoListAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String adminCoinfoListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); 
		
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iServiceAdmin_Coinfo.getAdinfoCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page,  cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iServiceAdmin_Coinfo.getAdinfoList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/admin_coinfo_add")
	public ModelAndView admin_coinfo_add(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sMNo") != null) {
			mav.setViewName("admin_coinfo/admin_coinfo_add");
		} else {
			mav.setViewName("redirect:main");
		}
		
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





	@RequestMapping(value= "/admin_coinfo_dtl")
	public ModelAndView admin_coinfo_dtl(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		if(params.get("no") != null) {

			HashMap<String, String> data = iServiceAdmin_Coinfo.getAdinfo(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("admin_coinfo/admin_coinfo_dtl");
		} else {
			mav.setViewName("redirect:admin_coinfo_list");
		}
		
		return mav;
	}






	@RequestMapping(value = "/admin_coinfo_upd")
	public ModelAndView admin_coinfo_upd(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
	
		HashMap<String, String> data = iServiceAdmin_Coinfo.getAdinfo(params);
	
		mav.addObject("data", data);
	
		mav.setViewName("admin_coinfo/admin_coinfo_upd");
	
		return mav;
	}
	
	
	
	   @RequestMapping(value = "/adminCoinfoUpdAjax", method = RequestMethod.POST,
		         produces = "text/json;charset=UTF-8")
		   @ResponseBody
		   public String adminCoinfoUpdAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		      ObjectMapper mapper = new ObjectMapper();
	
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      String result = "success";
		      
		      try {
		         int cnt = iServiceAdmin_Coinfo.updateAdinfo(params);
	
		         if(cnt ==0) {
						result = "failed";
					}
				}catch (Exception e) {
					e.printStackTrace();
					
					result = "error";
				}
		      modelMap.put("result", result);
		      
		      return mapper.writeValueAsString(modelMap);
		   }





	@RequestMapping(value = "/admin_coinfo_del", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String admin_coinfo_del(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		String result = "success";
	
		try {
			int cnt = iServiceAdmin_Coinfo.deleteAdinfo(params);
	
			if (cnt == 0) {
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
