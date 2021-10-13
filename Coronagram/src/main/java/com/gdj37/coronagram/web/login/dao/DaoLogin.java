package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoLogin implements IDaoLogin {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getMLogin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.getMLogin",params);
	}
}
