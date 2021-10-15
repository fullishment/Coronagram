package com.gdj37.coronagram.web.coinfo_main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_main.dao.IDaoCoinfo_Main;

@Service
public class ServiceCoinfo_Main implements IServiceCoinfo_Main {
	@Autowired
	public IDaoCoinfo_Main iDaoCoinfo_Main;

}
