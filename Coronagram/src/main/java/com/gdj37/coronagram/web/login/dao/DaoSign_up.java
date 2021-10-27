package com.gdj37.coronagram.web.login.dao;



import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoSign_up implements IDaoSign_up{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getMIdCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("signup.getMIdCheck", params);
	}

	@Override
	public int addSign(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("signup.addSign", params);
	}

	@Override
	public int getNickCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("signup.getNickCheck", params);
	}

	@Override
	public int crngSet(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("signup.crngSet", params);
	}

	@Override
	public HashMap<String, String> lastNum(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("signup.lastNum", params);
	}

}