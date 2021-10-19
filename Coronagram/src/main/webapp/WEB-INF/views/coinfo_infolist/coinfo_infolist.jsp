<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>co_news_main</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
  <link rel="stylesheet" href="resources/css/coinfo_infolist/coinfo_infolist.css?after">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {

		}
 
//	$("tbody").on("click", "tr", function() {
//		$("#no").val($(this).attr("no"));
//		
//		$("#actionForm").attr("action", "testAB");
//		$("#actionForm").submit();
//	});
//});
  
  
  
	// 데이터 취득
	function reloadList() {
		var params = $("#actionForm").serialize(); // form의 데이터를 문자열로 변환
		
		$.ajax({ // jquery의 ajax함수 호출
			url : "coinfo_infolistAjex", // 접속 주소
			type : "post", // 전송 방식
			dataType : "json", // 받아올 데이터 형태
			data : params, // 보낼 데이터(문자열 형태)
			success : function(res) { // 성공(ajax통신 성공) 시 다음 함수 실행
				drawList(res.list);
				drawPaging(res.pb);
			},
			error : function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		});
	}
	
  
  
  function drawList(list) {
		var html="";
		
		for(var data of list){
			html += "<h2>" + data.INFO_TITLE + "</h2>      ";
			html += "<p>" + data.INFO_SUBHD + "</p>    ";
		}
		
		$("tbody").html(html);
	}

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


  <!-- main -->

    <div class="slider-container">
      <div class="slider-control left inactive"></div>
      <div class="slider-control right"></div>
      <ul class="slider-pagi"></ul>
      <div class="slider">
        <div class="slide slide-0 active">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">코로나좀</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-1 ">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 2</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-2">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 3</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
        <div class="slide slide-3">
          <div class="slide__bg"></div>
          <div class="slide__content">
            <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
              <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405" />
            </svg>
            <div class="slide__text">
              <h2 class="slide__text-heading">Project name 4</h2>
              <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam
                minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque
                voluptate tempore quia.</p>
              <a class="slide__text-link">Project link</a>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- partial -->
  <script src="resources/script/coinfo_infolist/coinfo_infolist.js"></script> <!-- script -->
</body>

</html>