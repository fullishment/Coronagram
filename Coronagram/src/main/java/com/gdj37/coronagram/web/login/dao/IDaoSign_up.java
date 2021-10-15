package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

public interface IDaoSign_up {

	public int getMIdCheck(HashMap<String, String> params) throws Throwable;

	public int addSign(HashMap<String, String> params) throws Throwable;

	
}
