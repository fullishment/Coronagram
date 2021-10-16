package com.gdj37.coronagram.web.admin_qna.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceAdmin_Qna {

	public int getadminQnaCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getadminQna(HashMap<String, String> params)throws Throwable;

	public int getadminQnaUp(HashMap<String, String> params)throws Throwable;

}
