<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>coinfo_menu</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="resources/css/coinfo_main/coinfo_main.css?after">

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>


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
    <!-- partial:index.partial.html -->
    <div class="container" id="container">
      <section class="background">
        <div class="content-wrapper">
          <p class="content-title">코로나 관련정보</p>
          <p class="content-subtitle">Scroll Down</p>
          <div id="mouse-scroll">
            <div class="mouse">
              <div class="mouse-in"></div>
            </div>
            <div>
              <span class="down-scroll down-arrow-1"></span>
              <span class="down-scroll down-arrow-2"></span>
              <span class="down-scroll down-arrow-3"></span>
            </div>
          </div>
          <button class="link_btn" onclick="location.href='coinfo_infolist'">move to</button>
        </div>
      </section>
      <section class="background">
        <div class="content-wrapper">
          <p class="content-title">거리두기 단계 현황</p>
          <p class="content-subtitle">Scroll Down or Up</p>
          <button class="link_btn"  onclick="location.href='coinfo_step'"">move to</button>
          <div id="mouse-scroll">
            <div class="mouse">
              <div class="mouse-in"></div>
            </div>
            <div>
              <span class="down-scroll down-arrow-1"></span>
              <span class="down-scroll down-arrow-2"></span>
              <span class="down-scroll down-arrow-3"></span>
            </div>
          </div>
        </div>
      </section>
      <section class="background">
        <div class="content-wrapper">
          <p class="content-title">Corona News</p>
          <p class="content-subtitle">Scroll Up</p>
          <div id="mouse-scroll">
            <div class="up_mouse">
              <div class="mouse-in"></div>
            </div>
            <div>
              <span class="up-scroll up-arrow-1"></span>
              <span class="up-scroll up-arrow-2"></span>
              <span class="up-scroll up-arrow-3"></span>
            </div>
          </div>
          <button class="link_btn"  onclick="location.href='coinfo_news'">move to</button>
        </div>
      </section>
    </div>
    <!-- partial -->
    <script src="resources/script/menu_bar/menu_bar.js"></script>
    <script src="resources/script/coinfo_main/coinfo_main.js"></script>
  </main>

</body>

</html>