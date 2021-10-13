package com.gdj37.coronagram.web.main_page.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoMainPage implements IDaoMainPage{
	@Autowired
	public SqlSession sqlSession;
}
