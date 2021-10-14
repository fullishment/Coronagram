package com.gdj37.coronagram.web.coinfo_info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_info.dao.IDaoCoinfo_Infolist;

@Service
public class ServiceCoinfo_Infolist implements IServiceCoinfo_Infolist {
	@Autowired
	public IDaoCoinfo_Infolist iDaoCoinfo_Infolist;

}
