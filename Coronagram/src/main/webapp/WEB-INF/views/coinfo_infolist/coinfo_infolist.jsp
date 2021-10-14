<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>co_news_main</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
  <link rel="stylesheet" href="../../resources/css/coinfo_infolist/coinfo_infolist.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
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
                    <a href="#" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
                </li>
                <li>
                    <a href="#" class="cm_userinfo">개인정보수정</a>
                </li>
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


  <!-- main -->

    <div class="slider-container">
      <div class="slider-control left inactive"></div>
      <div class="slider-control right"></div>
      <ul class="slider-pagi"></ul>
      <div class="slider">
        <div class="slide slide-0 active">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 1</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-1 ">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 2</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-2">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 3</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-3">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 4</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- partial -->
  <script src="../../resources/script/coinfo_infolist/coinfo_infolist.js"></script> <!-- script -->
</body>

</html>