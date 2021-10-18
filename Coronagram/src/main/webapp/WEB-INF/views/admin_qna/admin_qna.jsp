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
<style>
table {
  width: 100%;
  height: 100%;
  display: block;
  table-layout: fixed;
  border-collapse: collapse;
  position: relative;
  margin-bottom: 68px;
  text-align: center;
}
  tr:nth-child(even) td {
    background: #e3e3e3;
  }
  
  th {
    border-bottom: 2px solid black;
    background: #fff;
  }
  
  tfoot td {
    border-top: 1px solid black;
  }
  
  th,
  td {
    text-align: center;
    padding: 6px 10px;
  }
  
  thead,
  tbody > tr {
    display: table;
    width: 100%;
    table-layout: fixed;
  }
  
  tbody {
    display: block;
    transform: translate(0, 34px);
    height: 104%;
    margin-top: -35px;
    border-bottom : 2px solid black;
    border-collapse: collapse;
  }


	.paging {
		float : left;
	}
	.paging_wrap {
		margin: 40px 265px;
	}
	.qnaList2 {
        height: 320px;
     }
     .ans_o {
		color : green;
	}
	.ans_x {
		color : red;
		font-weight: 600;
	}
</style>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/admin_qna/admin_qna.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
//페이징
$(document).ready(function(){
	reloadList();
	$(".paging_wrap").on("click","span",function(){
		  $("#page").val($(this).attr("page"));
		  $("#searchTxt").val($("#oldTxt").val());
		  reloadList();
	   });
//상세보기
	$("tbody").on("click","tr",function(){
		  $("#no").val($(this).attr("no"));
		  
		  $("#actionForm").attr("action","admin_qna_answer");
		  $("#actionForm").submit();
		  
	  });
////
//공백만 넘어가는경우 방지
function checkVal(sel) {
	if($.trim($(sel).val())=="") { 
		return true;
	} else {
		return false;
	}
}
//데이터 취득
	function reloadList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({ //jquery의 ajax함수 호출
			url: "adminQnaListAjax", //접속 주소
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
		html += "<tr no=\"" + data.QNA_NO+"\">";
		html += "<td>"+data.QNA_NO+"</td>";
		html += "<td>"+data.TITLE+"</td>";
		html += "<td>"+data.Q_DT+"</td>";
		html += "<td>"
		if(data.ANS_CON !=null){
			html += "<div class=\"ans_o\">" + "답변완료" + "</div>";
		} else {
			html += "<div class=\"ans_x\">" + "답변하기" + "</div>";
		}
		html += "</td>";
		html += "</tr>";
	}
	$("#tbody2").html(html);
	
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
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>관리자 페이지</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-2" type="radio" name="tab" class="scm2" checked><label for="tab-2" class="tab"><p>Q&A관리</p></label>
                    <div class="sc-form">
                        <div class="scm2-htm">
                            <label for="user" class="sclabel"><p>1:1 질문 관리</p></label>
                            <div class="group">
	                            <div>
								   <form action="#" id="actionForm" method="post">
								      <input type="hidden" id="oldTxt" value="${param.searchTxt}"/>	
								      <input type="hidden" name="page" id="page" value="${page}"/>
								      <input type="hidden" name="no" id="no" />
								   </form>
								</div>
                               <div class="qnaList2">
                                <table>
                                    <thead>
                                        <tr>
                                            <th><p>번호</p></th>
                                            <th><p>제목</p></th>
                                            <th><p>등록일</p></th>
                                            <th><p>기능</p></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody2"></tbody>
                                </table>
                                </div>
                                <div class="paging">
                                   		<div class="paging_wrap"></div>
                                   	</div>
                            </div>
                        </div>
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-form -->
        </div>
    </main>
        <script src="resources/script/admin_qna/admin_Qna.js"></script>
    </body>
    
    </html>