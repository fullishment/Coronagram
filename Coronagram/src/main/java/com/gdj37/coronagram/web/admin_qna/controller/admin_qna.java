package com.gdj37.coronagram.web.admin_qna.controller;

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
import com.gdj37.coronagram.web.admin_qna.service.IServiceAdmin_Qna;

@Controller
	public class admin_qna {
		@Autowired
			public IServiceAdmin_Qna iServiceAdminQna;
		@Autowired
			public IPagingService iPagingService;	
		
//list
		@RequestMapping(value ="/admin_qna")
			public ModelAndView adminqna(@RequestParam HashMap<String, String> params,
					ModelAndView mav) {
				
				int page = 1;
					
				if(params.get("page") != null) {
					page = Integer.parseInt(params.get("page"));
				}
					mav.addObject("page", page);
				
					mav.setViewName("admin_qna/admin_qna");
					
					return mav;
				}
				
				
		@RequestMapping(value = "/adminQnaListAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
			public String adminQnaListAjax(
					@RequestParam HashMap<String, String> params) throws Throwable {
						ObjectMapper mapper = new ObjectMapper();
					
					Map<String, Object> modelMap = new HashMap<String, Object>();
					
					int page = Integer.parseInt(params.get("page"));
					
					int cnt = iServiceAdminQna.getadminQnaCnt(params);
					
					PagingBean pb = iPagingService.getPagingBean(page, cnt, 10, 5);
					
					params.put("startCnt", Integer.toString(pb.getStartCount()));
					params.put("endCnt", Integer.toString(pb.getEndCount()));
					
					List<HashMap<String, String>> list = iServiceAdminQna.getadminQnaList(params);
					
					modelMap.put("list", list);
					modelMap.put("pb", pb);
					
					return mapper.writeValueAsString(modelMap);
				}
//상세보기
	@RequestMapping(value="/admin_qna_answer")
		public ModelAndView admin_qna_answer(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iServiceAdminQna.getadminQna(params);
					
		mav.addObject("data", data);
					
		mav.setViewName("admin_qna/admin_qna_answer");
					
		return mav;
	}
//수정
	@RequestMapping(value = "/admin_qna_update")
	public ModelAndView adminQnaUp(@RequestParam HashMap<String, String>params,
								ModelAndView mav) throws Throwable {
		if(params.get("no") != null) { //주소치고 들어갔을때 리스트로 넘어가게하고 목록에서 클릭해서 no랑 같이 넘어갔을땐 상세보기 잘나오게
			HashMap<String, String> data= iServiceAdminQna.getadminQna(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("admin_qna/admin_qna");
		} else {
			mav.setViewName("redirect:getadminQnaList");
		}
		
		return mav;
	}
	@RequestMapping(value = "/admin_qna_updates", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String admin_qna_updates(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String result = "success";
		
		try {
			int cnt = iServiceAdminQna.getadminQnaUp(params);
			
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
	//삭제
		@RequestMapping(value = "/admin_qna_deletes", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String admin_qna_deletes(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iServiceAdminQna.getadminQnaDel(params);
				
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
