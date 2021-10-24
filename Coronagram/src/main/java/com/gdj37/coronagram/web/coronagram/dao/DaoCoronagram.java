package com.gdj37.coronagram.web.coronagram.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoronagram implements IDaoCoronagram{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crng.getPostList",params);
	}

	@Override
	public List<HashMap<String, String>> getPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crng.getPostCmt",params);
	}

	@Override
	public int aHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("crng.aHeart",params);
	}

	@Override
	public int dHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("crng.dHeart",params);
	}

	@Override
	public int getHeartChk(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("crng.getHeartChk",params);
	}

	@Override
	public int addPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("crng.addPostCmt",params);
	}

	@Override
	public List<HashMap<String, String>> getListFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crng.getListFollow",params);
	}

	@Override
	public List<HashMap<String, String>> getNotFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crng.getNotFollow",params);
	}

	@Override
	public int FollowAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("crng.FollowAdd",params);
	}
}
