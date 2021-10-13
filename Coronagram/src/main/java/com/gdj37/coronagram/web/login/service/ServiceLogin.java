package com.gdj37.coronagram.web.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.login.dao.IDaoLogin;

@Service
public class ServiceLogin implements IServiceLogin{
	@Autowired
	public IDaoLogin iDaoLogin;
}
