package com.gdj37.coronagram.web.shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.shop.dao.IDaoShop;

@Service
public class ServiceShop implements IServiceShop{
	@Autowired
	public IDaoShop iDaoShop;

	@Override
	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getProdList(params);
	}
}
