package com.gdj37.coronagram.web.user_page.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoUserPage {

	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getIntroM(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getModalM(HashMap<String, String> params)throws Throwable;
	
	public int getFollow(HashMap<String, String> params)throws Throwable;

	public int getFollowing(HashMap<String, String> params)throws Throwable;

	public int getHeartCnt(HashMap<String, String> params)throws Throwable;

	public int addHeart(HashMap<String, String> params)throws Throwable;

	public int delHeart(HashMap<String, String> params)throws Throwable;

	public int getLkCnt(HashMap<String, String> params)throws Throwable;

	public int getfollowEx(HashMap<String, String> params)throws Throwable;

	public int getfollowEx2(HashMap<String, String> params)throws Throwable;

}
