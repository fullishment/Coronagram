<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>	
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/login/login.css?after">
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
		 /* $("#joinBtn").on("click",function(){
			$("#actionForm").attr("action", "sign_up");
			$("#actionForm").submit();
		}   */
		/*  $("#findBtn").on("click",function(){
			$("#actionForm").attr("action", "");
			$("#actionForm").submit();
		}   */
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
  <!-- partial:index.partial.html -->
  <div class="box-form">
    <div class="left">
      <div class="overlay">
        <h1>Coronagram</h1>
        <p>오른쪽 id 와 비밀번호를 입력해주세요</p>
        <p>비회원이시라면 회원가입을 눌러 가입을 진행해주세요</p>
        <p>아이디와 비밀번호를 잊으셨다면 ID/PW찾기를 클릭해주세요</p>
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
        <a href="sign_up" id="joinBtn"><button class="join_btn">가입</button></a> 
        <a href="find_idpw" id="findBtn"><button class="find_btn">ID/PW 찾기</button></a> 
      </div>
    </div>

  </div>
  <!-- partial -->

</body>


</html>