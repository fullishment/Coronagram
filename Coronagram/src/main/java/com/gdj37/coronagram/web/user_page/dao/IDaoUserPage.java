package com.gdj37.coronagram.web.user_page.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoUserPage {

	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getIntroM(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getModalM(HashMap<String, String> params)throws Throwable;
	
	public int getfollowEx2(HashMap<String, String> params)throws Throwable;
	
	public int delModalCmt(HashMap<String, String> params)throws Throwable;
	
	public int getHeartCnt(HashMap<String, String> params)throws Throwable;
	
	public int getfollowEx(HashMap<String, String> params)throws Throwable;
	
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

	public List<HashMap<String, String>> getReelsList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getLastRAcctNum(HashMap<String, String> params)throws Throwable;

	public int reelsAdds(HashMap<String, String> params)throws Throwable;

	public int reelsAcctAdd(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> reelsModal(HashMap<String, String> params)throws Throwable;

	public int reelsViewCnt(HashMap<String, String> params)throws Throwable;

	public int ReelsHeartChk(HashMap<String, String> params)throws Throwable;

	public int addReelsHeart(HashMap<String, String> params)throws Throwable;

	public int delReelsHeart(HashMap<String, String> params)throws Throwable;

	public int getReelsLk(HashMap<String, String> params)throws Throwable;
}
