package com.gdj37.coronagram.web.calandar.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.calandar.dao.ICalendarDao;

@Service
public class CalendarService implements ICalendarService {
	@Autowired
	public ICalendarDao iCalendarDao;

	@Override
	public List<HashMap<String, Object>> getCalendarByDate(HashMap<String, String> params) throws Throwable {
		return iCalendarDao.getCalendarByDate(params);
	}


	@Override
	public HashMap<String, Object> insertSysdate(HashMap<String, Object> params) throws Throwable {
		
		return iCalendarDao.insertSysdate(params);
	}

	@Override
	public int getCalendarDateCheck(HashMap<String, String> params) throws Throwable {
		return iCalendarDao.getCalendarDateCheck(params);
	}


	
	  @Override 
	  public HashMap<String, String> getPoint(HashMap<String, String> params) throws Throwable {
		  return iCalendarDao.getPoint(params); 
	}
	 

	/*
	 * @Override public String getSysDate(HashMap<String, String> params) throws
	 * Throwable { return iCalendarDao.getSysDate(params); }
	 */
	/*
	 * @Override public List<HashMap<String, String>>
	 * getCalendarList(HashMap<String, String> params) throws Throwable { return
	 * iCalendarDao.getCalendarList(params); }
	 * 
	 * @Override public int insertCalendar(HashMap<String, String> params) throws
	 * Throwable { return iCalendarDao.insertCalendar(params); }
	 */

}
