package com.gdj37.coronagram.web.login.service;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.login.dao.IDaoFind_Idpw;
@Service
public class ServiceFind_Idpw implements IServiceFind_Idpw{
	@Autowired
	public IDaoFind_Idpw iDaoFind_Idpw;

	
	@Override
	public String findId(HashMap<String, String> params) throws Throwable {
		return iDaoFind_Idpw.findId(params);
	}
	
	@Override
	public String find_pws(HashMap<String, String> params) throws Throwable {
		return iDaoFind_Idpw.find_pws(params);
	}

	@Override
	public String updateM1(HashMap<String, String> params) throws Throwable {
		return iDaoFind_Idpw.updateM1(params);
	}
	
}
