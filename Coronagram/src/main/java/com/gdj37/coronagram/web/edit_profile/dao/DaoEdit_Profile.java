package com.gdj37.coronagram.web.edit_profile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoEdit_Profile implements IDaoEdit_Profile{
	@Autowired
	public SqlSession sqlSession;
}
