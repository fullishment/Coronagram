package com.gdj37.coronagram.web.calandar.dao;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

public interface ICalendarDao {

public List<HashMap<String, Object>> getCalendarByDate(HashMap<String, String> params) throws Throwable;

public HashMap<String,Object> insertSysdate(HashMap<String, Object> params) throws Throwable;

public int getCalendarDateCheck(HashMap<String, String> params) throws Throwable;

public HashMap<String, String> getPoint(HashMap<String, String> params) throws Throwable;
  
}
/*public String getSysDate(HashMap<String, String> params) throws Throwable;
  public List<HashMap<String, String>> getCalendarList(HashMap<String, String>
  params)throws Throwable;
  
  public int insertCalendar(HashMap<String, String> params)throws Throwable;
 
}*/
