package com.gdj37.coronagram.web.login.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.gdj37.coronagram.web.login.VO.MemberVO;

public interface IServiceFind_Idpw {

	public String findId(HashMap<String, String> params) throws Throwable;
	
	/*
	 * public String find_pws(HashMap<String, String> params) throws Throwable; //
	 * public String updateM1(HashMap<String, String> params)throws Throwable;
	 */
 //이메일 발송
	public void sendEmail(MemberVO vo, String div) throws Exception;
 //비밀번호 찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;
	
}
