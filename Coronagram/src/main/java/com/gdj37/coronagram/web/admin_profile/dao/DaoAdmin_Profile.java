package com.gdj37.coronagram.web.admin_profile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Profile implements IDaoAdmin_Profile{
	@Autowired
	public SqlSession sqlSession;
	
}
