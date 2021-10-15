<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/qna/qna.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

/* 2.문의하기 */
// 취소버튼
$(document).ready(function(){
	reloadList();
	$(".paging_wrap").on("click","span",function(){
		  $("#page").val($(this).attr("page"));
		  $("#searchTxt").val($("#oldTxt").val());
		  reloadList();
	   });
	 	
	$("tbody").on("click","tr",function(){
		  $("#no").val($(this).attr("no"));
		  
		  $("#actionForm").attr("action","myqna");
		  $("#actionForm").submit();
		  
	  });
	$("#cancleBtn").on("click", function(){
		$("#backForm").submit();//history.back()동작은 하지만 상태값을 유지하지못함
	});
	//엔터키 폼 실행 막기
	/* $("#addForm").on("keypress", "input", function(){
		if(event.keyCode == 13) { //엔터키가 눌러졌을때
			return false; //form실행 이벤트를 하지 않음
		}
	}); */
	//저장 버튼
	$("#addBtn").on("click",function(){					
		if(checkVal("#title")) {
			alert("제목을 입력해 주세요");
			$("#title").focus();
				}else if(checkVal("#con")) {
					alert("내용을 입력해 주세요");
				} else {
					var params = $("#addForm").serialize();
					$.ajax({
					url:"qna",
					type:"post",
					dataType:"json",
					data:params,
					success:function(res){
						if(res.result=="success"){
							location.href="qna";
						}
						else if(res.result=="failed"){
							alert("작성에 실패하였습니다.");
						}else{
							alert("작성중 문제가 발생했습니다.");
						}
					},
				error:function(request,status,error){
					console.log(error);
				}
			});
		}
	});
	
});
		
function checkVal(sel) { //함수 만들어줌
	if($.trim($(sel).val())=="") { //공백만 넘어가는경우 방지
		return true;
	} else {
		return false;
	}
}
/* 3.문의내역 */
//데이터 취득
        function reloadList(){
        	var params = $("#actionForm").serialize();
        	
        	$.ajax({ //jquery의 ajax함수 호출
        		url: "QnaListAjax", //접속 주소
        		type:"post", //전송 방식
        		dataType:"json", // 받아올 데이터 형태
        		data:params, // 보낼 데이터(문자열 형태)
        		success:function(res){ //성공(ajax통신 성공) 시 다음 함수 실행
        			drawList(res.list);
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
		html += "<tr no=\"" + data.QNA_NO+"\">";
		html += "<td>"+data.QNA_NO+"</td>";
		html += "<td>"+data.TITLE+"</td>";
		html += "<td>"+data.Q_DT+"</td>";
		html += "<td>"+data.CON+"</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
	
	}
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
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>고객센터</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked><label for="tab-1" class="tab"><p>FAQ</p></label>
                    <input id="tab-2" type="radio" name="tab" class="scm2"><label for="tab-2" class="tab"><p>Q&A</p></label>
                    <input id="tab-3" type="radio" name="tab" class="scm3"><label for="tab-3" class="tab"><p>문의내역</p></label>
                    <div class="sc-form">
                        <div class="scm1-htm">
                            <label for="user" class="sclabel"><p>자주 묻는 질문</p></label>
                            <div class="group">
                                <div class="scImg"></div>
                                <div class="scMain" id="scMain">
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis, laborum ex, eligendi tempore harum saepe, ea corporis at totam ipsum eum inventore veniam itaque fuga repudiandae sit voluptatibus. Error, rerum.
                                        </p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi neque in architecto eaque velit eum distinctio aliquid pariatur laboriosam tempore? Veniam at exercitationem quaerat consectetur nostrum, ea ipsam optio saepe?</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="scm2-htm">
                            <label for="user" class="sclabel"><p>1:1문의하기</p></label>
                            <div class="group">
                            <form action="#" id="addForm" method="post">
                                <div class="qnaMain">
                                    <div class="QnaTitle">
                                        <p>제목</p><input class="QTI"  type = "text" id = "title" name = "title" />
                                    </div>
                                </div>
                                <div class="qnaMain">
                                    <div class="QnaCon">
                                        <p>내용</p><textarea class="QCI" id="con" name="con"></textarea>
                                    </div>
                                </div>
                             </form>
                             	<div class="qnaBtn">
                                    <button href="#" type="button" class="add_btn" id="addBtn" />작성</button>
                                    <button href="#" type="button" class="cancel_btn" id="cancelBtn" />취소</button>
                                </div>
                        </div><!-- scm2-htm -->
                    </div><!-- sc-form -->
                        <div class="scm3-htm">
                            <label for="user" class="sclabel"><p>문의내역</p></label>
                            <div class="group">
                            <div>
							   <form action="#" id="actionForm" method="post">
							      <input type="hidden" id="oldTxt" value="${param.searchTxt}"/>	
							      <input type="hidden" name="page" id="page" value="${page}"/>
							      <input type="hidden" name="no" id="no" />
							   </form>
							</div>
                                <div>
                                    <table class= "qnaList" border="1">
                                        <thead>
                                            <tr>
                                                <th><p>번호</p></th>
                                                <th><p>제목</p></th>
                                                <th><p>등록일</p></th>
                                                <th><p>내용</p></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <div class="paging_wrap"></div>
                                </div>
                            </div>
                        </div>
                     </div>
                </div>
            </div> 
        </div>
    </main>
	<script src="resources/script/qna/qna.js"></script>
    </body>
</html>
