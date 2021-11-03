package com.gdj37.coronagram.web.main_page.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.main_page.service.IServiceMainPage;

@Controller
public class main_page {
	@Autowired
	public IServiceMainPage iServiceMainPage;
	
	@RequestMapping(value="/main")
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("main_page/main_page");
		return mav;
	}
	
	@RequestMapping(value = "/weekDataAjax", method = RequestMethod.POST, produces = "test/xml;charset=UTF-8")
	@ResponseBody
	public String testApiAjax() throws Throwable{
		
		LocalTime nowTime = LocalTime.now();
		LocalTime limitTime = LocalTime.of(9, 59, 59);
		LocalDate now = LocalDate.now();
		LocalDate nowm = now.minusDays(1);
		LocalDate weekDays = now.minusDays(7);
		LocalDate weekDaysm = now.minusDays(8);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		String today = now.format(dtf);
		String todaym = nowm.format(dtf);
		
		String before6 = weekDays.format(dtf);
		String before7 = weekDaysm.format(dtf);
		
		
        StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=iwZFIlKLh4A5tfy0C89hfMwqm3%2Bfk8nR9HsfaLe%2FBP309oMxAJd2l796xiYG8em2N%2FlwQ%2B7YEETT87zAHSMHbw%3D%3D"); /*Service Key*/
        if(nowTime.isBefore(limitTime)) {
        	urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(before7, "UTF-8")); /*검색할 생성일 범위의 시작*/
        }else {
        	urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(before6, "UTF-8")); /*검색할 생성일 범위의 시작*/
        }
        if(nowTime.isBefore(limitTime)) {
        	urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(todaym, "UTF-8")); /*검색할 생성일 범위의 종료*/
        }else {
        	urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8")); /*검색할 생성일 범위의 종료*/
        	
        }
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
