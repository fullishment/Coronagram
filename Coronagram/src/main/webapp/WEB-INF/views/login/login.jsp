<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>CodePen - Responsive Login Form</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/login/login.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#loginBtn").on("click",function(){
			if(checkVal("#m_id")){
				alert("아이디를 입력해 주세요.")
				$("#m_id").focus();
			}else if(checkVal("#m_pw")){
				alert("비밀번호를 입력해 주세요.")
				$("#m_pw").focus();
			}else{
				$("#loginForm").submit();
			}
		});
	/* 	$("#joinBtn").on("click",function(){
	
		}
		$("#findBtn").on("click",function(){
	
		} */
	});
	function checkVal(sel){
		if($.trim($(sel).val())==""){
			return true;
		}
		else{
			return false;
		}
	}
	
	$("#joinBtn").on("click",function(){
		location.href = "sign_up";
	});
	
	$("#findBtn").on("click",function(){
		location.href = "find_idpw";
	});
	
</script>
</head>

<body>
  <!-- partial:index.partial.html -->
  <div class="box-form">
    <div class="left">
      <div class="overlay">
        <h1>Coronagram</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Curabitur et est sed felis aliquet sollicitudin</p>
      </div>
    </div>


    <div class="right">
      <p class="r_title">Login</p>
      <form action="logins" id="loginForm" method="post">
      <div class="inputs">
        <span class="title_Name">아이디</span><br>
        <input type="text" id="m_id" placeholder="아이디를 입력하세요" name="m_id"><br>
        <span class="title_Name" >패스워드</span><br>
        <input type="password" id="m_pw" placeholder="패스워드를 입력하세요" name="m_pw"><br><br>
      </div>
    </form>
      <br><br>

      
      <br>
      <div class="btn_con">
        <button id="loginBtn" class="login_btn">로그인</button>
        <button id="joinBtn"class="join_btn">가입</button>
        <button id="findBtn" class="find_btn">ID/PW 찾기</button>
      </div>
    </div>

  </div>
  <!-- partial -->

</body>

</html>