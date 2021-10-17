package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoFind_Idpw implements IDaoFind_Idpw{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public String findId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("find_idpw.findId", params);
	}

	@Override
	public String find_pws(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("find_idpw.find_pws", params);
	}

	@Override
	public String updateM1(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("find_idpw.updateM1", params);
	}
	
	
	
	
}
