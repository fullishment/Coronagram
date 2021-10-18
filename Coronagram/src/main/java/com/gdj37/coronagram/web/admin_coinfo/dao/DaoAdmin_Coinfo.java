package com.gdj37.coronagram.web.admin_coinfo.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Coinfo implements IDaoAdmin_Coinfo {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int coinfoAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("coinfo.coinfoAdd", params);
	}

}
