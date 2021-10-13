package com.gdj37.coronagram.web.coronagram.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoronagram implements IDaoCoronagram{
	@Autowired
	public SqlSession sqlSession;
}
