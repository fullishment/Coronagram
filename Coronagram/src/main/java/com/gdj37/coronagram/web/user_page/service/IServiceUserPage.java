package com.gdj37.coronagram.web.user_page.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceUserPage {

	List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable;

	int getFollowCnt(HashMap<String, String> params) throws Throwable;

	int getLikeCnt(HashMap<String, String> params) throws Throwable;

	int getCmtCnt(HashMap<String, String> params) throws Throwable;
	

	int getFollowingCnt(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable;

}
