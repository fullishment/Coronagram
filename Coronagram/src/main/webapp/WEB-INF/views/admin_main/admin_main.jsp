<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/admin_main/admin_main.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</head>
<body>
<header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      <a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      <a href="#" class="cm_home" id="cm_home">Home</a>
      <a href="#" class="cm_msg" id="cm_msg">Message</a>
      <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      <div class="cm_dropdown">
        <a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        <ul class="cm_dropdown-content">
          <li>
            <a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
          </li>
          <li>
            <a href="#" class="cm_userinfo">개인정보수정</a>
          </li>
      </div>
	  	<div class="cm_user_name">
			<c:if test="${!empty sMNo}">
				${sMNm}님 어서오세요.
			</c:if>
		</div>
    </div>
    </div>
    <div class="cm_menu" id="cm_menu">
      <a href="#" class="cm_mLogo">Coronagram</a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_map"></div> Corona Map
        <ul class="cm_mcon" id="cm_mcon">
          <a href="#">국내</a> <br>
          <a href="#">해외</a>
        </ul>
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_info"></div>Corona Info
        <ul class="cm_mcon" id="cm_mcon">
          <a href="#">관련 정보</a> <br>
          <a href="#">거리두기</a> <br>
          <a href="#">News</a>
        </ul>
      </a>
      <a href="#" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="#">개인 페이지</a> <br>
          <a href="#">출석 체크</a> <br>
          <a href="#">Message</a>
        </ul>
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_qna"></div>Service Center
        <ul class="cm_mcon" id="cm_mcon">
          <a href="#">FAQ</a> <br>
          <a href="#">Q&A</a>
        </ul>
      </a>
    </div>
  </header>
<main>
    <div class="sc" id="sc">
    <div class="scHead" id="scHead">
        <div class="scName1" id="scName1">
            <h5><p>관리자 페이지</p></h5>
        </div>
        <div class="scName2" id="scTitle2">
            <h2><p>메인 페이지</p></h2>
        </div>
    </div>
    <article class="version">
        <section class="page-header">
          <h1 class="page-title">User</h1>
          <div class="button-group">
            <button type="button" class="btn btn-primary">+</button>
          </div>
        </section>
      </article>
      
      <article class="version">
        <section class="page-header">
          <h1 class="page-title">Chart</h1>
          <div class="button-group">
            <button type="button" class="btn btn-primary">+</button>
          </div>
        </section>
      </article>
      
      <article class="version">
        <section class="page-header">
          <h1 class="page-title">Coinfo</h1>
          <div class="button-group">
            <button type="button" class="btn btn-primary">+</button>
          </div>
        </section>
      </article>
      
      <article class="version">
        <section class="page-header">
          <h1 class="page-title">Shop</h1>
          <div class="button-group">
            <button type="button" class="btn btn-primary">+</button>
          </div>
        </section>
      </article>
      
      <article class="version">
        <section class="page-header">
          <h1 class="page-title">Q&A</h1>
          <div class="button-group">
            <button type="button" class="btn btn-primary">+</button>
          </div>
        </section>
      </article>
    </div>
</main>
	<script src="resources/script/admin_qna/admin_Qna.js"></script>
</body>
</html>