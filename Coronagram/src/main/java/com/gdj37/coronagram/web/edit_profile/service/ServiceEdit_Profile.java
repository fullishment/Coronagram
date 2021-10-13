package com.gdj37.coronagram.web.edit_profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.edit_profile.dao.IDaoEdit_Profile;

@Service
public class ServiceEdit_Profile implements IServiceEdit_Profile{
	@Autowired
	public IDaoEdit_Profile iDaoEdit_Profile;
}
