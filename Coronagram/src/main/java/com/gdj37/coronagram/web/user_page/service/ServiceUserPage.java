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
		// TODO Auto-generated method stub
		return iDaoUserPage.getMPostList(params);
	}

	@Override
	public int getFollowCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getFollowCnt(params);
	}

	@Override
	public int getLikeCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getLikeCnt(params);
	}

	@Override
	public int getCmtCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getCmtCnt(params);
	}


	@Override
	public int getFollowingCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getFollowingCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getMDtlList(params);
	}

	@Override
	public HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getIntroM(params);
	}

	@Override
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getModalCmt(params);
	}

	@Override
	public HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoUserPage.getModalM(params);
	}
	
	
}
