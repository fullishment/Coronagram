package com.gdj37.coronagram.web.login.service;

import java.util.HashMap;

public interface IServiceSign_up {

	public int getMIdCheck(HashMap<String, String> params)throws Throwable;

	public int addSign(HashMap<String, String> params) throws Throwable;

	public int getNickCheck(HashMap<String, String> params) throws Throwable;

	public int crngSet(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> lastNum(HashMap<String, String> params)throws Throwable;
	

	

	
}
