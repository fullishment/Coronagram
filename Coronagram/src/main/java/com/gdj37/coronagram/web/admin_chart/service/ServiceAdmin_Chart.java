package com.gdj37.coronagram.web.admin_chart.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_chart.dao.IDaoAdmin_Chart;

@Service
public class ServiceAdmin_Chart implements IServiceAdmin_Chart{

	@Autowired
	public IDaoAdmin_Chart iDaoAdmin_Chart;

	@Override
	public HashMap<String, String> getGradeData(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Chart.getGradeData(params);
	}

	@Override
	public HashMap<String, String> getWeekData(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Chart.getWeekData(params);
	}

	@Override
	public HashMap<String, String> getAgeData(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Chart.getAgeData(params);
	}

	@Override
	public List<HashMap<String, Object>> getJoinData(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Chart.getJoinData(params);
	}

	@Override
	public List<HashMap<String, Object>> getSellData(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Chart.getSellData(params);
	}
}
