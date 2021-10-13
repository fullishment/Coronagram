package com.gdj37.coronagram.web.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoLogin implements IDaoLogin {
	@Autowired
	public SqlSession sqlSession;
}
