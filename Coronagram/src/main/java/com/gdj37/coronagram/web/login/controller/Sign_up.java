package com.gdj37.coronagram.web.login.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.login.service.IServiceSign_up;

@Controller
public class Sign_up {
	@Autowired
	public IServiceSign_up iServiceSign_up;    
	
	@RequestMapping(value = "/sign_up")   //add
	public ModelAndView m1Add(ModelAndView mav) {

		mav.setViewName("sign_up/sign_up");

		return mav;
	}
	
	@RequestMapping(value = "/mAdds")
	public ModelAndView mAdds(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		int checkCnt = iServiceSign_up.getMIdCheck(params);

		if (checkCnt == 0) {
			//비밀번호 암호화
			String m_pw = Utils.encryptAES128(params.get("m_pw"));
			params.put("m_pw",m_pw);
			
			int cnt = iServiceSign_up.addSign(params);    
			
					

			if (cnt > 0) {
				
				mav.setViewName("redirect:main_page");
			} else {
				mav.addObject("msg", "등록중 문제가 발생했습니다..");
				mav.setViewName("failed/failed");
			}
		} else {
			mav.addObject("msg", "중복된 아이디가 있습니다.");
			mav.setViewName("failed/failed");
		}
		return mav;
	}

}