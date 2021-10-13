package com.gdj37.coronagram.web.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.login.dao.IDaoLogin;

@Service
public class ServiceLogin implements IServiceLogin{
	@Autowired
	public IDaoLogin iDaoLogin;

	@Override
	public HashMap<String, String> getMLogin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoLogin.getMLogin(params);
	}
}
