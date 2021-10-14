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
import com.gdj37.coronagram.web.qna.service.IServiceQna;

@Controller
public class qna {
	@Autowired
	public IServiceQna iServiceQna;

		@RequestMapping(value ="/qna")
		public ModelAndView qna(ModelAndView mav) {
			
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
			
			
			List<HashMap<String, String>> list = iServiceQna.getQnaList(params);
			
			modelMap.put("list", list);
			
			return mapper.writeValueAsString(modelMap);
		}
		@RequestMapping(value ="/myqna")
		public ModelAndView myqna(ModelAndView mav) {
			
			mav.setViewName("qna/myqna");
			return mav;
		}
}





