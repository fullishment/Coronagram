package com.gdj37.coronagram.web.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.login.service.IServiceLogin;

@Controller
public class ControllerLogin {
	@Autowired
	public IServiceLogin iServiceLogin;
	
	@RequestMapping(value= "/login")
	public ModelAndView login(ModelAndView mav) {
		
		mav.setViewName("login/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/")
	public ModelAndView m1Login(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("sMNo") != null) {// 로그인 중
			mav.setViewName("redirect:testO");
		} else {// 로그인 안된 상태
			mav.setViewName("/");
		}

		return mav;
	}
}
