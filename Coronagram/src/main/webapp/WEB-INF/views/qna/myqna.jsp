<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
    <link rel="stylesheet" href="resources/css/qna/menu_bar.css">
    <link rel="stylesheet" href="resources/css/qna/qna.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "qna");
		$("#actionForm").submit();
	});
});
</script>
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
     	<form action="#" id="actionForm" method="post">
		   <input type="hidden" name="no" value="${param.no}" />
		</form>
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>고객 센터</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-3" type="radio" name="tab" class="scm3" checked><label for="tab-3" class="tab"><p>내 문의내역</p></label>
                    <div class="sc-form">
                        <div class="scm3-htm">
                            <label for="user" class="sclabel"></label>
                            <div class="group">
                                <div class="qnaList">
                                    <div>
                                        <div class="scmL2">
                                            <div><p>제목 : ${data.TITLE}</p></div>
                                            <!-- <input type="text" class="scmL2T"> -->
                                            <div><p>질문 : ${data.CON}</p></div>
                                            <!-- <textarea cols="42" rows="13" class="scmL4"></textarea> -->
                                        </div>
                                    </div>
                                    <div class="scmL3">
                                        <div><p>답변내용 <br/>
                                         ${data.ANS_CON}</p></div>
                                        <!-- <textarea cols="42" rows="16" class="scmL3T"></textarea>  -->                                     
                                    </div>
                                    <div class="btn_area">
                                        <a href="qna"> <button type="button" class="list_btn">목록</button> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-form -->
        </div>
    </main>
        <script src="resources/script/qna/qna.js"></script>
    </body>
    
    </html>