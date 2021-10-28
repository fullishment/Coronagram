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
import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.AdminUser.service.IServiceAdminUser;

@Controller
public class ControllerAdminUser {
	@Autowired
		public IServiceAdminUser iServiceAdminUser;
	@Autowired
		public IPagingService iPagingService;
	
//list
	@RequestMapping(value = "/adminUser")
	public ModelAndView admin_user(@RequestParam HashMap<String, String> params,
		ModelAndView mav) {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
			mav.addObject("page", page);
				
			mav.setViewName("admin_user/admin_user");

		return mav;
	}
	@RequestMapping(value = "/adminUserListAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
		public String adminUserListAjax(
				@RequestParam HashMap<String, String> params) throws Throwable {
					ObjectMapper mapper = new ObjectMapper();
						
				Map<String, Object> modelMap = new HashMap<String, Object>();
						
				int page = Integer.parseInt(params.get("page"));
						
				int cnt = iServiceAdminUser.getadminUserCnt(params);
						
				PagingBean pb = iPagingService.getPagingBean(page, cnt, 6, 5);
						
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
				
				List<HashMap<String, String>> list = iServiceAdminUser.getadminUserList(params);
						
				modelMap.put("list", list);
				modelMap.put("pb", pb);
						
				return mapper.writeValueAsString(modelMap);
			}
	
//상세보기 (admin_profile)
	@RequestMapping(value="/admin_profile")
	public ModelAndView admin_profile(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iServiceAdminUser.getAProfile(params);
		List <HashMap<String, String >> list = iServiceAdminUser.getACCTList(params);
		mav.addObject("data", data);
		mav.addObject("testList", list);
		mav.setViewName("admin_profile/admin_profile");
			
		return mav;
	}
	
//수정
	@RequestMapping(value="/AProUps",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
		@ResponseBody
		public String AProUps (@RequestParam HashMap<String,String> params) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();
				Map<String,Object> modelMap = new HashMap<String,Object>();
			String result ="success";
			
				int cnt =iServiceAdminUser.getAProUps(params);
				if(cnt==0) {
					result="failed";
				}
			
			modelMap.put("result", result);
			return mapper.writeValueAsString(modelMap);
		}
//삭제
		@RequestMapping(value = "/AProDels", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String AProDels(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iServiceAdminUser.getAProDels(params);
				
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
	
	
}
