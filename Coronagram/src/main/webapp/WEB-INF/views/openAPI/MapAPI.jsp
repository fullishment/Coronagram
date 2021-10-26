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
<!-- <script src="resources/script/openAPI/MapAPI.js"></script> -->  

<!-- map -->
<script src="resources/script/highcharts_map/highmaps.js"></script>
<script src="resources/script/highcharts_map/modules/data.js"></script>
<script src="resources/script/highcharts_map/modules/exporting.js"></script>
<script src="resources/script/highcharts_map/modules/offline-exporting.js"></script>
<script src="resources/script/highcharts_map/mapdata/world.js"></script>
<script>
/* var data = [{},{}]; */
/* var data = [{
	
	"z": 'natDefCnt',
	"d": 'natDeathCnt',
	"c": 'stdDay',	    //  "z" 하고 "code"는 있어야함
	"code": "JP"
}];  */ 

/*  var nation = {};
var data = [{},{}]; */
/* var data = [{
	"z": 100,
"d": 3,
"c": 2,
	"code": "KR"
},
{
	"z": 10000,
"d": 300,
"c": 2,
	"code": "JP"
}];
 */
 
 var dataArray =new Array();


$(document).ready(function() {
	
	getList();
	Highcharts.mapChart('container', {
	    chart: {
	        borderWidth: 1,
	        map: 'custom/world'
	    },
	
	    title: {
	        text: 'Coronamap'
	    },
	
	    subtitle: {
	        text: 'in world'
	    },
	
	    legend: {
	        enabled: false
	    },
	
	    mapNavigation: {
	        enabled: true,
	        buttonOptions: {
	            verticalAlign: 'bottom'
	        }
	    },
	
	    series: [{
	        name: 'Countries',
	        color: '#E0E0E0',
	        enableMouseTracking: false
	    }, {
	        type: 'mapbubble',
	        name: 'COVID-19',
	        joinBy: ['iso-a2', 'code'],
	        color: "#E00000",
	        data: dataArray,
	        minSize: 4,
	        maxSize: '4%',
	        tooltip: {
	            pointFormat: '{point.properties.name}: {point.z} people<br/> death : {point.d} people <br/> {point.사망자수}'
	        }
	    }]
	    
	   
	});
});

function getList(){
	$.ajax({
		type: 'POST', //통신 방식을 지정합니다
		url: "mapDataApiAjax", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawList(res)

		}
	});
	
}

function drawList(data) {
	var html = "";
	
	$(data).find('item').each(function(index, item){
			html += "<div>"
				//html += "<item>" + $(this).find('areaNm').text() + "</item>       "; //지역명        
				//html += "<item>" + $(this).find('areaNmEn').text() + "</item>     "; //지역명(영문)
				var data =  ({
					"z" : $(this).find('natDefCnt').text(),
					"d" : $(this).find('natDeathCnt').text(),
					"c" : 2,
					"code" : $(this).find('nationNmEn').text()
				});
				
				dataArray.put(data);
				console.log(data);
				//html += "<item>" + $(this).find('stdDay').text() + "</item>       "; //기준일시
				//html += "<item>" + $(this).find('nationNmEn').text() + "</item>   "; //국가명(영문)
				//html += "<item>" + $(this).find('natDefCnt').text() + "</item>    "; //국가별 확진자 수
				//html += "<item>" + $(this).find('natDeathCnt').text() + "</item>  "; //국가별 사망자 수
				
				//html += "<item>" + $(this).find('createDt').text() + "</item>     "; //등록일시분초
				//html += "<item>" + $(this).find('UPDATE_DT').text() + "</item>    "; //수정일시분초
			
				//html += "<item>" + $(this).find('resultCode').text() + "</item>     "; //결과코드
				//html += "<item>" + $(this).find('resultMsg').text() + "</item>     "; //결과메시지
				
				//html += "<item>" + $(this).find('natDeathRate').text() + "</item> "; //확진률 대비 사망률
				//html += "<item>" + $(this).find('nationNm').text() + "</item>     "; //국가명			
				//html += "<item>" + $(this).find('seq').text() + "</item>          "; //게시글번호(국외발생현황고유값)				
			
			
			
		});
		
		
		
	}
</script>

<style>
	#container{
		height: 90vh;  width: 90vw; /* min-width: 310px; max-width: 800px; */ margin: 0 auto;
	}
</style>
</head>
<body>	
<!-- api목록 -->
<!--  <div class="ㅋcon1"></div>   --> 
 <!-- 세계지도 -->
  <div id="container" ></div> 
</body>
</html>