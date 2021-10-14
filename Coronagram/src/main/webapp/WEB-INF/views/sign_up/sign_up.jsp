<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/sign_up/sign_up.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
  <!-- partial:index.partial.html -->
  <div class="box-form">
    <div class="left">
      <div class="overlay">
        <h1>Coronagram</h1>
        <p>이곳은 회원가입 페이지 입니다.<br> 정보를 입력하시고 Sign Up버튼을 눌러주세요.</p>
      </div>
    </div>
    <div class="right">
      
      <form action="#" method="post">
        <div class="inputs">
          <p class="r_title"><b>Sign Up</b></p>
          <span class="title_Name">아이디</span><br>
          <input type="text" placeholder="아이디를 입력하세요">
          <p class="idchk">중복되지 않은 아이디 입니다.</p>
          <span class="title_Name">이름</span><br>
          <input type="text" placeholder="이름을 입력하세요"><br>
          <span class="title_Name">닉네임</span><br>
          <input type="text" placeholder="닉네임을 입력하세요"><br>
          <span class="title_Name">패스워드</span><br>
          <input type="password" placeholder="패스워드를 입력하세요"><br>
          <span class="title_Name">패스워드 확인</span><br>
          <input type="password" placeholder="패스워드를 확인하세요"><br>
          <span class="title_Name">휴대폰 번호</span><br>
          <input type="text" placeholder="번호를 입력하세요"><br>
          <span class="title_Name">이메일</span><br>
          <input type="email" placeholder="이메일을 입력하세요"><br>
          <div class="birth">
            <span>생년월일</span><br>
            <select name="yy" id="year"></select>년
            <select name="mm" id="month"></select>월
            <select name="dd" id="day"></select>일<br>
            <span class="title_Name">주소</span><br>
            <input type="text" id="cm_postcode" class="post_num" placeholder="우편번호">
            <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
            <input type="text" id="cm_address" placeholder="주소"><br>
            <input type="text" id="cm_detailAddress" placeholder="상세주소"><br>  
          </div>
          <button class="add_btn">가입</button>
          <button class="cancel_btn">취소</button>
        </div>
      </form>
      <br>
    </div>
  </div>
  <!-- partial -->
  <script src="resources/script/sign_up/sign_up.js"></script>
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
                document.getElementById("cm_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("cm_extraAddress").value = '';
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