package com.gdj37.coronagram.web.user_page.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.user_page.dao.IDaoUserPage;

@Service
public class ServiceUserPage implements IServiceUserPage{
	@Autowired
	public IDaoUserPage iDaoUserPage;

	@Override
	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getMPostList(params);
	}

	@Override
	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getMDtlList(params);
	}
	
	@Override
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getModalCmt(params);
	}
	
	@Override
	public HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getIntroM(params);
	}

	@Override
	public HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getModalM(params);
	}

	@Override
	public int getfollowEx2(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getfollowEx2(params);
	}
	
	@Override
	public int getfollowEx(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getfollowEx(params);
	}

	@Override
	public int getHeartCnt(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getHeartCnt(params);
	}	

	@Override
	public int delModalCmt(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.delModalCmt(params);
	}

	@Override
	public int addFollow(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.addFollow(params);
	}

	@Override
	public int delFollow(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.delFollow(params);
	}


	@Override
	public int addHeart(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.addHeart(params);
	}

	@Override
	public int delHeart(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.delHeart(params);
	}

	@Override
	public int getLkCnt(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getLkCnt(params);
	}	

	@Override
	public int addMCmt(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.addMCmt(params);
	}

	@Override
	public int delPost(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.delPost(params);
	}

	@Override
	public List<HashMap<String, String>> getVideoList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getVideoList(params);
	}

	@Override
	public List<HashMap<String, String>> getEmojiList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getEmojiList(params);
	}

	@Override
	public HashMap<String, String> getLastSAcctNum(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getLastSAcctNum(params);
	}

	@Override
	public int storyAdd(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.storyAdd(params);
	}

	@Override
	public int storyAcctAdd(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.storyAcctAdd(params);
	}

	@Override
	public List<HashMap<String, String>> getStoryList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getStoryList(params);
	}

	@Override
	public HashMap<String, String> getStoryMList(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getStoryMList(params);
	}

	@Override
	public List<HashMap<String, String>> getfollowEvent(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getfollowEvent(params);
	}

	@Override
	public List<HashMap<String, String>> getfollowerEvent(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.getfollowerEvent(params);
	}

	@Override
	public int FollowMAdd(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.FollowMAdd(params);
	}

	@Override
	public int FollowMDel(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.FollowMDel(params);
	}

	@Override
	public List<HashMap<String, String>> SearchUser(HashMap<String, String> params) throws Throwable {
		return iDaoUserPage.SearchUser(params);
	}
}
