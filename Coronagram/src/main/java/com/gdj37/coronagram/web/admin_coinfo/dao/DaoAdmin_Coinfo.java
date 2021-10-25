package com.gdj37.coronagram.web.admin_coinfo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Coinfo implements IDaoAdmin_Coinfo {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int coinfoAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("adminfo.admIAdd", params);
	}

	@Override
	public int getAdinfoCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminfo.getAdinfoCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAdinfoList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("adminfo.getAdinfoList", params);
	}

	@Override
	public HashMap<String, String> getAdinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("adminfo.getAdinfo", params);
	}

	@Override
	public int updateAdinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("adminfo.updateAdinfo", params);
	}

	@Override
	public int deleteAdinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("adminfo.deleteAdinfo", params);
	}

}
