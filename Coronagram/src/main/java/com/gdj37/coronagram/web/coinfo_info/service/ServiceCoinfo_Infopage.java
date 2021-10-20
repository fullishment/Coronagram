package com.gdj37.coronagram.web.coinfo_info.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_info.dao.IDaoCoinfo_Infopage;

@Service
public class ServiceCoinfo_Infopage implements IServiceCoinfo_Infopage {
	@Autowired
	public IDaoCoinfo_Infopage iDaoCoinfo_Infopage;

	@Override
	public HashMap<String, String> getInfopage(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infopage.getInfopage(params);
	}

}
