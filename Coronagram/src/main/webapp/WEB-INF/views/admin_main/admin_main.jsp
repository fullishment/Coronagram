<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
<link rel="stylesheet" href="resources/css/admin_main/admin_main.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
//목록 그리기
function drawList(list) {
var html = "";

for(var data of list) {
	html += "<tr no=\"" + data.QNA_NO+"\">";
	html += "<td>"+data.QNA_NO+"</td>";
	html += "<td>"+data.M_NM+"</td>";
	html += "<td>"+data.TITLE+"</td>";
	html += "<td>"+data.Q_DT+"</td>";
	html += "</tr>";
}
$("#tbody").html(html);

}
	
</script>	
</head>
<body>
	<header>
		<div class="cm_menuBar" id="cm_menuBar">
			<div class="cm_menu__toggler">
				<span></span>
			</div>
			<a href="#" class="cm_logo" id="cm_logo">Coronagram</a> <a href="#"
				class="cm_home" id="cm_home">Home</a> <a href="#" class="cm_msg"
				id="cm_msg">Message</a> <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
			<div class="cm_dropdown">
				<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
				<ul class="cm_dropdown-content">
					<li><a href="logout" class="cm_logout"><i
							class="cm_icon-logout"></i> <span>로그아웃</span> </a></li>
					<li><a href="#" class="cm_userinfo">개인정보수정</a></li>
			</div>
			<div class="cm_user_name">
				<c:if test="${!empty sMNo}">
				${sMNm}님 어서오세요.
			</c:if>
			</div>
		</div>
		</div>
		<div class="cm_menu" id="cm_menu">
			<a href="#" class="cm_mLogo">Coronagram</a> <a href="#"
				class="cm_mTitle" id="cm_mTitle">
				<div class="cm_map"></div> Corona Map
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">국내</a>
					<br>
					<a href="#">해외</a>
				</ul>
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_info"></div>Corona Info
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">관련 정보</a>
					<br>
					<a href="#">거리두기</a>
					<br>
					<a href="#">News</a>
				</ul>
			</a> <a href="#" class="cm_sTitle">
				<div class="cm_cam"></div>Coronagram
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_user"></div>My Page
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">개인 페이지</a>
					<br>
					<a href="#">출석 체크</a>
					<br>
					<a href="#">Message</a>
				</ul>
			</a> <a href="#" class="cm_mTitle" id="cm_mTitle">
				<div class="cm_qna"></div>Service Center
				<ul class="cm_mcon" id="cm_mcon">
					<a href="#">FAQ</a>
					<br>
					<a href="#">Q&A</a>
				</ul>
			</a>
		</div>
	</header>
	<main>
		<div class="sc" id="sc">
			<div class="scHead" id="scHead">
				<div class="scName1" id="scName1">
					<h5>
						<p>관리자 페이지</p>
					</h5>
				</div>
				<div class="scName2" id="scTitle2">
					<h2>
						<p>메인 페이지</p>
					</h2>
				</div>
			</div>
			<div class="boxcon">
				<article class="version">
					<section class="page-header">
						<h1 class="page-title">오늘의 방문자</h1>
						<div class="button-group">
							<button type="button" class="btn btn-primary">+</button>
						</div>
					</section>
				</article>

				<article class="version">
					<section class="page-header">
						<h1 class="page-title">회원관리</h1>
						<div class="button-group">
							<button type="button" class="btn btn-primary">+</button>
						</div>
					</section>
					<section class="page-body">
						<form action="#" id="admin_main" method="post">
							<div class="adminUser">
								<table>
									<thead>
										<tr>
											<th>총 회원수</th>
											<th>신규 회원수</th>
											<th>한달간 가입자수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${data.TOTALCOUNT}</td>
											<td>${data.DAYCOUNT}</td>
											<td>${data.ADMINCOUNT}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
					</section>
				</article>

				<article class="version">
					<section class="page-header">
						<h1 class="page-title">통계</h1>
						<div class="button-group">
							<button type="button" class="btn btn-primary">+</button>
						</div>
					</section>
				</article>

				<article class="version">
					<section class="page-header">
						<h1 class="page-title">Q&A</h1><p class="newqna">새 질문 : ${data1.NEWQ}</p>
						<div class="button-group">
							<a href="admin_qna"><button type="button" class="btn btn-primary">+</button></a>
						</div>
					</section>
					<section class="page-body">
						<div class="qnaList">
							<table>
								 <thead>
									<tr>
										<th><p>번호</p></th>
										<th><p>작성자</p></th>
										<th><p>제목</p></th>
										<th><p>날짜</p></th>
									</tr>
								</thead> 
								<tbody>
									<tr>
										<td>${list[0].QNA_NO}</td>
										<td>${list[0].M_NM}</td>
										<td>${list[0].TITLE}</td>
										<td>${list[0].Q_DT}</td>
									</tr>
									<tr>
										<td>${list[1].QNA_NO}</td>
										<td>${list[1].M_NM}</td>
										<td>${list[1].TITLE}</td>
										<td>${list[1].Q_DT}</td>
									</tr>
									<tr>
										<td>${list[2].QNA_NO}</td>
										<td>${list[2].M_NM}</td>
										<td>${list[2].TITLE}</td>
										<td>${list[2].Q_DT}</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					</section>
				</article>

				<article class="version">
					<section class="page-header">
						<h1 class="page-title">코로나 info 관리</h1>
						<div class="button-group">
							<button type="button" class="btn btn-primary">+</button>
						</div>
					</section>
				</article>

				<article class="version">
					<section class="page-header">
						<h1 class="page-title">포인트 샵 관리</h1>
						<div class="button-group">
							<button type="button" class="btn btn-primary">+</button>
						</div>
					</section>
				</article>
			</div>
		</div>
	</main>
	<script src="resources/script/admin_qna/admin_Qna.js"></script>
</body>
</html>