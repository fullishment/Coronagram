package com.gdj37.coronagram.web.admin_chart.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Chart implements IDaoAdmin_Chart{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getGradeData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chart.getGradeData", params);
	}

	@Override
	public HashMap<String, String> getWeekData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chart.getWeekData", params);
	}

	@Override
	public HashMap<String, String> getAgeData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chart.getAgeData", params);
	}

	@Override
	public List<HashMap<String, Object>> getJoinData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("chart.getJoinData", params);
	}

	@Override
	public List<HashMap<String, Object>> getSellData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("chart.getSellData", params);
	}
}
