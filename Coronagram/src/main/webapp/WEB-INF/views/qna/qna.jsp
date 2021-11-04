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
	.paging {
		float : left;
	}
	.paging_wrap {
		margin: 40px 265px;
	}
	.ans_o {
		color : green;
	}
	.ans_x {
		color : red;
		font-weight: 600;
	}
</style>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/qna/qna.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
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
		  
		  $("#actionForm").attr("action","myqna");
		  $("#actionForm").submit();
		  
	  });
//취소버튼
	$("#cancleBtn").on("click", function(){
		$("#backForm").submit();//history.back()동작은 하지만 상태값을 유지하지못함
	});

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
					url:"qnaAdds",
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
					console.log("error");
				}
			});
		}
	});
	
});
//공백만 넘어가는경우 방지
function checkVal(sel) {
	if($.trim($(sel).val())=="") { 
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
			html += "<div class=\"ans_x\">" + "확인중" + "</div>";
		}
		html += "</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
	
	}
	//페이징 그리기
	function drawPaging(pb) {
		var html = "";
			
		html += "<span page=\"1\"><p>&nbsp처음&nbsp</p></span>      ";
			
		if($("#page").val() == "1") {
			html += "<span page=\"1\"><p>&nbsp이전&nbsp</p></span>    ";
		} else {
			html += "<span page=\""+($("#page").val() * 1 -1) + "\"><p>&nbsp이전&nbsp</p></span>	";  //-1(자동숫자변환)
		}
			
		for(var i = pb.startPcount ; i<= pb.endPcount ; i++) {
			if($("#page").val() == i) {
				html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
			}else {
				html += "<span page=\"" + i + "\"><h3>" + i + "</h3></span> ";
			}
		}
			
		if($("#page").val()== pb.maxPcount) {
			html += "<span page=\"" + pb.maxPcount + "\"><p>&nbsp다음&nbsp</p></span>      ";
		} else {
			html += "<span page=\"" + ($("#page").val()* 1 + 1) + "\"><p>&nbsp다음&nbsp</p></span>      ";
		}
			
		html += "<span page=\"" + pb.maxPcount+"\"><p>&nbsp마지막&nbsp</p></span>    ";
			
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
      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      	<div class="cm_dropdown">
        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        	<ul class="cm_dropdown-content">
	          	<li>
	            	<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
	          	</li>
	          	<li>
	            	<a href="coronagram/${sMNick}" class="cm_userinfo"> 개인정보수정</a>
	          	</li>
          	</ul>
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
          <a href="coinfo_infolist">관련 정보</a> <br>
          <a href="coinfo_step">거리두기</a> <br>
          <a href="coinfo_news">News</a>
        </ul>
      </a>
      <a href="coronagram" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coronagram/${sMNick}">개인 페이지</a> <br>
          <a href="calendar">출석 체크</a> <br>
          <a href="https://coronagram-zoom.herokuapp.com/">Zoom</a>
        </ul>
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_qna"></div>Service Center
        <ul class="cm_mcon" id="cm_mcon">
          <a href="qna">FAQ</a><br>
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
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked><label for="tab-1" class="tab"><p>내 질문 보기</p></label>
                    <input id="tab-2" type="radio" name="tab" class="scm2"><label for="tab-2" class="tab"><p>Q&A</p></label>
                    <input id="tab-3" type="radio" name="tab" class="scm3"><label for="tab-3" class="tab"><p>FAQ</p></label>
                   
                    <div class="sc-form">
                        <div class="scm1-htm"><!-- 문의list -->
                            <label for="user" class="sclabel"><p>나의 질문</p></label>
                            <div class="group">
                            <div>
							   <form action="#" id="actionForm" method="post">
							      <input type="hidden" id="oldTxt" value="${param.searchTxt}"/>	
							      <input type="hidden" name="page" id="page" value="${page}"/>
							      <input type="hidden" name="no" id="no" />
							      <input type="hidden" name="sMNo" id="sMNo" value="${sMNo}"/>
							   </form>
							</div>
                                <div class= "qnaList">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th><p>번호</p></th>
                                                <th><p>제목</p></th>
                                                <th><p>등록일</p></th>
                                                <th><p>현황</p></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    
                                </div>
                                <div class="paging">
                                    	<div class="paging_wrap"></div>
                                </div>
                            </div>
                        </div>
                        <div class="scm2-htm"><!-- 질문추가 -->
                            <label for="user" class="sclabel"><p>1:1문의하기</p></label>
                            <div class="group">
                            <form action="" id="addForm" method="post">
                                <div class="qnaMain">
                                    <div class="QnaTitle">
                                    	<p>작성자 : ${sMNm}</p>
                                    	<input type = "hidden" name = "m_no" value="${sMNo}" /> </br>
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
                        <div class="scm3-htm"><!-- FAQ -->
                            <label for="user" class="sclabel"><p>자주묻는질문</p></label>
                            <div class="group">
                                <div class="scImg"></div>
                                <div class="scMain" id="scMain">
                                    <button class="scQ"><b>Q.</b> 코로나바이러스 감염증은 어떤 질병인가요?</button>
                                    <div class="scA">
                                        <p> <b>A.</b> 코로나바이러스감염증-19(코로나19)는 과거에 발견되지 않았던 새로운 코로나 바이러스인 SARS-CoV-2에 의해 발생하는 호흡기 감염병입니다. 이 바이러스에 감염되면 무증상부터 중증에 이르기까지 다양한 임상증상이 나타날 수 있습니다.<br>
										<br><b>A.</b> 이 새로운 바이러스와 질병은 2019년 12월 중국 우한에서 처음 보고되었고, 현재 전 세계에 확산되었습니다.</p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 코로나는 어떻게 전염되나요</button>
                                    <div class="scA">
                                        <p><b>A.</b> 코로나19를 일으키는 바이러스는 사람에서 사람으로 전파되며 주로 환자와 직접 접촉 또는 호흡기를 통해 배출되는 비말에 의해 전염됩니다. 다시 말해서 코로나19에 감염된 사람이 말을 하거나, 기침이나 재채기, 노래 등을 할 때 생성된 비말이 근처에 있는 사람들의 호흡기에 직접 닿거나, 비말이 묻은 손 또는 물건 등을 만진 뒤 눈, 코 또는 입을 만질 때 전염될 수 있습니다.<br>
                                        <br><b>A.</b> 또한 공기 감염은 흔하지 않으나 의료기관의 에어로졸 생성 시술이나 밀폐된 공간에서 장시간 호흡기 비말을 만드는 환경 등 특수상황에서 보통 비말이 도달하는 거리(2미터) 이상까지 바이러스 전파가 가능할 수 있습니다.
                                        </p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 음식을 통해 전염될 수 있나요?</button>
                                    <div class="scA">
                                        <p><b>A.</b> 현재까지 코로나19가 음식을 통해 전파된다는 증거는 없습니다.<br>
                                        <br><b>A.</b> 바이러스가 있는 음식의 포장 용기 표면이나 물체를 만진 후 자신의 입, 코 또는 눈을 만지면 코로나19에 걸릴 수 있지만, 물체의 표면에서 이러한 코로나바이러스의 생존력이 높지 않기 때문에 식품이나 포장 용기를 통해 확산될 위험은 매우 낮습니다.<br>
                                        <br><b>A.</b> 안전을 위해서는 항상 음식을 준비하거나 먹기 전에 비누와 물로 30초 동안 손을 씻는 것이 도움이 될 수 있습니다.</p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 증상은 어떤 것이 있나요?</button>
                                    <div class="scA">
                                        <p><b>A.</b> 코로나19의 가장 흔한 증상은 발열, 마른 기침, 피로이며 그 외에 후각 및 미각 소실, 근육통, 인후통, 콧물, 코막힘, 두통, 결막염, 설사, 피부 증상 등 다양한 증상이 나타날 수 있습니다.<br>
                                        <br><b>A.</b> 이러한 증상은 보통 경미하고 점진적으로 나타납니다. 어떤 사람들은 감염되어도 매우 약한 증상만 나타날 수 있습니다.<br>
                                        <br><b>A.</b> 대부분의 환자들(약 80%)은 특별한 치료 없이 회복되나, 5명 중 1명 정도는 중증으로 진행할 수 있습니다. 고령자나 고혈압, 심폐질환, 당뇨병이나 암과 같은 기저질환이 있는 사람들은 중증으로 진행될 가능성이 높습니다.</p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 검사는 어떻게 이루어지나요?</button>
                                    <div class="scA">
                                        <p><b>A.</b> (검체 채취) 검체는 의사, 간호사, 임상병리사가 지정된 장소(선별진료소 등)에서 채취합니다. 필수 검체는 상기도 검체이며, 하기도 검체는 가래가 있는 환자에서 채취합니다. 검체 채취 시 불편감ㆍ통증이 있을 수 있습니다.</p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 코로나19에서 회복되면 면역이 생기나요?</button>
                                    <div class="scA">
                                        <p><b>A.</b> 아직까지 코로나19에 감염되었던 사람이 다시 감염될 수 있는지에 대한 정보는 부족합니다. 재감염이 가능한지에 대한 연구가 전 세계 여러 곳에서 진행중입니다.</p>
                                    </div>
                                    <button class="scQ"><b>Q.</b> 반려동물에게 감염될 수 있나요?</button>
                                    <div class="scA">
                                        <p><b>A.</b> 아직까지 코로나19에 감염된 반려동물들이 질병을 사람에게 전염시키고 전파시킬 수 있다는 증거는 없습니다.<br>
                                        <br><b>A.</b> 반려동물이 코로나19 바이러스에 감염된 사례들이 보고되었는데, 대부분 코로나19에 감염된 사람과 접촉한 후에 감염되었습니다.<br>
                                        <br><b>A.</b> 코로나19나 다른 질병을 예방하기 위해서는, 반려동물이나 반려동물의 물건을 접촉하기 전·후에 손을 물과 비누로 깨끗이 씻는 예방수칙을 잘 지켜야 합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                </div>
            </div> 
        </div>
    </main>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
	<script src="resources/script/qna/qna.js"></script>
    </body>
</html>
