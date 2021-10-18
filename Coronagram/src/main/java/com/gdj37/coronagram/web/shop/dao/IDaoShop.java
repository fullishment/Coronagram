package com.gdj37.coronagram.web.shop.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoShop {

	public List<HashMap<String, String>> getProdList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getProd(HashMap<String, String> params)throws Throwable;

	public int addOpt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getOptList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getProdImgList(HashMap<String, String> params)throws Throwable;

	public int addCart(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCartList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCartCnt(HashMap<String, String> params)throws Throwable;

	public int cartDel(Integer integer)throws Throwable;

	public int addOrder(HashMap<String, String> params)throws Throwable;

}
