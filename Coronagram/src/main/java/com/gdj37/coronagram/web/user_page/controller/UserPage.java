package com.gdj37.coronagram.web.user_page.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.user_page.service.IServiceUserPage;

@Controller
public class UserPage {
	@Autowired
	public IServiceUserPage iServiceUserPage;
	
	@RequestMapping(value="/userpage/{nicknm}" ,method = RequestMethod.GET)
	public ModelAndView userpage(ModelAndView mav,@RequestParam HashMap<String, String> params, @PathVariable("nicknm") String nicknm) throws Throwable {
		
	      if(params.get("m_no") != null) { //주소치고 들어갔을때 리스트로 넘어가게하고 목록에서 클릭해서 no랑 같이 넘어갔을땐 상세보기 잘나오게
	          HashMap<String, String> data = iServiceUserPage.getEditP(params);
	          
	          data.put("M_PW", Utils.decryptAES128(data.get("M_PW")));
	          
	          mav.addObject("data", data);
	          mav.setViewName("edit_profile/edit_profile");
	       }else {
	          mav.setViewName("redirect:main_page");
	       }
	       
	       return mav;

	}
	@RequestMapping(value="/userpage/userpages" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String userpages(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> list = iServiceUserPage.getMPostList(params);
		HashMap<String,String> intro = iServiceUserPage.getIntroM(params);
		int follow = iServiceUserPage.getFollow(params);
		int following = iServiceUserPage.getFollowing(params);
		
		modelMap.put("intro", intro);
		modelMap.put("list", list);
		modelMap.put("follow", follow);
		modelMap.put("following", following);
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/userpage/modalpages" ,method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
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
