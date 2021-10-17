package com.gdj37.coronagram.web.AdminUser.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceAdminUser {

	List<HashMap<String, String>> getUserList(HashMap<String, String> params)throws Throwable;

	public int getAuCnt(HashMap<String, String> params) throws Throwable;

	
}
