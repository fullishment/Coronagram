package com.gdj37.coronagram.web.coinfo_news.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_News implements IDaoCoinfo_News {

	@Autowired
	public SqlSession sqlSession;
}
