<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/coinfo_infopage/coinfo_infopage.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#backBtn").on("click", function() {
			$("#actionForm").attr("action", "coinfo_infolist");
			$("#actionForm").submit();
		}); 
		
		$("#rewindBtn").on("click", function() {
			$("#actionForm").attr("action", "coinfo_main");
			$("#actionForm").submit();
		}); 

/* 		//1.글수정
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "coinfo_update");
			$("#actionForm").submit();
		});
		
		$("#deleteBtn").on("click", function() {
			if(confirm("삭제하시겠습니까?")) {
				$("#actionForm").attr("action", "coinfo_delete");
				$("#actionForm").submit();
			}
		}); */
	});
	</script>
</head>

<body>
    <!-- 주석 -->
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
   


    <!-- 메인 -->
    <!-- partial:index.partial.html -->
    <main>
        <form action="#" id="actionForm" method="post">
			<input type="hidden" name="no" id="no" <%-- value="${param.INFO_NO}" --%> />						
		</form>
        <div class="header">
            <div class="header-banner">
                <h1>${data.INFO_TITLE}</h1>
                <div class="header-subtitle">
                    <h5>${data.INFO_SUBHD}</h5>
                </div>
            </div>
            <div class="clear"></div>
            <nav>
                <div class="site-title">${data.INFO_TITLE}</div>
                <ul class="title_btn_group">
                    <li><button type="button" value="rewindBtn" id="rewindBtn" class="title_btn" >
                    		<img src="resources/images/coinfo/coinfo_infopage/rewind.png" 
                    			 style="width:15px; height:15px;">
                    		<span>Info메인</span></button></li>
                    <li><button type="button" value="backBtn" id="backBtn" class="title_btn" >
                    		<img src="resources/images/coinfo/coinfo_infopage/back.png" 
                    			 style="width:15px; height:15px">
                    		<span>Info목록</span></button></li>
                </ul>
            </nav>
        </div>
        <div class="main">
            <section class="content">
            	<article>  	
	
            		<c:if test="${!empty data.REP_IMG}">
						<img alt="" src="resources/upload/${data.REP_IMG}" /><br/>
					</c:if>

      				<div class="atc_con" style="white-space:pre-line;">${data.CON}</div>
      				
      				<div class="atc_date">게시일자 ( ${data.DT} )</div>

            	</article>
            	<section class="footer">
            	<input value="top_button" type="image" src="resources/images/coinfo/coinfo_infopage/up-arrow.png" style="width:35px; height:35px" onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
				</section>            
            </section>
            	
<%--             <section class="footer">
	         	<c:if test="${acctNo == 6}">
 	               	<input type="button" value="수정" id="updateBtn"/>
					<input type="button" value="삭제" id="deleteBtn"/>
	             </c:if>
	         </section>	 --%>

            
			<%-- <div class="infoimg" id="infoimg">
            		<c:if test="${!empty data.rep_img}">
						<img src="resources/images/coinfo/coinfo_infopage/${data.rep_img}">
            		</c:if>
            --%>

        </div>
    </main>
    <!-- partial -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="resources/script/coinfo_infopage/coinfo_infopage.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>

</body>

</html>