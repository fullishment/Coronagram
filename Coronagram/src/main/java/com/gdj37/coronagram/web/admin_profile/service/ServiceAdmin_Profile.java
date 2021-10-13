package com.gdj37.coronagram.web.admin_profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_profile.dao.IDaoAdmin_Profile;

@Service
public class ServiceAdmin_Profile implements IServiceAdmin_Profile{
	@Autowired
	public IDaoAdmin_Profile iDaoAdmin_Profile;
}
