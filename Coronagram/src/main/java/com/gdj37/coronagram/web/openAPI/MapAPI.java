package com.gdj37.coronagram.web.openAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapAPI {
	@RequestMapping(value = "/MapAPI")
	public ModelAndView mapApi(ModelAndView mav) {

		mav.setViewName("openAPI/MapAPI");

		return mav;
	}

	@RequestMapping(value = "/mapDataApiAjax", method = RequestMethod.POST, produces = "text/xml;charset=UTF-8")
	@ResponseBody
	public String mapDataApiAjax() throws Throwable {
		LocalDate now = LocalDate.now();
		LocalDate yday = LocalDate.now().minusDays(2);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");

		String today = now.format(dtf);
		String yesterday = yday.format(dtf);

		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=dPFKtwA%2FNRWi9trbdTVxhgHsxZjtvoz141kUi%2FJLLK9W6SI5zUdd07FWlLpKDzrw8rrmSqFPzOBmaHjiCr3fYA%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		// urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" +
		// URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		// urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" +
		// URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		
		  urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8"));
		/* 검색할 생성일 범위의 시작 */
		  urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8"));
		 
		/* 검색할 생성일 범위의 종료 */

		// 오늘 날짜로 나오게
		/*
		 * urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" +
		 * URLEncoder.encode(today, "UTF-8")); 검색할 생성일 범위의 시작 urlBuilder.append("&"
		 * +URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today,
		 * "UTF-8")); 검색할 생성일 범위의 종료
		 */

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		System.out.println("URL: " + urlBuilder.toString());
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
