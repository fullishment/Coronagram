package com.gdj37.coronagram.web.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoFind_Idpw implements IDaoFind_Idpw{
	@Autowired
	public SqlSession sqlSession;
}
