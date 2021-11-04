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
<style>
	
</style>
    <link rel="stylesheet" href="resources/css/qna/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/admin_qna/admin_qna.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});
	$("#updateForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){
			return false;
		}
	});
//수정 버튼
	$("#updateBtn").on("click", function(){
		if(checkVal("#ansCon")) {
			alert("답변해 주세요.");
			$("#ansCon").focus();
		}else {
			var params = $("#updateForm").serialize();
			
			$.ajax({
				url : "admin_qna_updates",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "success"){
						$("#backForm").submit();
					} else if(res.result == "failed"){
						alert("답변에 실패하였습니다.");
					} else {
						alert("답변중 문제가 발생했습니다.");
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}
	});
//삭제 버튼
	$("#deleteBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			$.ajax({
				url: "admin_qna_deletes",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					if(res.result== "success"){
						location.href="admin_qna";
					}
					else if(res.result== "failed"){
						alert("삭제에 실패하였습니다.");
					}else{
						alert("삭제중 문제가 발생했습니다.");
					}
				},
				error:function(request,status,error){
					console.log(error);
				}
			});
		}					
	});
});
function checkVal(sel){
	if($.trim($(sel).val())==""){
		return true;
	}
	else{
		return false;
	}
}
</script>
</head>
<body>
  <header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      	<a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      	<a href="#" class="cm_home" id="cm_home">Home</a>
      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      	<div class="cm_dropdown">
        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        	<ul class="cm_dropdown-content">
	          	<li>
	            	<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
	          	</li>
	          	<li>
	            	<a href="coronagram/${sMNick}" class="cm_userinfo"> 개인정보수정</a>
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
          <a href="qna">FAA</a><br>
        </ul>
      </a>
    </div>
  </header>
    <main>
    <div>
       	<form action="admin_qna" id="backForm" method="post">
			<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
			<input type="hidden" name="page" value="${param.page}" />
			<input type="hidden" name="no" value="${param.no}" />
		</form>
	</div>
	<div>
		<form action="admin_qna" id="actionForm" method="post">
			<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
			<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
			<input type="hidden" name="page" value="${param.page}" />
			<input type="hidden" name="no" value="${param.no}" />
		</form>
	</div>
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <i class="fas fa-user"></i><h4><p>관리자 페이지</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-2" type="radio" name="tab" class="scm2" checked><label for="tab-2" class="tab"><p>Q&A관리</p></label>
                    <div class="sc-form">
                        <div class="scm2-htm">
                            <label for="user" class="sclabel"><p>1:1 질문 관리</p></label>
                            <div class="group">
	                               <form action="#" id="updateForm" method="post">
	                                <div>
	                                    <div class="scmL2">
	                                    	<input type="hidden" id="no" name="no" value="${data.QNA_NO}" disabled>
	                                    	<input type="hidden" name="no" value="${data.QNA_NO}">
	                                        <div><p>제목</p></div>
											<div id="title" class="scmL2T"><p>${data.TITLE}</p></div>
	                                        <div><p>질문</p></div>
	                                        <div id="con" class="scmL4"><p>${data.CON}</p></div>
	                                    </div>
	                                </div>
	                                <div class="scmL3">
	                                    <div><p>답변하기</p></div> <br>
		                                <textarea id="ansCon" name="ansCon" cols="42" rows="16" class="scmL3T" value="${data.ANS_CON}">${data.ANS_CON}</textarea>
		                             </div>
		                             
		                             	<div class="btnForm">
		                             		<button  type="button" class="add_btn" id="updateBtn">답변</button>
		                             		<button  type="button" class="del_btn" id="deleteBtn">삭제</button>
		                                	<a href="javascript:window.history.back()"><button type="button" class="cancel_btn" id="backForm">목록</button></a>
		                                </div>
		                            </form>
							</div> <!-- group -->
						</div><!-- scm2-htm -->
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-wrap -->
        </div> <!-- sc -->
    </main>
    	<script src="resources/script/menu_bar/menu_bar.js"></script>
        <script src="resources/script/admin_qna/admin_Qna.js"></script>
    </body>
    
    </html>