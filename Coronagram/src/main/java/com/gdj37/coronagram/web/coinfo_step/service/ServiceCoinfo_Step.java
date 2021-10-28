package com.gdj37.coronagram.web.coinfo_step.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_step.dao.IDaoCoinfo_Step;

@Service
public class ServiceCoinfo_Step implements IServiceCoinfo_Step {
	@Autowired
	public IDaoCoinfo_Step iDaoCoinfo_Step;

	@Override
	public List<HashMap<String, String>> getSteplist(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Step.getSteplist(params);
	}
}
