package com.gdj37.coronagram.web.coronagram.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoronagram implements IDaoCoronagram{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crng.getPostList",params);
	}

}
