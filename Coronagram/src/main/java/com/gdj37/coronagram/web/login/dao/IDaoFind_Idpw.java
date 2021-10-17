package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

public interface IDaoFind_Idpw {
	
	public String findId(HashMap<String, String> params) throws Throwable;
	
	public String find_pws(HashMap<String, String> params) throws Throwable;

	public String updateM1(HashMap<String, String> params) throws Throwable;
}
