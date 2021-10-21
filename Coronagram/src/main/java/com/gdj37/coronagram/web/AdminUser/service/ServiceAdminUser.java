package com.gdj37.coronagram.web.AdminUser.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.AdminUser.dao.IDaoAdminUser;

@Service
public class ServiceAdminUser implements IServiceAdminUser{
	@Autowired
	public IDaoAdminUser iDaoAdminUser;

	@Override
	public int getadminUserCnt(HashMap<String, String> params) throws Throwable {
		return iDaoAdminUser.getadminUserCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getadminUserList(HashMap<String, String> params) throws Throwable {
		return iDaoAdminUser.getadminUserList(params);
	}

	@Override
	public HashMap<String, String> getAProfile(HashMap<String, String> params) throws Throwable {
		return iDaoAdminUser.getAProfile(params);
	}

	
	
	
}
