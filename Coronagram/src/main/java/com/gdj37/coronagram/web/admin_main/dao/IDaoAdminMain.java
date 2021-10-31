package com.gdj37.coronagram.web.admin_main.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoAdminMain {

	public HashMap<String, String> getadmin_main(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getNewQ(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getAdinfoList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getShopList(HashMap<String, String> params)throws Throwable;

}
