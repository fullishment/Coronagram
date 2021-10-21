package com.gdj37.coronagram.web.coinfo_info.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoCoinfo_Infolist {

	public List<HashMap<String, String>> getInfolist(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getInfopage(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCoinfo(HashMap<String, String> params) throws Throwable;

	public int updateCoinfo(HashMap<String, String> params) throws Throwable;

	public int deleteCoinfo(HashMap<String, String> params) throws Throwable;

}
