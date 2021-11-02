package com.gdj37.coronagram.web.admin_chart.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.web.admin_chart.service.IServiceAdmin_Chart;

@Controller
public class Admin_ChartController {

	@Autowired
	public IServiceAdmin_Chart  iServiceAdmin_Chart;
	
	@RequestMapping(value ="/admin_chart")
	public ModelAndView admin_chart(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String,String> data = iServiceAdmin_Chart.getGradeData(params);
		
		
		mav.addObject("data",data);
		mav.setViewName("admin_chart/admin_chart");
		
		return mav;
	}
	
	@RequestMapping(value ="/adminChartAjax", method = RequestMethod.POST )
	@ResponseBody
	public Map<String, Object> adminChartAjax(@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String,String> weekData = iServiceAdmin_Chart.getWeekData(params);
		HashMap<String,String> ageData = iServiceAdmin_Chart.getAgeData(params);
		List<HashMap<String, Object>> joinData = iServiceAdmin_Chart.getJoinData(params);
		List<HashMap<String, Object>> bestSellData = iServiceAdmin_Chart.getSellData(params);
		
		modelMap.put("bestSellData", bestSellData);
		modelMap.put("weekData", weekData);
		modelMap.put("ageData", ageData);
		modelMap.put("joinData", joinData);
		
		return modelMap;
	}
	@RequestMapping(value = "/chartApiAjax", method = RequestMethod.POST, produces = "test/xml;charset=UTF-8")
	@ResponseBody
	public String testApiAjax() throws Throwable{
		
		LocalDate now = LocalDate.now();

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");

		String today = now.format(dtf);
		
        StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=iwZFIlKLh4A5tfy0C89hfMwqm3%2Bfk8nR9HsfaLe%2FBP309oMxAJd2l796xiYG8em2N%2FlwQ%2B7YEETT87zAHSMHbw%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode("20200120", "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        return sb.toString();
	}
}