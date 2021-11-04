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
    <link rel="stylesheet" href="resources/css/admin_coinfo/admin_coinfo_list.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src = "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.searchGbn}" !=""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	reloadList();

	//글작성
	$("#addBtn").on("click", function(){
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "admin_coinfo_add");
		$("#actionForm").submit();
	});
	
	//검색
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13){
			$("#searchBtn").click();
			return false;
		}
	});
	
	
	//페이징
	$(".paging_wrap").on("click","span",function(){
		  $("#page").val($(this).attr("page"));
		  $("#searchTxt").val($("#oldTxt").val());
		  reloadList();
	   });
	
	//상세보기
		$("#tbody").on("click","tr",function(){
			  $("#no").val($(this).attr("no"));
			  
			  $("#actionForm").attr("action","admin_coinfo_dtl");
			  $("#actionForm").submit();
			  
		  });

//데이터 취득
	function reloadList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({ //jquery의 ajax함수 호출
			url: "adminCoinfoListAjax", //접속 주소
			type:"post", //전송 방식
			dataType:"json", // 받아올 데이터 형태
			data:params, // 보낼 데이터(문자열 형태)
			async:false,
			success:function(res){ //성공(ajax통신 성공) 시 다음 함수 실행
				drawList(res.list);
				drawPaging(res.pb);
				reloadList2();
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
		html += "<tr no=\"" + data.INFO_NO+"\">";
		html += "<td>"+data.RNUM+"</td>";
		html += "<td>"+data.INFO_TITLE+"</td>";
		html += "<td>"+data.INFO_SUBHD+"</td>";
		html += "<td>"+data.DT+"</td>";
 		html += "<td>"/* +data.DISP_YN+ */
 		if(data.DISP_YN == "Y"){
			html += "<div class=\"disp_y\">" + "노출" + "</div>";
		} else {
			html += "<div class=\"disp_n\">" + "숨김" + "</div>";
		}
		html += "</td>";
		html += "</tr>";
	}
	$("#tbody").html(html);
	
	}
//페이징 그리기
	function drawPaging(pb) {
		var html = "";
		
		html += "<span page =\"1\"><p>&nbsp<<&nbsp</p></span>      ";
		
		if($("#page").val() == "1") {
			html += "<span page=\"1\"><p><&nbsp이전&nbsp</p></span>    ";
		} else {
			html += "<span page=\""+($("#page").val() * 1 -1) + "\"><p><&nbsp이전&nbsp</p></span>	";  //-1(자동숫자변환)
		}
		
		for(var i = pb.startPcount ; i<= pb.endPcount ; i++) {
			if($("#page").val() == i) {
				html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
			}else {
				html += "<span page=\"" + i + "\"><h3>" + i + "</h3></span> ";
			}
		}
		
		if($("#page").val()== pb.maxPcount) {
			html += "<span page=\"" + pb.maxPcount + "\"><p>다음&nbsp>&nbsp</p></span>      ";
		} else {
			html += "<span page=\"" + ($("#page").val()* 1 + 1) + "\"><p>다음&nbsp>&nbsp</p></span>      ";
		}
		
		html += "<span page=\"" + pb.maxPcount+"\"><p>&nbsp>>&nbsp</p></span>    ";
		
		$(".paging_wrap").html(html);
	}
	
	
	
	
	
	// 단계변경 리스트
	
	// 단계변경 상세보기
	$("#st_tbody").on("click","tr",function(){
		  $("#mgt_no").val($(this).attr("mgt_no"));
		  
		  $("#st_actionForm").attr("action","admin_step_upd");
		  $("#st_actionForm").submit();
		  
	  });
	
	//데이터 취득
	function reloadList2(){
		var params = $("#st_actionForm").serialize();
		
		$.ajax({ //jquery의 ajax함수 호출
			url: "adminStepListAjax", //접속 주소
			type:"post", //전송 방식
			dataType:"json", // 받아올 데이터 형태
			data:params, // 보낼 데이터(문자열 형태)
			async:false,	
			success:function(res){ //성공(ajax통신 성공) 시 다음 함수 실행
				drawList2(res.list);
			},
			error:function(request, status, error){ //실패시 다음 함수 실행
				console.log(error);
			}
		});
	}
	
	//목록 그리기
		function drawList2(list) {
		var html = "";
		
		for(var data of list) {
			html += "<tr mgt_no=\"" + data.MGT_NO+"\">";
			html += "<td>"+data.AREA_NM+"</td>";
			html += "<td>"+data.STEP_NO+"</td>";
			html += "<td>"+data.CON+"</td>";
			html += "<td>"+data.DT+"</td>";
			html += "</tr>";
		}
		$("#st_tbody").html(html);
	
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
                            <a href="edit_profile" class="cm_userinfo">개인정보수정</a>
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
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked>
                    <label for="tab-1" class="tab">코로나 정보 관리</label>
                    <input id="tab-2" type="radio" name="tab" class="scm2">
                    <label for="tab-2" class="tab">단계 변경</label>
                    <div class="sc-form">
						<div class="scm1-htm">
							<label for="user" class="sclabel">
								<p>코로나 관련 정보 관리</p>
							</label>
							<div class="group">
								<div class="adInput">
									<form action="#" id="actionForm" method="post">
										<select name="searchGbn" id="searchGbn" class="searchGbn">
											<option value="0">제목</option>
											<option value="1">소제목</option>
										</select> 
										<input type="text" name="searchTxt" class="searchTxt" id="searchTxt" value="${param.searchTxt}" /> 
										<input type="hidden" id="oldTxt" value="${param.searchTxt}" /> 
										<input type="hidden" name="page" id="page" value="${page}" /> 
										<input type="hidden" name="no" id="no" /> 
										<input type="button" value="검색" id="searchBtn" class="searchBtn" />
										<c:if test="${!empty sMNo}">
											<input type="button" value="작성" id="addBtn" class="addBtn" />
										</c:if>
									</form>
								</div>
								<div class="adList">
									<table class="adListTb">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>소제목</th>
												<th>작성일</th>
												<th>노출여부</th>
											</tr>
										</thead>
										<tbody id="tbody"></tbody>
									</table>
								</div>
							<div class="paging_wrap"></div>
							</div>
						</div>



						<div class="scm2-htm">
                            <label for="user" class="sclabel">
                                <p>거리두기 정보 단계 관리</p>
                            </label>
                            <div class="group">
                                <div class="stInput">
									<form action="#" id="st_actionForm" method="post">
										<input type="hidden" name="mgt_no" id="mgt_no" />
									</form>
								</div>
								<div class="stList">
									<table class="stListTb">
										<thead>
											<tr>
												<th>지역</th>
												<th>단계</th>
												<th>상세현황</th>
												<th>수정날짜</th>
											</tr>
										</thead>
										<tbody id="st_tbody"></tbody>
									</table>
								</div>
                            </div>
                        </div><!-- sc-form -->
                    </div><!-- sc-html -->
                </div> <!-- sc-form -->
            </div>
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>