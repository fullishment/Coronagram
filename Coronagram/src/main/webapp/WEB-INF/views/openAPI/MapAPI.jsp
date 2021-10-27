<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		
<!-- API불러오기 -->
<script src="resources/script/openAPI/MapAPI.js"></script>

<!-- map -->
<script src="resources/script/highcharts_map/highmaps.js"></script>
<script src="resources/script/highcharts_map/modules/data.js"></script>
<script src="resources/script/highcharts_map/modules/exporting.js"></script>
<script src="resources/script/highcharts_map/modules/offline-exporting.js"></script>
<script src="resources/script/highcharts_map/mapdata/world.js"></script>


<style>
	#container{
		height: 90vh;  width: 90vw; /* min-width: 310px; max-width: 800px; */ margin: 0 auto;
	}
</style>
</head>
<body>	
<!-- api목록 -->
<!-- <div class="con1"></div> -->
 <!-- 세계지도 -->
   <div id="container" ></div> 
</body>
</html>