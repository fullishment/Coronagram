package com.gdj37.coronagram.web.admin_main.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.admin_main.service.IServiceAdminMain;

@Controller
public class admin_main {
	@Autowired
	public IServiceAdminMain iServiceAdminMain;
	
	@RequestMapping(value ="/admin_main")
	public ModelAndView admin_mainList(@RequestParam HashMap<String, String> params, 
			ModelAndView mav)throws Throwable {
		//회원관리
		HashMap<String, String> data = iServiceAdminMain.getadmin_main(params);
		HashMap<String, String> data1 = iServiceAdminMain.getNewQ(params);
		//Q&A 
		List<HashMap<String, String>> list = iServiceAdminMain.getadminQnaList(params);
		mav.addObject("data", data);
		mav.addObject("data1", data1);
		mav.addObject("list", list);
		mav.setViewName("admin_main/admin_main");
		
		return mav;
	}

}
