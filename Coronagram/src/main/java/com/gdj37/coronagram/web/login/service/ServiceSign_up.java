package com.gdj37.coronagram.web.login.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.login.dao.IDaoSign_up;

@Service
public class ServiceSign_up implements IServiceSign_up{
	@Autowired
	public IDaoSign_up iDaoSign_up;

	@Override
	public int getMIdCheck(HashMap<String, String> params) throws Throwable {
		return iDaoSign_up.getMIdCheck(params);
	}

	@Override
	public int addSign(HashMap<String, String> params) throws Throwable {
		return iDaoSign_up.addSign(params);
	}

	@Override
	public int getNickCheck(HashMap<String, String> params) throws Throwable {
		return iDaoSign_up.getNickCheck(params);
	}

	@Override
	public int crngSet(HashMap<String, String> params) throws Throwable {
		return iDaoSign_up.crngSet(params);
	}

	@Override
	public HashMap<String, String> lastNum(HashMap<String, String> params) throws Throwable {
		return iDaoSign_up.lastNum(params);
	}

	



	

}
