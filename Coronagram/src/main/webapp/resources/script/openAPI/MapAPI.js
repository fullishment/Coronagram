var data = [];



 var dataArray =new Array();
var index=0;

$(document).ready(function() {
	getList();
	
});

function getList(){
	$.ajax({
		type: 'POST', //통신 방식을 지정합니다
		url: "mapDataApiAjax", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawList(res);
		}
	});
	
}
function findCode(name){
	for(var i=0; i<allCountry.length;i++){
		if(allCountry[i].name == name){
			return allCountry[i].code;
		}
	}
}
function drawList(z) {
	//var html = "";
	
	$(z).find('item').each(function(index, item){
			//html += "<div>"
				//html += "<item>" + $(this).find('areaNm').text() + "</item>       "; //지역명        
				//html += "<item>" + $(this).find('areaNmEn').text() + "</item>     "; //지역명(영문)
				//var index = findCode($(this).find('nationNmEn').text());
				 var tmp =  {
					"z" : parseInt($(this).find('natDefCnt').text()),
					"d" : parseInt($(this).find('natDeathCnt').text()),
					"c" : 2,
					"name" : $(this).find('nationNmEn').text(),
					"date" : $(this).find('stdDay').text()
				}; 
				
			
				
				data[index]=tmp;
				index++;
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
				//html+="</div>"
			
			
		});
		
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
		        joinBy: ['name', 'name'],
		        color: "#E00000",
		        data: data,
		        minSize: 8,
		        maxSize: '15%',
		        tooltip: {
		            pointFormat: ' {point.name} <br/> 총확진자 : {point.z} 명<br/> 사망자 : {point.d} 명 <br/> 날짜 : {point.date}'
		        }
		    }]
		    
		   
		}); 
		
		
	}