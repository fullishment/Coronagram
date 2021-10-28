package com.gdj37.coronagram.web.admin_coinfo.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoAdmin_Coinfo {

	public int coinfoAdd(HashMap<String, String> params) throws Throwable;

	public int getAdinfoCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAdinfoList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAdinfo(HashMap<String, String> params) throws Throwable;

	public int updateAdinfo(HashMap<String, String> params) throws Throwable;

	public int deleteAdinfo(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSTList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSTinfo(HashMap<String, String> params) throws Throwable;

	public int updateSTinfo(HashMap<String, String> params) throws Throwable;

}
