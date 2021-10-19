<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/coinfo_news/coinfo_news.css?after">
<link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var totCnt = 0;

var page = 1;
var maxP = 0;

$(document).ready(function() {

	getList();
	$(".paging_wrap").on("click","span",function(){
		page=$(this).attr("page");

		getList();
	});
});

function getList() {
	$.ajax({
	    type:"GET",
	    url:"https://api.odcloud.kr/api/15069309/v1/uddi:d2dba5c8-9ee5-45e3-aabf-98d95f0374fe?page=" + page + "&perPage=10&serviceKey=pdbFQpTLYSE6kbg9mPcwLcT8UNGIwIXgJXzx43scUwQ3to1K4WXvqL8mjztO%2BOdVkhKTgcwDByeMphPXizH7Bg%3D%3D",
	    dataType: "json",
	    success: function(res){
	    	maxP = res.totalCount / 10;
	    	if(res.totalCount % 10 > 0) {
	    		maxP++;
	    	}
	    	drawList(res.data)
	      
	    }
	 });
}

function drawList(list) {
	 var html = ""
   //for(var i = list.length-1; i >= 0 ;i--){
     for(var i = 0; i < list.length ;i++){
			html += "<tr><td class=\"t1\">" + "<a href =\"" + list[i]['주소'] + "\">" + list[i]['제목'] + "</a>" + "</td></tr>";
			html += "<tr><td class=\"t2\">" + list[i]['일자'] + "</td></tr>";
			html += "<tr><td class=\"t3\">" + list[i]['본문'] + "</td></tr";
			html += "<tr><td class=\"t4\"></td></tr>";
		}
		
     $(".tr1").html(html);
     
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
	
	html += "<span page=\"1\"><p>&nbsp<<&nbsp</p></span>     ";
	
	if(page == 1){
		html += "<span page=\"1\"><p><&nbsp이전&nbsp</p></span>     ";
	} else {
		html += "<span page=\"" + (page * 1 - 1) + "\"><p><&nbsp이전&nbsp</p></span>   ";
	}
	// *1을 하면 자동 숫자변환
	
	for(var i = startPcount ; i <= endPcount ; i++){
		if(page == i){
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>" ;
		} else {
			html += "<span page=\"" + i + "\"><h3>" + i + "</h3></span>		  ";
		}
	}
	
	if(page == maxP){
		html += "<span page=\"" + maxP + "\"><p>다음&nbsp>&nbsp</p></span>     ";
	} else {
		html += "<span page=\"" + (page * 1 + 1) + "\"><p>다음&nbsp>&nbsp</p></span>     ";
	}
	
	html += "<span page=\"" + maxP + "\"><p>&nbsp>>&nbsp</p></span>   ";
	
	$(".paging_wrap").html(html);
}


</script>
</head>
<body>
<form action="#" id="actionForm">
	<input type="hidden" name="page" id="page"/>
</form>
	<header>
		<div class="cm_menuBar" id="cm_menuBar">
			<div class="cm_menu__toggler">
				<span></span>
			</div>
			<a href="#" class="cm_logo" id="cm_logo">Coronagram</a> <a href="#"
				class="cm_home" id="cm_home">Home</a> <a href="#" class="cm_msg"
				id="cm_msg">Message</a> <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
			<div class="cm_dropdown">
				<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
				<ul class="cm_dropdown-content">
					<li><a href="#" class="cm_logout"><i
							class="cm_icon-logout"></i> <span>로그아웃</span> </a></li>
					<li><a href="#" class="cm_userinfo">개인정보수정</a></li>
			</div>
		<div class="cm_user_name">
	       <c:if test="${!empty sMNo}">
	          ${sMNm}님 어서오세요.
	       </c:if>
	    </div>

		</div>
		<div class="cm_menu" id="cm_menu">
			<a href="#" class="cm_mLogo">Coronagram</a> <a href="#"
				class="cm_mTitle" id="cm_mTitle">
				<div class="cm_map"></div> Corona Map
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">국내</a>
					<br>
					<a href="#">해외</a>
				</ul>
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_info"></div>Corona Info
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">관련 정보</a>
					<br>
					<a href="#">거리두기</a>
					<br>
					<a href="#">News</a>
				</ul>
			</a> <a href="#" class="cm_sTitle">
				<div class="cm_cam"></div>Coronagram
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_user"></div>My Page
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">개인 페이지</a>
					<br>
					<a href="#">출석 체크</a>
					<br>
					<a href="#">Message</a>
				</ul>
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_qna"></div>Service Center
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">FAQ</a>
					<br>
					<a href="#">Q&A</a>
				</ul>
			</a>
		</div>
	</header>

	<!-- 메인 -->
	<main>
		<div class="sc" id="sc">
			<div class="sc_head" id="sc_head">
				<div class="sc_name1" id="sc_name1">
					<h5>Corona info</h5>
				</div>
				<div class="sc_name2" id="sc_name2">
					<h2>코로나 뉴스</h2>
				</div>
			</div>
			<!-- scHead -->
			<div class="sc_main">
				<div class="group">
					<div>
						<table>
							<thead>
								<tr>
								</tr>
							</thead>
							<tbody>
								<tr class="tr1"></tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="paging_wrap"></div>
			<!-- scMain -->
		</div>
		<!-- sc -->
		<script src="resources/script/coinfo_news/coinfo_news.js"></script>
		<script src="resources/script/menu_bar/menu_bar.js"></script>
	</main>
</body>
</html>