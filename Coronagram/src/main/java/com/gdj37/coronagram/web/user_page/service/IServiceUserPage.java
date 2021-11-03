package com.gdj37.coronagram.web.user_page.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceUserPage {

	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable;
     
	public HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable;
     
	public HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable;	
	
	public int getfollowEx2(HashMap<String, String> params)throws Throwable;
	
	public int getfollowEx(HashMap<String, String> params)throws Throwable;	
	
	public int getHeartCnt(HashMap<String, String> params)throws Throwable;
	
	public int delModalCmt(HashMap<String, String> params)throws Throwable;
	
	public int addFollow(HashMap<String, String> params)throws Throwable;

	public int delFollow(HashMap<String, String> params)throws Throwable;

	public int addHeart(HashMap<String, String> params)throws Throwable;

	public int delHeart(HashMap<String, String> params)throws Throwable;

	public int getLkCnt(HashMap<String, String> params)throws Throwable;	

	public int addMCmt(HashMap<String, String> params)throws Throwable;

	public int delPost(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getVideoList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getEmojiList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getLastSAcctNum(HashMap<String, String> params)throws Throwable;

	public int storyAdd(HashMap<String, String> params)throws Throwable;

	public int storyAcctAdd(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getStoryList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getStoryMList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getfollowEvent(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getfollowerEvent(HashMap<String, String> params)throws Throwable;

	public int FollowMAdd(HashMap<String, String> params)throws Throwable;

	public int FollowMDel(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> SearchUser(HashMap<String, String> params)throws Throwable;
}
