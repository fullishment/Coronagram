<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
var totCnt = 0;

var page = 1;
var maxP = 0;

$(document).ready(function () {
	
		getList();
		
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
				html += "<item>" + $(this).find('areaNm').text() + "</item>       ";
				html += "<item>" + $(this).find('areaNmEn').text() + "</item>     ";
				html += "<item>" + $(this).find('createDt').text() + "</item>     ";
				html += "<item>" + $(this).find('natDeathCnt').text() + "</item>  ";
				html += "<item>" + $(this).find('natDeathRate').text() + "</item> ";
				html += "<item>" + $(this).find('natDefCnt').text() + "</item>    ";
				html += "<item>" + $(this).find('nationNm').text() + "</item>     ";
				html += "<item>" + $(this).find('nationNmEn').text() + "</item>   ";
				html += "<item>" + $(this).find('seq').text() + "</item>          ";
				html += "<item>" + $(this).find('stdDay').text() + "</item>       ";
			html += "</div>"
			
		});
		$('.con1').html(html);
		
		drawPaging()
	}




function drawPaging(){
	
	var startPcount = 0;
	
	if(page % 10 == 0 ) {
		startPcount = page - 10 + 1;
	} else {
		startPcount = (Math.floor(page / 10) * 10) + 1;
	}

	var endPcount = 0;
	
	
	endPcount = startPcount + 10 - 1;
	
	if(endPcount >= maxP){
		endPcount = maxP;
	}
	
	var html = "";
	
	html += "<span page=\"1\">처음</span>     ";
	
	if($("#page").val() == "1"){
		html += "<span page=\"1\">이전</span>     ";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>   ";
	}
	// *1을 하면 자동 숫자변환
	
	for(var i = startPcount ; i <= endPcount ; i++){
		if($("#page").val() == i){
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
		} else {
			html += "<span page=\"" + i + "\">" + i + "</span>		  ";
		}
	}
	
	if($("#page").val() == maxP){
		html += "<span page=\"" + maxP + "\">다음</span>     ";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>     ";
	}
	
	html += "<span page=\"" + maxP + "\">마지막</span>   ";
	
	$(".paging_wrap").html(html);
}

	

</script>
</head>
<body>
<div class="con1"></div>
</body>
</html>