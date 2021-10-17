package com.gdj37.coronagram.web.admin_qna.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoAdmin_Qna {

	public int getadminQnaCnt(HashMap<String, String> params)throws Throwable;
	
	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getadminQna(HashMap<String, String> params)throws Throwable;

	public int getadminQnaUp(HashMap<String, String> params)throws Throwable;

	public int getadminQnaDel(HashMap<String, String> params)throws Throwable;
	
}
