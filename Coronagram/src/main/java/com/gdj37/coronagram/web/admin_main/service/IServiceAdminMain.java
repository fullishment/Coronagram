package com.gdj37.coronagram.web.admin_main.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceAdminMain {
	
	public HashMap<String, String> getadmin_main(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getNewQ(HashMap<String, String> params)throws Throwable;
}
