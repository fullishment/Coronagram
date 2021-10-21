package com.gdj37.coronagram.web.AdminUser.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoAdminUser {

	public int getadminUserCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getadminUserList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAProfile(HashMap<String, String> params) throws Throwable;

	

}
