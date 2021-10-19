<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
  <link rel="stylesheet" href="resources/css/edit_profile/edit_profile.css">
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
   $("#updateBtn").on("click", function(){
      if($("#ocpw").val() != "") { //비밀번호를 변경할 경우
         if(checkVal("#ocpw")) { //기존 비밀번호 입력 여부
            alert("기존 비밀번호를 입력해 주세요.");
            $("#ocpw").focus();
         } else if($("#opw").val() == $("#ocpw").val()) { // 실 비밀번호와 입력된 기존비밀번호비교
            if(checkVal("#repw")) {
               alert("비밀번호 확인을 입력해 주세요.");
               $("#repw").focus();
            } else if($("#mPw").val() != $("#repw").val()) {
               alert("비밀번호 확인이 일치하지 않습니다.");
               $("#mPw").val("");
               $("#repw").val("");
               $("#mPw").focus();
            } else if(checkVal("#mNm")) {
               alert("이름을 입력해 주세요.");
               $("#mNm").focus();
            }else {
               var params = $("#updateForm").serialize();
               
               $.ajax({
                  url : "edit_profileUps",
                  type : "post",
                  dataType : "json",
                  data : params,
                  success : function(res){
                     if(res.result == "success"){
                        $("#backForm").submit();
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
         } else { // 비교 결과 같지 않은 경우
            alert("기존 비밀번호가 일치하지 않습니다.");
            $("#ocpw").val("");
            $("#ocpw").focus();
         }
      
      } else if(checkVal("#mNm")) {
         alert("이름을 입력해 주세요.");
         $("#mNm").focus();
      }
      
      else if(checkVal("#mPhone")){
         alert("전화번호를 입력하세요.");
         $("#Phone").focus();
      }
       else {
    	   if(!checkVal("#mPw") && checkVal("#ocpw") ){

   	       		alert("현재비밀번호를 입력해 주세요.");
   	       		$("#ocpw").focus();
    	   }
    	   else{
       		
         var params = $("#updateForm").serialize();
         
         $.ajax({
            url : "edit_profileUps",
            type : "post",
            dataType : "json",
            data : params,
            success : function(res){
               if(res.result == "success"){
                  $("#backForm").submit();
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
      }
   });
});
//공백함수
function checkVal(sel){
      if($.trim($(sel).val())==""){
         return true;
      }
      else{
         return false;
      }
   }

$("input:radio[name='vec']:radio[value='y']").attr("checked",true); 
$("input:radio[name='vec']").removeAttr("checked");
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
    <!-- 메뉴 -->
 
    
    
  </header>
  <main>
   <form action="main_page" id="backForm" method="post">
      <input type="hidden" name="no" value="${param.no}" />
   </form>
   
<div class="card">
   <form action="#" id="updateForm" method="post">
    <div class="input_area">
    <%-- <c:choose>		
			<c:when test="${!empty data.M_IMG}">
				<label for="photo-upload" class="custom-file-upload fas">
		        	<div class="img-wrap img-upload">
		          		<img for="photo-upload"  src="resources/images/edit_profile/edit_profile.png" /> <!-- 이미지그림 --> 
		        	</div>
		      	</label>
			</c:when>
			<c:otherwise>
				<label for="photo-upload" class="custom-file-upload fas">
		        	<div class="img-wrap img-upload">
		          		<img for="photo-upload" src="https://github.com/OlgaKoplik/CodePen/blob/master/profile.jpg?raw=true"/>
		        	</div>
		      	</label>
			</c:otherwise>
		</c:choose> --%>
      <label for="photo-upload" class="custom-file-upload fas">
        <div class="img-wrap img-upload">
          <img for="photo-upload"  src="resources/images/edit_profile/edit_profile.png" /> <!-- 이미지그림 --> 
        </div>
      </label>
   <input type="file" id="photo-upload" class="img-wrap img-upload"><br>
   <input type="hidden" id="no" name="no" value="${data.M_NO}">
   <input type="hidden" name="no" value="${param.M_NO}" />
   <input type="hidden" name="id" value="${param.M_ID}" />
         
      <p>이름</p>
      <input type="text" id="mNm" name="mNm" value="${data.M_NM}"><br>
      <p>닉네임</p>
      <input type="text" id="nickNm" name="nickNm" value="${data.NICK_NM}"><br>
      
      <input type="text" id="opw" value="${data.M_PW}" />
      
      <p>현재 비밀번호</p>
      <input type="password" id="ocpw" name="ocpw"><br>
      <p>변경 비밀번호</p>
      <input type="password" id="mPw" name="mPw"><br>
      <p>변경 비밀번호 확인</p>
      <input type="password" id="repw"><br>
      <p>번호</p>
      <input type="text" id="mPhone" name="mPhone" value="${data.PHONE}" onKeyup="inputTelNumber(this);" maxlength="13"><br>
      <p>이메일</p>
      <input type="text" id="email" name="email" value="${data.EMAIL}"><br>
      백신 접종 여부 <label><input type="radio" id="vac_y" name="vec" value="y" checked> 예</label>
                <label><input type="radio" id="vac_n" name="vec" value="n"> 아니오</label><br>
      <p>주소</p>
      <input type="text" id="cm_postcode" name="cm_postcode" class="post_num" value="${data.POST_NO}">
      <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
      <input type="text" id="cm_address" name="cm_address" value="${data.ADR}"><br>
      <input type="text" id="cm_detailAddress" name="cm_detailAddress" value="${data.DTL_ADR}"><br>
        
        </div>
    
    <button type="button" id="updateBtn" class="edit_btn">수정</button>
        <button type="button" id="cancelBtn" class="cancel_btn">취소</button>
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