<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<link href='resources/script/fullcalendar5/main.min.css'
	rel='stylesheet' />
<!-- <link rel="stylesheet" href="resources/css/admin_chart/3.3.4bootstrap.min.css" type="text/css"> -->
<link rel="stylesheet" type="text/css"
	href="resources/css/co_calendar/co_calendar.css?after">
<link rel="styleSheet" type="text/css"
	href="resources/css/menu_bar/menu_bar.css?after">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src='resources/script/fullcalendar5/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js'></script>
</head>
<body>
	<header>
		<div class="cm_menuBar" id="cm_menuBar">
			<div class="cm_menu__toggler">
				<span></span>
			</div>
			<a href="#" class="cm_logo" id="cm_logo">Coronagram</a> <a href="#"
				class="cm_home" id="cm_home">Home</a> <a href="#" class="cm_msg"
				id="cm_msg">Message</a> <a href="calendar" class="cm_cld"
				id="cm_cld">Calendar</a>
			<div class="cm_dropdown">
				<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
				<ul class="cm_dropdown-content">
					<li><a href="logout" class="cm_logout"><i
							class="cm_icon-logout"></i> <span>로그아웃</span> </a></li>
					<li><a href="#" class="cm_userinfo">개인정보수정</a></li>
			</div>
			<div class="cm_user_name">
				<c:if test="${!empty sMNo}">
							${sMNm}님 어서오세요.
						</c:if>
			</div>
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
	<main>
			<input type="hidden" name="m_no" id="m_no" value="${sMNo}" />
			<div class="calendar_wrap">
				<form action="#" id="calForm" method="post">
					<input type="hidden" name="m_no" id="m_no" value="${sMNo}" />
					<div id='calendar'>
					</div>
				</form>
			</div>
	</main>
	<script src="resources/script/co_calendar/co_calendar.js?after"></script>
	<script src="resources/script/menu_bar/menu_bar.js?after"></script>
</body>

<script type="text/javascript">
	
</script>

</html>