package com.gdj37.coronagram.web.calandar.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao implements ICalendarDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, Object>> getCalendarByDate(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cal.getCalendarbyDate", params);
	}


	@Override
	public HashMap<String, Object> insertSysdate( HashMap<String, Object> params) throws Throwable {
		sqlSession.insert("cal.insertSysdate", params);
		HashMap<String, Object> resultMap = params;
		
		return params;
	}

	@Override
	public int getCalendarDateCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cal.getCalendarDateCheck", params);
	}


	@Override
	public HashMap<String, String> getPoint(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cal.getPoint", params);
	}

	/*
	 * @Override public String getSysDate(HashMap<String, String> params) throws
	 * Throwable { return sqlSession.selectOne("cal.getSysDate", params); }
	 *
	 * @Override public List<HashMap<String, String>>
	 * getCalendarList(HashMap<String, String> params) throws Throwable { return
	 * sqlSession.selectList("cal.getCalendarList", params); }
	 * 
	 * @Override public int insertCalendar(HashMap<String, String> params) throws
	 * Throwable { return sqlSession.insert("cal.insertCalendar", params); }
	 */

}
