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
	public List<HashMap<String, String>> getUserList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminUser.getUserList", params);
	}

	@Override
	public int getAuCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminUser.getAuCnt", params);
	}
	
	
}
