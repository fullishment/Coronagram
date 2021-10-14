package com.gdj37.coronagram.web.qna.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoQna {

	public List<HashMap<String, String>> getQnaList(HashMap<String, String> params) throws Throwable;

}
