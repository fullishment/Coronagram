package com.gdj37.coronagram.web.AdminUser.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdminUser implements IDaoAdminUser{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getadminUserCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminUser.getadminUserCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getadminUserList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("adminUser.getadminUserList", params);
	}

	@Override
	public HashMap<String, String> getAProfile(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminUser.getAProfile", params);
	}

	
	
	
}
