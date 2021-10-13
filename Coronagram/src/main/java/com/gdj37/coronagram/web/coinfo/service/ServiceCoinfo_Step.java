package com.gdj37.coronagram.web.coinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo.dao.IDaoCoinfo_Step;

@Service
public class ServiceCoinfo_Step implements IServiceCoinfo_Step {
	@Autowired
	public IDaoCoinfo_Step iDaoCoinfo_Step;
}
