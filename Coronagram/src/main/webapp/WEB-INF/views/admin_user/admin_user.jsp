<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/admin_user/admin_user.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		if("${param.searchGbn}" != "") {
			$("#searchGbn").val("${param.searchGbn}");
		}
		
		reloadList();
	//검색
		$("#searchBtn").on("click", function(){
			$("#page").val("1");
			$("#oldTxt").val($("#searchTxt").val());
			
			reloadList();
		});
	//페이징
		$(".paging_wrap").on("click","span",function(){
			  $("#page").val($(this).attr("page"));
			  
			  $("#searchTxt").val($("#oldTxt").val());
			  reloadList();
		   });
	//상세보기
		$("tbody").on("click","tr",function(){
			  $("#no").val($(this).attr("no"));
			  $("#searchTxt").val($("#oldTxt").val());
			  
			  $("#actionForm").attr("action","admin_profile");
			  $("#actionForm").submit();
		  });

	//데이터 취득
		function reloadList(){
			var params = $("#actionForm").serialize();
			
			$.ajax({ //jquery의 ajax함수 호출
				url: "adminUserListAjax", //접속 주소
				type:"post", //전송 방식
				dataType:"json", // 받아올 데이터 형태
				data:params, // 보낼 데이터(문자열 형태)
				success:function(res){ //성공(ajax통신 성공) 시 다음 함수 실행
					drawList(res.list);
					drawPaging(res.pb);
				},
				error:function(request, status, error){ //실패시 다음 함수 실행
					console.log(error);
				}
			});
		}
//목록 그리기
	function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr no=\""+data.M_NO+"\">";
		html += "<td>"+data.M_NO+"</td>";
		html += "<td>"+data.M_ID+"</td>";
		html += "<td>"+data.M_NM+"</td>";
		html += "<td>"+data.PHONE+"</td>";
		html += "<td>"+data.EMAIL+"</td>";
		html += "<td>"+data.M_DT+"</td>";
		html += "<td>"+data.POINT+"</td>";
		html += "<td>"+data.ACCT_TYPE_NO+"</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
	
	}
//페이징 그리기
	function drawPaging(pb) {
		var html = "";
			
		html += "<span page =\"1\">처음</span>      ";
			
		if($("#page").val() == "1") {
			html += "<span page=\"1\">이전</span>    ";
		} else {
			html += "<span page=\""+($("#page").val() * 1 -1) + "\">이전</span>	";  //-1(자동숫자변환)
		}
			
		for(var i = pb.startPcount ; i<= pb.endPcount ; i++) {
			if($("#page").val() == i) {
				html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
			}else {
				html += "<span page=\"" + i + "\">" +i + "</span> ";
			}
		}
			
		if($("#page").val()== pb.maxPcount) {
			html += "<span page=\"" + pb.maxPcount + "\">다음</span>      ";
		} else {
			html += "<span page=\"" + ($("#page").val()* 1 + 1) + "\">다음</span>      ";
		}
			
		html += "<span page=\"" + pb.maxPcount+"\">마지막</span>    ";
			
		$(".paging_wrap").html(html);
	}
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
        <div>
            <h4 id="adm_page">관리자페이지</h4>
        </div>
        <div class="top_text">
            <h2>회원관리</h2>
            <form action="#" id="actionForm" method="post">
				<input type="hidden" name="no" id="no" />
				<input type="hidden" name="page" id="page" value="${page}" /> 
				<select id="searchGbn" name="searchGbn">
					<option value="0">회원번호</option>
					<option value="1">ID</option>
					<option value="2">이름</option>
					<option value="3">전화번호</option>
					<option value="4">Email</option>
					<option value="5">가입일</option>
					<option value="6">포인트</option>
					<option value="7">회원등급</option>
				</select> 
				<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
				<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
				<input type="button" id="searchBtn" value="검색" />
			</form>
        </div>
        <div class="side_box">
            <table class="user_box">
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>ID</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>보유포인트</th>
                            <th>회원등급</th>
                        </tr>
                    </thead>
                   <tbody></tbody>
            </table>
            <div class="paging">
               <div class="paging_wrap"></div>
            </div>
        </div>
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>