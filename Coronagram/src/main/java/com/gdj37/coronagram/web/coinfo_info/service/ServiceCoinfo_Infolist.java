package com.gdj37.coronagram.web.coinfo_info.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_info.dao.IDaoCoinfo_Infolist;

@Service
public class ServiceCoinfo_Infolist implements IServiceCoinfo_Infolist {
	@Autowired
	public IDaoCoinfo_Infolist iDaoCoinfo_Infolist;

	@Override
	public List<HashMap<String, String>> getInfolist(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infolist.getInfolist(params);
	}

	@Override
	public HashMap<String, String> getInfopage(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infolist.getInfopage(params);
	}

	@Override
	public HashMap<String, String> getCoinfo(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infolist.getCoinfo(params);
	}

	@Override
	public int updateCoinfo(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infolist.updateCoinfo(params);
	}

	@Override
	public int deleteCoinfo(HashMap<String, String> params) throws Throwable {
		return iDaoCoinfo_Infolist.deleteCoinfo(params);
	}



}
