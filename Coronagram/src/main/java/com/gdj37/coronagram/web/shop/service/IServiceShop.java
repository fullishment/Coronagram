package com.gdj37.coronagram.web.shop.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceShop {

	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getProd(HashMap<String, String> params)throws Throwable;

	public int addOpt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getOptList(HashMap<String, String> params)throws Throwable;

}
