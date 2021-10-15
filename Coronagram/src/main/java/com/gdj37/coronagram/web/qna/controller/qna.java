package com.gdj37.coronagram.web.qna.controller;

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
import com.gdj37.coronagram.web.qna.service.IServiceQna;

@Controller
public class qna {
	@Autowired
	public IServiceQna iServiceQna;
	@Autowired
	public IPagingService iPagingService;
	//list
		@RequestMapping(value ="/qna")
		public ModelAndView qna(@RequestParam HashMap<String, String> params,
				ModelAndView mav) {
			
			int page = 1;
			
			if(params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			mav.addObject("page", page);
			
			mav.setViewName("qna/qna");
			
			return mav;
		}
		
		
		@RequestMapping(value = "/QnaListAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String QnaListAjax(
				@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int page = Integer.parseInt(params.get("page"));
			
			int cnt = iServiceQna.getQnaCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iServiceQna.getQnaList(params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap);
		}
	//dtl
		@RequestMapping(value="/myqna")
		public ModelAndView myqna(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
			HashMap<String, String> data = iServiceQna.getQna(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("qna/myqna");
			
			return mav;
		}
		

	  @RequestMapping(value = "/qnaAdds", method = RequestMethod.POST,
			  produces = "text/json;charset=UTF-8")
	  @ResponseBody
	  public String qnaAdds(@RequestParam HashMap<String, String> params) throws Throwable {
		  ObjectMapper mapper = new ObjectMapper();
	  
	  Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	  String result = "success";
	  
	  try { 
		  int cnt = iServiceQna.qnaAdd(params);
	  
		  if(cnt ==0) { 
			  result = "failed"; 
		  } 
	  }catch (Exception e) {
		  e.printStackTrace();
	  
		  result = "error";
	  }
	  modelMap.put("result", result);
	  
	  return mapper.writeValueAsString(modelMap); }
	 
}





