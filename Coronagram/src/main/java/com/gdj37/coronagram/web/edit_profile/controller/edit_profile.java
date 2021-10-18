package com.gdj37.coronagram.web.edit_profile.controller;

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
import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.edit_profile.service.IServiceEdit_profile;

@Controller
public class edit_profile {
	@Autowired
		public IServiceEdit_profile iServiceEdit_profile;

//list
	@RequestMapping(value="/edit_profile")
		public ModelAndView edit_profileList(@RequestParam HashMap<String, String> params,
				ModelAndView mav) {
		
		mav.setViewName("edit_profile/edit_profile");
		
		return mav;
	}
	@RequestMapping(value = "/edit_profileListAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
		public String edit_profileListAjax(
				@RequestParam HashMap<String, String> params) throws Throwable {
					ObjectMapper mapper = new ObjectMapper();
				
				Map<String, Object> modelMap = new HashMap<String, Object>();
								
				List<HashMap<String, String>> list = iServiceEdit_profile.getedit_profileList(params);
				
				modelMap.put("list", list);
				
				return mapper.writeValueAsString(modelMap);
			}
//ID체크
		@RequestMapping(value = "/edit_profileIdCheckAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String edit_profileIdCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int cnt = iServiceEdit_profile.getprofileIdCheck(params);
			
			modelMap.put("cnt", cnt);
			
			return mapper.writeValueAsString(modelMap);
		}
//상세보기
		@RequestMapping(value="/edit_profileDtl")
		public ModelAndView edit_profileDtl(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
			HashMap<String, String> data = iServiceEdit_profile.getedit_profile(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("edit_profile/edit_profile");
			
			return mav;
		}
//수정
		@RequestMapping(value="/edit_profileUp")
		public ModelAndView edit_profileUp(@RequestParam HashMap<String, String> params,
								ModelAndView mav,HttpSession httpsession) throws Throwable {
			if(params.get("no") != null) { //주소치고 들어갔을때 리스트로 넘어가게하고 목록에서 클릭해서 no랑 같이 넘어갔을땐 상세보기 잘나오게
			HashMap<String, String> data = iServiceEdit_profile.getedit_profile(params);
			
			data.put("M_PW", Utils.decryptAES128(data.get("M_PW")));
			
			mav.addObject("data", data);
			
			mav.setViewName("edit_profile/edit_profile");
		} else {
			mav.setViewName("redirect:getedit_profileList");
		}
			
			return mav;
		}
		
		@RequestMapping(value="/edit_profileUps",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
		@ResponseBody
		public String edit_profiles (@RequestParam HashMap<String,String> params) throws Throwable {

			
			ObjectMapper mapper = new ObjectMapper();
			Map<String,Object> modelMap = new HashMap<String,Object>();
			String result ="success";
			try {
				String mPw =Utils.encryptAES128(params.get("mPw"));
				params.put("mPw",mPw);

				int cnt =iServiceEdit_profile.getprofileUp(params);
				if(cnt==0) {
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
