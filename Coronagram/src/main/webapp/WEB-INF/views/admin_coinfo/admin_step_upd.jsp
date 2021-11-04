<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/admin_coinfo/admin_coinfo.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src = "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});

	$("#cancelBtnStep").on("click",function(){
		$("#backForm").submit();
	});
	
	$("#updateForm").on("keypress","input",function(event){
		if(event.keyCode==13){
			return false;
		}
	});
	
	
	$("#updateBtnStep").on("click",function(){	
		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if(checkVal("#step_no")){
			alert("단계를 입력해 주세요");
			$("#step_no").focus();
		}
		else if(checkVal("#con")){
			alert("내용을 입력해 주세요");
			$("#con").focus();
		}
		else{
			updateAjax();
		}
	});
});


function updateAjax(){
	//Ajax
	var params = $("#updateForm").serialize();

	$.ajax({
		url : "adminStepUpdAjax",
		type : "post",
		dataType : "json",
		data : params,
		success : function(res){
			if(res.result == "success"){
				$("#updateForm").attr("action","admin_coinfo_list");
				$("#updateForm").submit();
			} else if(res.result == "failed"){
				alert("수정에 실패하였습니다.");
			} else {
				alert("수정중 문제가 발생했습니다.");
			}
		},
		error : function(request, status, error){
			console.log(error);
		}
	});
}



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
        <div class="sc">
            <div class="scHead">
                <div>
                    <h4><i class="fas fa-user"></i> 관리자 페이지</h4>
                </div>
                <div>
                    <h2><p>코로나 정보 게시판</p></h2>
                </div>
            </div>
            <div>
                <div class="sc-html">
                    <input id="tab-2" type="radio" name="tab" class="scm2" checked>
                    <label for="tab-2" class="tab">단계 변경</label>
                    <div class="sc-form">
                        
                        
                        <div class="scm2-htm">
                            <label for="user" class="sclabel">
                                <p>거리두기 정보 단계 관리</p>
                            </label>
                            <div class="group">
                            

								<form action="admin_coinfo_list" id="backForm" method="post">
									<input type="hidden" name="mgt_no" value="${param.mgt_no}" />
								</form>
								
	                           	<form action="#" id="updateForm" method="post">
	                            	<input type="hidden" name="m_no" value="${sMNo}">
	                           		<input type="hidden" name="mgt_no" value="${param.mgt_no}" />
		                               
		                                
	                                <div class="QnaTitle" id="">
	                                    <div>
	                                        <span>지역</span>
	                                        <div class="border1">${data.AREA_NM}</div> 
	                                    </div>
	                                    <div>
	                                        <span>단계</span><input type="text" class="border" id="step_no" name="step_no" value="${data.STEP_NO}">
	                                    </div>
	                                </div>
	                                
	                                <div class="qnaMain">
	                                    <div>
	                                        <p>내용</p><textarea class="QCI" type="text" id="con" name="con">${data.CON}</textarea>
	                                    </div>
	                                </div>
	                                
	                              </form> 
	                                        
	                              <div class="qnaBtn">
                             		<input type="button" id="updateBtnStep" class="updateBtnStep" value="수정" />
                             		<input type="button" id="cancelBtnStep" class="cancelBtnStep" value="취소" />
                                 </div>
                                 
                             </div>
                         </div>
                     </div>
                 </div><!-- sc-form -->
             </div><!-- sc-html -->
         </div> <!-- sc-form -->
            
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>