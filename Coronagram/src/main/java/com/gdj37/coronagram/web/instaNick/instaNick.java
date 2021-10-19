package com.gdj37.coronagram.web.instaNick;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class instaNick {
	@RequestMapping(value = "/instaNick")
	public ModelAndView instaNick(ModelAndView mav) {

		mav.setViewName("instaNick/instaNick");

		return mav;
	}
}
