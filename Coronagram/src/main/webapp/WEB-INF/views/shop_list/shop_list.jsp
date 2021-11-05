<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
<link rel="stylesheet" href="resources/css/shop_list/shop_list.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



<header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      	<a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      	<c:choose>
      		<c:when test="${acctNo eq 6}">
      			<a href="admin_main" class="cm_admin" id="cm_admin">AdminPage</a>
      		</c:when>
      		<c:otherwise>
      			
      		</c:otherwise>
      	</c:choose>
      	<a href="#" class="cm_home" id="cm_home">Home</a>
      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      	<div class="cm_dropdown">
        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        	<ul class="cm_dropdown-content">
	          	<li>
	            	<c:choose >
	          			<c:when test="${empty sMNo}">
	            			<a href="login" class="cm_logIn"><i class="cm_icon-logIn"></i> <span>로그인</span> </a>
	            		</c:when>
	            	<c:otherwise>
	            			<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
	            	</c:otherwise>
	            	
	            	</c:choose>
	          	</li>
	          	<li>
	          		<c:choose>
	          			<c:when test="${empty sMNo}">
	            		</c:when>
	            		<c:otherwise>
	            			<a href="coronagram/${sMNick}" class="cm_userinfo">마이페이지</a>
	            		</c:otherwise>
	            	</c:choose>
	          	</li>
          	</ul>
        </div>
      	<div class="cm_user_name">
			<c:if test="${!empty sMNo}">
				${sMNm}님 어서오세요.
			</c:if>
		</div>
    </div>
    <div class="cm_menu" id="cm_menu">
      <a href="#" class="cm_mLogo">Coronagram</a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_map"></div> Corona Map
        <ul class="cm_mcon" id="cm_mcon">
          <a href="http://localhost:3000">국내</a> <br>
          <a href="MapAPI">해외</a>
        </ul>
      </a>
      <a href="coinfo_main" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_info"></div>Corona Info
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coinfo_infolist">관련 정보</a> <br>
          <a href="coinfo_step">거리두기</a> <br>
          <a href="coinfo_news">News</a>
        </ul>
      </a>
      <a href="coronagram" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coronagram/${sMNick}">개인 페이지</a> <br>
          <a href="calendar">출석 체크</a> <br>
          <a href="https://coronagram-zoom.herokuapp.com/">Zoom</a>
        </ul>
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_qna"></div>Service Center
        <ul class="cm_mcon" id="cm_mcon">
          <a href="qna">Q&A</a><br>
        </ul>
      </a>
    </div>
  </header>

<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="searchGbn" id="searchGbn" value="${param.searchGbn}" /> 
			<input type="hidden" name="searchTxt" id="searchTxt" value="${param.searchTxt}" /> 
			<input type="hidden" name="prodNo" id="no" value="" />
	</form>
	<main>
		<div class="searchCon">
			<h1>상품 리스트</h1>
			<div class="searchbox">
				<select id="searchGbnInp" name="searchGbnInp">
					<option value="0">상품번호</option>
					<option value="1">카테고리명</option>
					<option value="2">상품명</option>
					<option value="3">판매상태</option>
				</select> <input type="text" id="searchInp" value="${param.searchGbn}" /> <input
					type="button" value="등록" class="add_btn" id="addBtn" />
				<button class="find_btn" id="findBtn">검색</button>
			</div>
		</div>
		<div class="con1">
			<table class="user_box">

				<thead>
					<tr class="thList">
						<th class="th-1">상품번호</th>
						<th class="th-2">등록자 이름</th>
						<th class="th-3">카테고리명</th>
						<th class="th-4">상품명</th>
						<th class="th-5">가격</th>
						<th class="th-6">판매상태</th>
						<th class="th-7">등록일</th>
						<th class="th-8">수정</th>
					</tr>
				</thead>
				<tbody>

				</tbody>

			</table>
		</div>
	</main>
	 <script src="resources/script/menu_bar/menu_bar.js"></script>
	 <script src="resources/script/shop_list/shop_list.js"></script>
</body>

</html>