<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/admin_coinfo/admin_coinfo.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src = "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
		$("tbody").on("click","tr",function(){
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
		html += "<tr no=\"" + data.INFO_NO+"\">";
		html += "<td>"+data.INFO_NO+"</td>";
		html += "<td>"+data.INFO_TITLE+"</td>";
		html += "<td>"+data.INFO_SUBHD+"</td>";
		html += "<td>"+data.DT+"</td>";
 		html += "<td>"+data.DISP+
/* 		if(data.DISP !=null){
			html += "<div class=\"disp_o\">" + "노출" + "</div>";
		} else {
			html += "<div class=\"disp_x\">" + "숨김" + "</div>";
		}
		html +=  */"</td>";
		html += "</tr>";
	}
	$("#tbody").html(html);
	
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
                    <h4>관리자 페이지</h4>
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




								<div>
									<form action="#" id="actionForm" method="post">
										<select name="searchGbn" id="searchGbn">
											<option value="0">제목</option>
											<option value="1">소제목</option>
										</select>
										<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
										<input type="hidden" id="oldTxt"  value="${param.searchTxt}" />
										<input type="hidden" name="page" id="page" value="${page}" />
										<input type="hidden" name="no" id="no" />
										<input type="button" value="검색" id="searchBtn" />
										<c:if test="${!empty sMNo}">
											<input type="button" value="작성" id="addBtn" />
										</c:if>
									</form>
								</div>
								<div class="adList">
									<table border="1";>
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
								<div class="paging_wrap">
								</div>



<%-- 								<form id="imgForm" action="fileUploadAjax" method="post"
									enctype="multipart/form-data">
									<input type="file" name="imgAtt" id="imgAtt" accept="image/*">
								</form>
								
								<form action="#" id="addForm" method="post">
									<input type="hidden" name="m_no" value="${sMNo}">
									
									<div class="qnaTitle">
										<div class="qnaTitle1">
											<span>제목</span><input type="text" class="border"
												id="info_title" name="info_title" placeholder="내용을 입력하세요">
										</div>
										<div class="qnaTitle2">
											<span>소제목</span><input type="text" class="border"
												id="info_subhd" name="info_subhd" placeholder="내용을 입력하세요">
										</div>
									</div>
									
									<div class="qnaMain">
										<div class="qnaCon">
											<p>내용</p>
											<textarea class="QCI" type="text" id="con" name="con"
												placeholder="내용을 입력하세요"></textarea>
										</div>
										<div class="qnaImg">
											<span>이미지</span><input type="button" value="file"
												class="fileBtn" id="imgBtn" /> <span id="fileName"></span>
											<input type="hidden" name="imgFile" id="imgFile">
											<div id="preView">
												<img
													src="resources/images/coinfo/coinfo_upload/${fn:replace(fn:replace(data.REP_IMG, '[', '%5B'), ']', '%5D')}"
													onerror="this.style.display='none'" />
											</div>
										</div>
									</div>
								</form>
								
								<div class="qnaBtn">
									<input type="button" id="addBtn" class="qnaBtn1" value="저장" />
									<input type="button" id="cancelBtn" class="qnaBtn2" value="취소" />
								</div> --%>
							</div>
						</div>




						<div class="scm2-htm">
                            <label for="user" class="sclabel">
                                <p>거리두기 정보 단계 관리</p>
                            </label>
                            <div class="group">
                                <div class="qnaMain">
                                    <div class="QnaTitle" id="">
                                        <div>
                                            <span>지역</span>
                                            <select  name="dropbox" class="dbox">
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                            </select>
                                        </div>
                                        <div>
                                            <span>단계 &nbsp;</span><input class="border" type="text" placeholder="내용을 입력하세요">
                                        </div>
                                    </div>
                                    <div class="qnaMain">
                                        <div>
                                            <p>내용</p><textarea class="QCI" class="border" type="text" placeholder="내용을 입력하세요"></textarea>
                                        </div>
	                                    <div class="qnaBtn">
                                    		<input type="button" id="addBtnStep" class="qnaBtn1" value="저장" />
                                    		<input type="button" id="cancelBtnStep" class="qnaBtn2" value="취소" />
                                        </div>
                                    </div>
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