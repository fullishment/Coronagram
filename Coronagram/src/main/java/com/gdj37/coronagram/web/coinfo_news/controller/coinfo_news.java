package com.gdj37.coronagram.web.coinfo_news.controller;

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
import com.gdj37.coronagram.common.service.IPagingService;
import com.gdj37.coronagram.web.coinfo_news.service.IServiceCoinfo_News;

@Controller
public class coinfo_news {
	@Autowired
	public IServiceCoinfo_News iServiceCoinfo_News;
	
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value="/coinfo_news")
	public ModelAndView coinfo_news(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {
		/*
		String page = "1";
		
		if(params.get("page") != null) {
		page = params.get("page");
		}
		
		mav.addObject("page", page);
		*/
		
		mav.setViewName("coinfo_news/coinfo_news");
		
		return mav;
	}
	
}
	
	
	
	
	
	
	
	
	/*

	@RequestMapping(value = "/coinfo_news", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring에게 돌려주는 내용이 View임을 제시
	public String testABLists(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		
		//페이지 취득
		int page = Integer.parseInt(params.get("page"));
		
		//개수 취득
		int cnt = iTestAService.getABCnt(params);
		
		//페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page,  cnt, 7, 3);
		
		//데이터 시작, 종료값 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		//리스트 조회
		List<HashMap<String, String>> list = iTestAService.getABList(params);
		
		//데이터 담기
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		
		// {list:[{B_NO:~,~:~,...},{}...],pb:{startCnt:~,...}}
	}
	
	
	

	}
	
	
		 */

	
	/*
	
	@RequestMapping(value = "/coinfo_news")
	public ModelAndView coinfo_news(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page") != null) {
			page = params.get("page");
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("coinfo_news/coinfo_news");
		
		return mav;
	}
	
	/*
	 *  @RequestMapping
	 *  value : 주소
	 *  Method : 전송방식
	 *  produces : 돌려주는 형식
	 * 
	 */
	/*
	
	@RequestMapping(value = "/coinfo_newsAjex", method = RequestMethod.GET,
			produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring에게 돌려주는 내용이 View임을 제시
	public String coinfo_newsAjex(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		
		//페이지 취득
		int page = Integer.parseInt(params.get("page"));
		
		//개수 취득
		int cnt = iServiceCoinfo_News.getNewsCnt(params);
		
		//페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page,  cnt, 7, 3);
		
		//데이터 시작, 종료값 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		//리스트 조회
		List<HashMap<String, String>> list = iServiceCoinfo_News.getNewsList(params);
		
		//데이터 담기
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		
		// {list:[{B_NO:~,~:~,...},{}...],pb:{startCnt:~,...}}
	

			
		

		}
		
		*/
	

