package com.gdj37.coronagram.web.coinfo_main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Main implements IDaoCoinfo_Main {
	@Autowired
	public SqlSession sqlSession;

}
