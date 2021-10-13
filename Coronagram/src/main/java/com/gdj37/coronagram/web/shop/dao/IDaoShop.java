package com.gdj37.coronagram.web.shop.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoShop {

	List<HashMap<String, String>> getProdList(HashMap<String, String> params)throws Throwable;

}
