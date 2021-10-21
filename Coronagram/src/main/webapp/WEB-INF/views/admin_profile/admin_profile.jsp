<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - React Profile Card with image upload</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
  <link rel="stylesheet" href="resources/css/admin_profile/admin_profile.css">
  <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
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
<form action="main" id="backForm" method="post">
      <input type="hidden" name="no" value="${param.no}" />
</form>
<div class="card">
  <form>
    <div class="input_area">
      <label for="photo-upload" class="custom-file-upload fas">
        <div class="img-wrap img-upload">
          <img for="photo-upload" src="https://github.com/OlgaKoplik/CodePen/blob/master/profile.jpg?raw=true"/>
        </div>
      </label>
      <form action="#" id="actionForm" method="post">
		   <input type="hidden" name="searchGbn" value="${param.searchGbn }" />
		   <input type="hidden" name="searchTxt"  value="${param.searchTxt}" />
		   <input type="hidden" name="page" value="${param.page}"  />
		   <input type="hidden" name="no" value="${param.no}" />
	  
	  
    <input type="file" id="photo-upload" class="img-wrap img-upload"><br>
    <input type="hidden" name="id">
      <p>ID</p>
      <input type="text" value="${data.M_ID}"><br>
      <p>이름</p>
      <input type="text" id="mNm" name="mNm" value="${data.M_NM}"><br>
      <p>닉네임</p>
      <input type="text" id="nickNm" name="nickNm" value="${data.NICK_NM}"><br>
       <p>전화번호</p>
      <input type="text" id="mPhone" name="mPhone" value="${data.PHONE}" onKeyup="inputTelNumber(this);" maxlength="13"><br>
      <p>이메일</p>
      <input type="text" id="email" name="email" value="${data.EMAIL}"><br>
      백신 접종 여부 <label><input type="radio" name="vec" value="y"> 예</label>
      <label><input type="radio" name="vec" value="n"> 아니오</label><br>
      <p>주소</p>
      <input type="text" id="cm_postcode" name="cm_postcode" class="post_num" value="${data.POST_NO}">
      <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
      <input type="text" id="cm_address" name="cm_address" value="${data.ADR}"><br>
      <input type="text" id="cm_detailAddress" name="cm_detailAddress" value="${data.DTL_ADR}"><br>mPhone
<!-- 회원등급 -->
      <span class="title_Name">회원등급</span><br>
      <select class="user_tier" name="user_tier" >
        <option value="Bronze">Bronze</option>
        <option value="Sliver">Sliver</option>
        <option value="Gold ">Gold </option>
        <option value="Platinum ">Platinum </option>
        <option value="Diamond ">Diamond </option>
      </select>
      <br>
<!-- 포인트 -->
      <span>포인트</span> <br>
      <input type="text" class="point_con" value="${data.POINT}">P<br>
      
        <button type="button" id="updateBtn" class="edit_btn">수정</button>
        <!-- <button type="button" id="deleteBtn" class="delete_Btn">삭제</button> -->
        <button type="button" id="cancelBtn" class="cancel_btn">취소</button>
        </form>
       </div>
    </form>
</div>
</main>
<script src="resources/script/menu_bar/menu_bar.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>
function cm_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("cm_detailAddress").value = extraAddr;
            
            } else {
                document.getElementById("cm_detailAddress").value = '';
            }

            document.getElementById('cm_postcode').value = data.zonecode;
            document.getElementById("cm_address").value = addr;
            document.getElementById("cm_detailAddress").focus();
        } 
    }).open();
}
</script>
</body>
</html>
