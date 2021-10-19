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
import com.gdj37.coronagram.web.user_page.service.IServiceUserPage;

@Controller
public class UserPage {
	@Autowired
	public IServiceUserPage iServiceUserPage;
	
	@RequestMapping(value="/userpage/{nicknm}" ,method = RequestMethod.GET)
	public ModelAndView userpage(ModelAndView mav, @PathVariable("nicknm") String nicknm) {
		System.out.println(nicknm);

		mav.setViewName("user_page/user_page");
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
		int fExist = iServiceUserPage.getfollowEx(params);
		int fExist2 = iServiceUserPage.getfollowEx2(params);
		
		modelMap.put("fExist", fExist);
		modelMap.put("fExist2", fExist2);
		modelMap.put("intro", intro);
		modelMap.put("list", list);
		modelMap.put("follow", follow);
		modelMap.put("following", following);
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/userpage/modalpages" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String modalpages(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		
		HashMap<String,String> modalM = iServiceUserPage.getModalM(params);
		List<HashMap<String,String>> md = iServiceUserPage.getMDtlList(params);
		List<HashMap<String,String>> modalCmt = iServiceUserPage.getModalCmt(params);		
		int hcnt = iServiceUserPage.getHeartCnt(params);
		
		
		modelMap.put("hcnt", hcnt);
		modelMap.put("md", md);
		modelMap.put("modalM", modalM);
		modelMap.put("modalCmt", modalCmt);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/userpage/likeCnt",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String LK (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		int like = iServiceUserPage.getLkCnt(params);
		
		modelMap.put("like", like);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/userpage/addHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String testABAdds (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int hAdd = iServiceUserPage.addHeart(params);
			
			if(hAdd==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/userpage/delHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String testABDeletes (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int hDel = iServiceUserPage.delHeart(params);
			if(hDel==0) {
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
