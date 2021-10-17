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
	public List<HashMap<String, String>> getUserList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoAdminUser.getUserList(params);
	}

	@Override
	public int getAuCnt(HashMap<String, String> params) throws Throwable {
		return iDaoAdminUser.getAuCnt(params);
	}
	
	
}
