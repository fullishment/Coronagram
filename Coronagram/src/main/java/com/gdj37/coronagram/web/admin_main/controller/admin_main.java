package com.gdj37.coronagram.web.admin_main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.util.ScriptUtils;
import com.gdj37.coronagram.web.admin_main.service.IServiceAdminMain;

@Controller
public class admin_main {
	@Autowired
	public IServiceAdminMain iServiceAdminMain;
	
	@RequestMapping(value ="/admin_main")
	public ModelAndView admin_mainList(@RequestParam HashMap<String, String> params, 
			ModelAndView mav,HttpSession session, HttpServletResponse response)throws Throwable {
		if(session.getAttribute("acctNo")!=null) {
			int acctNo = Integer.parseInt(session.getAttribute("acctNo").toString());
			if(acctNo==6) {
				//회원관리
				HashMap<String, String> data = iServiceAdminMain.getadmin_main(params);
				HashMap<String, String> data1 = iServiceAdminMain.getNewQ(params);
				//Q&A 
				List<HashMap<String, String>> list = iServiceAdminMain.getadminQnaList(params);
				List<HashMap<String, String>> list0 = iServiceAdminMain.getadminList(params);
				List<HashMap<String, String>> list1 = iServiceAdminMain.getAdinfoList(params);
				List<HashMap<String, String>> list2 = iServiceAdminMain.getShopList(params);
				mav.addObject("data", data);
				mav.addObject("data1", data1);
				mav.addObject("list", list);
				mav.addObject("list0", list0);
				mav.addObject("list1", list1);
				mav.addObject("list2", list2);
				mav.setViewName("admin_main/admin_main");
			}else {
				ScriptUtils.alert(response, "관리자 전용 페이지 입니다.");
				mav.setViewName("main_page/main_page");
			}
		}else {
			ScriptUtils.alert(response, "관리자 전용 페이지 입니다.");
			mav.setViewName("main_page/main_page");
		}
		
		
		
		

		return mav;
	}
	

}
