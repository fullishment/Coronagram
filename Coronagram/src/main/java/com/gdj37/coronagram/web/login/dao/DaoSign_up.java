package com.gdj37.coronagram.web.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoSign_up implements IDaoSign_up{
	@Autowired
	public SqlSession sqlSession;
}