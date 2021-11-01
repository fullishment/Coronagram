package com.gdj37.coronagram.web.admin_chart.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceAdmin_Chart {

	public HashMap<String, String> getGradeData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getWeekData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAgeData(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, Object>> getJoinData(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, Object>> getSellData(HashMap<String, String> params) throws Throwable;

}
