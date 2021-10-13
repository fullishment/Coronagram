package com.gdj37.coronagram.web.shop.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceShop {

	List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable;

}
