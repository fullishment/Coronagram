package com.gdj37.coronagram.web.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.login.service.IServiceSign_up;

@Controller
public class Sign_up {
	@Autowired
	public IServiceSign_up iServiceSign_up;    
	
	@RequestMapping(value = "/sign_up")   //add
	   public ModelAndView sign_up(@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
	      HashMap<String,String> last = iServiceSign_up.lastNum(params);
	      mav.addObject("last",last);
	      mav.setViewName("sign_up/sign_up");

	      return mav;
	   }
	
	@RequestMapping(value = "/mAdds")
	public ModelAndView mAdds(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		int checkCnt = iServiceSign_up.getMIdCheck(params);
		int checkNickCnt = iServiceSign_up.getNickCheck(params);
		
		if (checkCnt + checkNickCnt == 0) {
			//비밀번호 암호화
			String m_pw = Utils.encryptAES128(params.get("m_pw"));
			params.put("m_pw",m_pw);
			
			int cnt = iServiceSign_up.addSign(params);    
			int crngSet = iServiceSign_up.crngSet(params);
			
			if (cnt > 0) {
				mav.setViewName("redirect:login");
				
			} else {
				mav.addObject("msg", "등록중 문제가 발생했습니다..");
				mav.setViewName("failed/failed");
			}
		} else {
			mav.addObject("msg", "중복된 아이디나 닉네임이 있습니다.");
			mav.setViewName("failed/failed");
		}
		
		return mav;
	}
	
	//ID체크
		@RequestMapping(value = "/MIdCheckAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String MIdCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int cnt = iServiceSign_up.getMIdCheck(params);
			
			modelMap.put("cnt", cnt);
			
			return mapper.writeValueAsString(modelMap);
		}
	//닉네임체크
			@RequestMapping(value = "/MNickCheckAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String MNickCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();

				Map<String, Object> modelMap = new HashMap<String, Object>();
					
				int cnt = iServiceSign_up.getNickCheck(params);
					
				modelMap.put("cnt", cnt);
					
				return mapper.writeValueAsString(modelMap);
			}

}
