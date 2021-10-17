<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="resources/css/find_idpw/find_pw.css?after">


  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script>
  $("#updateBtn").on("click", function(){
		if($("#m_pw").val() != ""){//비밀번호를 변경할 경우
				$("#updateForm").submit();			
			} else {// 비교 결과 같지 않은 경우
				alert("비밀번호확인이 일치하지 않습니다.");
			}
		
	});
// document ready end
  </script>
</head>

<body>
  <!-- partial:index.partial.html -->
  <div class="box-form">
    <div class="left">
      <div class="overlay">
        <h1>Coronagram</h1>
        <p>변경할 패스워드를 입력후 비밀번호 변경 버튼을 클릭해주세요</p>
      </div>
    </div>


    <div class="right">
      <div class="login-wrap">
        <div class="login-html">
          <div class="r_title">PW 변경 </div>
            
           
          <div class="login-form">
            <form action="findPws" id="updateForm" method="post">
              <div class="group">
                <span class="idtext">
                <input type="hidden" id="opw" value="${data.M_PW}" />
                 PW : <input type="password" id="m_pw" name="m_pw" /><br/>
				PW확인 : <input type="password" id="m_repw"  /><br/>
                </span>
              </div>
              
              <div class="btn_con">
                <!-- <input type="submit" class="login_btn" value="로그인">
                <input type="submit" class="find_btn" value="ID/PW 찾기"> -->
                  <button id="updateBtn" class="add_btn">비밀번호 변경</button>
                  <a href="login" id="login_btn"><button class="login_btn">로그인</button></a>
                  <a href="find_idpw" id="find_btn"><button class="find_btn">ID/PW 찾기</button></a> 
              </div>  
           </form>
            </div>
            
          
        </div>
      </div>
    </div>
  </div>
</body>

</html>