package com.gdj37.coronagram.web.coronagram.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoCoronagram {

	public List<HashMap<String, String>> getPostList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getPostCmt(HashMap<String, String> params)throws Throwable;

}
