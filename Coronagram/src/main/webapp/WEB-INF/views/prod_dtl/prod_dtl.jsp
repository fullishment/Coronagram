<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/prod_dtl/prod_dtl.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript">
    </script>
    
</head>

<body>
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
    <!-- 메인 -->
    <main>
        <div class="wrapper">
            <div class="mainContent">
                <div class="firstCont">
                    <div class="thumbsCont">
                        <ul class="thumbs" id="imgBox">
                            
                        </ul>
                    </div>
                </div>
                <div class="leftCont">
                    <div class="imagesCont">
                        <div class="mainImageCont">
                            <img id="mainImage" src="resources/upload/${data.FILE_ADDR}" alt=""> 
                        </div>
                    </div>
                </div>
                <div class="rightCont">
                    <div class="detailsCont">
                        <div class="dtl">
                            <!--이름 -->
                            <div class="dtl_title">
                                <h1> ${data.PROD_NM}</h1>
                            </div>
                            <div class="dtl_text">
                                <p>${data.CON}</p>
                            </div>
                        </div>
                        <br>
                        <div class="price"><!--가격 -->
                            <div class="price1"><p>판매가</p></div>
                            <div class="price2"><p><span>${data.POINT}</span> P</p></div>
                        </div>
                        <br>
                        <div class="dtl_option"><!--옵션 -->
                            <div class="dtl_color">
                            </div>
                            <!-- <div class="dtl_cnt">
                                <div class="cnt_L"><p>수량</p></div>
                                <div class="cnt_R">
                                    <span class="qt-minus">-</span>
                                    <span class="qt" id ="qt">1</span>
                                    <span class="qt-plus">+</span>
                                </div>
                            </div> -->
                        </div>
                        <br>
                        <div class="gbn"></div>
                        <br>
                        <div class="full_price"><!--총 가격 -->
                            <div class="price1"><p>총금액</p></div>
                            <div class="price2"><p ><span id="total">${data.POINT}</span> P</p></div>
                        </div>
                        <br>
                        <div class="gbn"></div>
                        <br>
                        <form action="#" id="addForm">
                        	<input type="hidden" name="prodNo" id="prodNo" value="${data.PROD_NO}">
                        	<input type="hidden" name="price" id="priceInp">
                        	<input type="hidden" name="unit" id="unitInp">
                        	<input type="hidden" name="sMNo" id="sMNo" value="${sMNo}">
                        	<input type="hidden" name="qt" id="qtInp">             
                        </form>
                        <div class="otherLinksCont">
                        	
                        	 <c:choose>
                        	<c:when test="${!empty sMNo}">
                        		<ul class="otherLinks">
                               	<li class="btn_L" id="cartBtn"><a href="#"><p>장바구니 담기</p></a></li>
                            </ul>
                            </c:when>
	                        <c:otherwise>
		                           	<p id="noticelogin"> 로그인 이후 구매 가능합니다</p>
	                        </c:otherwise>
                        	</c:choose> 
                        </div>
                    </div>
                </div>
                </div>
                </div>
    </main>
   	<script src="resources/script/prod_dtl/prod_dtl.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>