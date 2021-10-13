package com.gdj37.coronagram.web.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class qna {

		@RequestMapping(value ="/qna")
		public ModelAndView qna(ModelAndView mav) {
			
			mav.setViewName("qna/qna");
			return mav;
		}
}
