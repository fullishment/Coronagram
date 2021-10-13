package com.gdj37.coronagram.web.main_page.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.main_page.dao.IDaoMainPage;

@Service
public class ServiceMainPage implements IServiceMainPage{
	@Autowired
	public IDaoMainPage iDaoMainPage;
}
