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

	@Override
	public int getHeartCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getHeartCnt",params);
	}

	@Override
	public int addHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("userPage.addHeart",params);
	}

	@Override
	public int delHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("userPage.delHeart",params);
	}

	@Override
	public int getLkCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getLkCnt",params);
	}

	@Override
	public int getfollowEx(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getfollowEx",params);
	}

	@Override
	public int getfollowEx2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userPage.getfollowEx2",params);
	}

	@Override
	public int addFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("userPage.addFollow",params);
	}

	@Override
	public int delFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("userPage.delFollow",params);
	}

	@Override
	public int addMCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("userPage.addMCmt",params);
	}

	@Override
	public int delModalCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("userPage.delModalCmt",params);
	}

	@Override
	public int delPost(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("userPage.delPost",params);
	}
}
