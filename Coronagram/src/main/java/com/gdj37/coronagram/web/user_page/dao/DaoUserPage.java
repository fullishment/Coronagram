package com.gdj37.coronagram.web.user_page.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoUserPage implements IDaoUserPage {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userPage.getMPostList",params);
	}

	@Override
	public int getLikeCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getLikeCnt",params);
	}

	@Override
	public int getCmtCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getCmtCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userPage.getMDtlList",params);
	}

	@Override
	public HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getIntroM",params);
	}


	@Override
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userPage.getModalCmt",params);
	}

	@Override
	public HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getModalM",params);
	}

	@Override
	public int getFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getFollow",params);
	}

	@Override
	public int getFollowing(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getFollowing",params);
	}

}
