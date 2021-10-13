package com.gdj37.coronagram.web.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.login.dao.IDaoFind_Idpw;
@Service
public class ServiceFind_Idpw implements IServiceFind_Idpw{
	@Autowired
	public IDaoFind_Idpw iDaoFind_Idpw;
}
