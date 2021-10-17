package com.gdj37.coronagram.web.login.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

public interface IServiceFind_Idpw {

	public String findId(HashMap<String, String> params) throws Throwable;
	
	public String find_pws(HashMap<String, String> params) throws Throwable;

	public String updateM1(HashMap<String, String> params)throws Throwable;


}
