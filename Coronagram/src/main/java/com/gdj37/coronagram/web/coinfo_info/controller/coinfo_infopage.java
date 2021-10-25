package com.gdj37.coronagram.web.coinfo_info.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.coinfo_info.service.IServiceCoinfo_Infopage;

@Controller
public class coinfo_infopage {
	@Autowired
	public IServiceCoinfo_Infopage iServiceCoinfo_Infopage;
	
	@RequestMapping(value="/coinfo_infopage")
	public ModelAndView coinfoinfopage(@RequestParam HashMap<String, String> params,
            ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iServiceCoinfo_Infopage.getInfopage(params);
	      
	    mav.addObject("data", data);
		
		mav.setViewName("coinfo_infopage/coinfo_infopage");
		
		return mav;
	}
	
	
	
	
/*	
	
	
	@RequestMapping(value= "/testAB")
	public ModelAndView testAB(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		if(params.get("no") != null) {
			// 조회수 증가
			iTestAService.updateABHit(params);
			
			// 데이터 조회
			HashMap<String, String> data = iTestAService.getAB(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("testa/testAB");
		} else {
			mav.setViewName("redirect:testABList");
		}
		
		return mav;
	}
	
	@RequestMapping(value= "/testABUpdate")
	public ModelAndView testABUpdate(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		if(params.get("no") != null) {
			HashMap<String, String> data = iTestAService.getAB(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("testa/testABUpdate");
		} else {
			mav.setViewName("redirect:testABList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/testABUpdates", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String testABUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iTestAService.abUpdate(params);
			
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
	
	@RequestMapping(value = "/testABDeletes", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String testABDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iTestAService.abDelete(params);
			
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/testDtl")
	public ModelAndView testDtl(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iTestService.getB1(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("test/testDtl");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/testUpdate")
	public ModelAndView testUpdate(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iTestService.getB1(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("test/testUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/testUpdates")
	public ModelAndView testUpdates(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		int cnt = iTestService.updateB1(params);
		
		if(cnt > 0) {//수정 성공
			mav.setViewName("test/testUpdates");
		}else {
			mav.addObject("msg", "수정에 실패하였습니다.");
			mav.setViewName("test/failedAction");
		}
		
		return mav;	
	}
	
	
	@RequestMapping(value = "/testDelete")
	public ModelAndView testDelete(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		int cnt = iTestService.deleteB1(params);

		if(cnt > 0) {//삭제 성공
			mav.setViewName("redirect:testList");
		}else {
			mav.addObject("msg", "삭제에 실패하였습니다.");
			mav.setViewName("test/failedAction");
		}
		
		return mav;	
	}
	
*/


}
