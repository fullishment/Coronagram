package com.gdj37.coronagram.web.coronagram.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coronagram.dao.IDaoCoronagram;

@Service
public class ServiceCoronagram implements IServiceCoronagram{
	@Autowired
	public IDaoCoronagram iDaoCoronagrma;

	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getPostList(params);
	}

}
