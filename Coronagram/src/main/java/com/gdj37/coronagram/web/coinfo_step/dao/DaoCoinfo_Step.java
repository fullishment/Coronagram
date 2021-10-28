package com.gdj37.coronagram.web.coinfo_step.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Step implements IDaoCoinfo_Step {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getSteplist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("infostep.getSteplist", params);
	}

}
