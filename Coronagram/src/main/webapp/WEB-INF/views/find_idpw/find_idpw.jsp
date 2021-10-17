<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>CodePen - Responsive Login Form</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="resources/css/find_idpw/find_idpw.css?after">


  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script>
  	$(document).ready(function(){
  		if(m_id)
  		
  		
		$("#search1").on("click",function(){
				$("#FindForm").submit();		
			}   )});
  	
  	$(document).ready(function(){
  		if(m_pw)
  		
  		
		$("#search2").on("click",function(){
				$("#FindPwForm").submit();		
			}   )});
	
  	
	
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
      <div class="login-wrap">
        <div class="login-html">
          <div class="r_title">ID/PW 찾기</div>
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">ID 찾기</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">PW 찾기</label>
          <div class="login-form">
            <div class="sign-in-htm">
            <form action="find_idpws" id="FindForm" method="post">
              <div class="group">
                <label for="user" class="label">이름</label><br>
                <input type="text" id="m_nm" name="m_nm" placeholder="이름을 입력하세요"><br>
                <label for="user" class="label">E-mail</label><br>
                <input type="text" id="email" name="email" placeholder="E-mail을 입력하세요"><br>
              </div>
              <div class="btn_con">
                <input type="submit" id="search1" class="search_btn" value="찾기"> 
                  <button type="button" onclick="history.go(-1);" class="cancel_btn">취소</button>
              </div> 
              </form> 
              <div class="hr"></div>
            </div>
            <div class="sign-up-htm">
            <form action="find_pws" id="FindPwForm" method="post">
              <div class="group">
                <label for="user" class="label">이름</label><br>
                <input type="text" name ="m_nm" placeholder="이름을 입력하세요"><br>
                <label for="user" class="label">ID</label><br>
                <input type="text" name="m_id" placeholder="ID를 입력하세요"><br>
                <label for="user" class="label">E-mail</label><br>
                <input type="text" name ="email" placeholder="E-mail을 입력하세요"><br>
              </div>
              <div class="btn_con">
                   <input type="submit" id="search2" class="search_btn" value="찾기"> 
                 
                  <button type="button" onclick="history.go(-1);" class="cancel_btn">취소</button>
              </div>  
              </form> 
              <div class="hr"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>