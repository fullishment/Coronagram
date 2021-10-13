package com.gdj37.coronagram.web.admin_qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
	public class admin_qna {

		@RequestMapping(value ="/admin_qna")
		public ModelAndView qna(ModelAndView mav) {
				
			mav.setViewName("admin_qna/admin_qna");
			return mav;
		}
	

}
