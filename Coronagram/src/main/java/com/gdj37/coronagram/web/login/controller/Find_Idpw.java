package com.gdj37.coronagram.web.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.util.ScriptUtils;
import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.login.VO.MemberVO;
import com.gdj37.coronagram.web.login.service.IServiceFind_Idpw;

@Controller
public class Find_Idpw {
	@Autowired
	public IServiceFind_Idpw iServiceFind_Idpw;
	
	@RequestMapping(value = "/find_idpw")   //add
	public ModelAndView find_idpw(ModelAndView mav) {

		mav.setViewName("find_idpw/find_idpw");

		return mav;
	}
	
	@RequestMapping(value="/find_idpws")
	public ModelAndView find_idpw(HttpServletResponse response,ModelAndView mav,HttpSession session,@RequestParam HashMap<String,String> params) throws Throwable{	
		System.out.println(params.get("m_nm"));
		System.out.println(params.get("email"));
		String id = iServiceFind_Idpw.findId(params);
		System.out.println(id);
		if(id != null) {
			ScriptUtils.alert(response, id);
		}else {
			ScriptUtils.alert(response, "입력한 값이 틀립니다.");
		}
		
		session.setAttribute("id",id);
		mav.setViewName("/find_idpw/find_idpw");
		return mav;
}
	
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public void findPwGET(ModelAndView mav) throws Exception{
		
		
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute MemberVO member , HttpServletResponse response) throws Exception{
		
		
		iServiceFind_Idpw.findPw(response, member);
	}
	
	
	
	/*
	 * @RequestMapping(value="/find_pws") public ModelAndView
	 * find_pws(HttpServletResponse response,ModelAndView mav,HttpSession
	 * session,@RequestParam HashMap<String,String> params) throws Throwable{
	 * System.out.println(params.get("m_nm"));
	 * System.out.println(params.get("m_id"));
	 * System.out.println(params.get("email")); String msg =""; String pw =
	 * iServiceFind_Idpw.find_pws(params); System.out.println(pw); if(pw != null) {
	 * mav.setViewName("/find_idpw/find_pw"); }else { msg = "잘못된정보입니다";
	 * mav.setViewName("/failed/failed"); }
	 * 
	 * session.setAttribute("pw",pw); mav.setViewName("/find_idpw/find_pw"); return
	 * mav; }
	 */
	
	/*
	 * @RequestMapping(value = "/findPws") public ModelAndView findPws(@RequestParam
	 * HashMap<String, String> params, ModelAndView mav) throws Throwable {
	 * 
	 * String m_pw = Utils.encryptAES128(params.get("m_pw")); params.put("pw",m_pw);
	 * 
	 * String cnt = iServiceFind_Idpw.updateM1(params); //xml
	 * 
	 * if (cnt != null) { mav.addObject("msg", "비밀번호가 변경되었습니다.");
	 * mav.setViewName("main_page/main_page"); } else { mav.addObject("msg",
	 * "등록중 문제가 발생했습니다."); mav.setViewName("failed/failed"); }
	 * 
	 * return mav; }
	 */

	
	
}
