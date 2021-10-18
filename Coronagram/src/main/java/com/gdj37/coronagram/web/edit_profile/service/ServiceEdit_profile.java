package com.gdj37.coronagram.web.edit_profile.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.edit_profile.dao.IDaoEdit_profile;

@Service
public class ServiceEdit_profile implements IServiceEdit_profile {
	@Autowired
	public IDaoEdit_profile iDaoEdit_profile;

	@Override
	public List<HashMap<String, String>> getedit_profileList(HashMap<String, String> params) throws Throwable {
		return iDaoEdit_profile.getedit_profileList(params);
	}

	@Override
	public int getprofileIdCheck(HashMap<String, String> params) throws Throwable {
		return iDaoEdit_profile.getprofileIdCheck(params);
	}

	@Override
	public HashMap<String, String> getedit_profile(HashMap<String, String> params) throws Throwable {
		return iDaoEdit_profile.getedit_profile(params);
	}

	@Override
	public int getprofileUp(HashMap<String, String> params) throws Throwable {
		return iDaoEdit_profile.getprofileUp(params);
	}
	
}
