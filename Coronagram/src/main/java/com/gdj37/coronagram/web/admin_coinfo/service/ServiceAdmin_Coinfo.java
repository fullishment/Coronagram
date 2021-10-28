package com.gdj37.coronagram.web.admin_coinfo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_coinfo.dao.IDaoAdmin_Coinfo;

@Service
public class ServiceAdmin_Coinfo implements IServiceAdmin_Coinfo {
	@Autowired
	public IDaoAdmin_Coinfo iDaoAdmin_Coinfo;

	@Override
	public int coinfoAdd(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.coinfoAdd(params);
	}

	@Override
	public int getAdinfoCnt(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.getAdinfoCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAdinfoList(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.getAdinfoList(params);
	}

	@Override
	public HashMap<String, String> getAdinfo(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.getAdinfo(params);
	}

	@Override
	public int updateAdinfo(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.updateAdinfo(params);
	}

	@Override
	public int deleteAdinfo(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.deleteAdinfo(params);
	}

	@Override
	public List<HashMap<String, String>> getSTList(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.getSTList(params);
	}

	@Override
	public HashMap<String, String> getSTinfo(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.getSTinfo(params);
	}

	@Override
	public int updateSTinfo(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Coinfo.updateSTinfo(params);
	}

}
