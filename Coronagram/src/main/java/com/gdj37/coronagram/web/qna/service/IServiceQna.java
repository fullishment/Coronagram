package com.gdj37.coronagram.web.qna.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceQna {

	public List<HashMap<String, String>> getQnaList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getQna(HashMap<String, String> params)throws Throwable;

	public int qnaAdd(HashMap<String, String> params)throws Throwable;

	public int getQnaCnt(HashMap<String, String> params)throws Throwable;

}
