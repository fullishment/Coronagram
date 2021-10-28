package com.gdj37.coronagram.web.admin_main.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_main.dao.IDaoAdminMain;

@Service
public class ServiceAdminMain implements IServiceAdminMain{
	@Autowired
	public IDaoAdminMain iDaoAdminMain;

	@Override
	public HashMap<String, String> getadmin_main(HashMap<String, String> params) throws Throwable {
		return iDaoAdminMain.getadmin_main(params);
	}

	@Override
	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params) throws Throwable {
		return iDaoAdminMain.getadminQnaList(params);
	}

	@Override
	public HashMap<String, String> getNewQ(HashMap<String, String> params) throws Throwable {
		return iDaoAdminMain.getNewQ(params);
	}
}
