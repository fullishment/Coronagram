package com.gdj37.coronagram.web.user_page.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoUserPage {

	List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable;

	int getFollowCnt(HashMap<String, String> params) throws Throwable;

	int getLikeCnt(HashMap<String, String> params) throws Throwable;

	int getCmtCnt(HashMap<String, String> params) throws Throwable;
	

	int getFollowingCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable;


}
