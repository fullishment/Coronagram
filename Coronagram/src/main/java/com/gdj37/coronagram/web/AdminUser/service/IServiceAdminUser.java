package com.gdj37.coronagram.web.AdminUser.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceAdminUser {

	public int getadminUserCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getadminUserList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getAProfile(HashMap<String, String> params)throws Throwable;

	public int getAProUps(HashMap<String, String> params)throws Throwable;

	public int getAProDels(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getACCTList(HashMap<String, String> params)throws Throwable;

	public int AcrngSetting(HashMap<String, String> params) throws Throwable;
	
}
