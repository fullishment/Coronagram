package com.gdj37.coronagram.web.admin_main.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdminMain implements IDaoAdminMain{
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public HashMap<String, String> getadmin_main(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminMain.getAdminM", params);
	}

	@Override
	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("adminMain.getadminQnaList", params);
	}

	@Override
	public HashMap<String, String> getNewQ(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminMain.getNewQ", params);
	}
}
