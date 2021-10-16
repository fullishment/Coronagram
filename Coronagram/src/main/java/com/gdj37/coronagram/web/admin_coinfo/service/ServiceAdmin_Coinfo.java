package com.gdj37.coronagram.web.admin_coinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_coinfo.dao.IDaoAdmin_Coinfo;

@Service
public class ServiceAdmin_Coinfo implements IServiceAdmin_Coinfo {
	@Autowired
	public IDaoAdmin_Coinfo iDaoAdmin_Coinfo;

}
