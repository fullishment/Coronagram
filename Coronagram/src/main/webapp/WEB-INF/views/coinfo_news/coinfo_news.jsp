<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/coinfo_news/coinfo_news.css?after">
<link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
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
					<li><a href="#" class="cm_logout"><i
							class="cm_icon-logout"></i> <span>로그아웃</span> </a></li>
					<li><a href="#" class="cm_userinfo">개인정보수정</a></li>
			</div>
		<div class="cm_user_name">
	       <c:if test="${!empty sMNo}">
	          ${sMNm}님 어서오세요.
	       </c:if>
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

	<!-- 메인 -->
	<main>
		<div class="sc" id="sc">
			<div class="sc_head" id="sc_head">
				<div class="sc_name1" id="sc_name1">
					<h5>Corona info</h5>
				</div>
				<div class="sc_name2" id="sc_name2">
					<h2>코로나 뉴스</h2>
				</div>
			</div>
			<!-- scHead -->
			<div class="sc_main">
				<div class="group">
					<div class="sc_content" id="sc_content">
						<a href="#">
							<div class="sc_section" id="sc_section">
								<div class="sc_article">
									<div class="sc_hd">
										<h3>만남 시간 줄이고 환기 자주하면 감염 위험 1/3까지 줄어</h3>
									</div>
									<div class="sc_dt">
										<p>2021-09-16</p>
									</div>
									<div class="sc_cnt">
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Ea itaque laudantium, cum, praesentium impedit
											consequatur soluta ab explicabo mollitia, recusandae deserunt
											placeat similique dolorum ipsum vel aliquid? Praesentium, rem
											voluptate?</p>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="sc_content" id="sc_content">
						<a href="#">
							<div class="sc_section" id="sc_section">
								<div class="sc_article">
									<div class="sc_hd">
										<h3>만남 시간 줄이고 환기 자주하면 감염 위험 1/3까지 줄어</h3>
									</div>
									<div class="sc_dt">
										<p>2021-09-16</p>
									</div>
									<div class="sc_cnt">
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Ea itaque laudantium, cum, praesentium impedit
											consequatur soluta ab explicabo mollitia, recusandae deserunt
											placeat similique dolorum ipsum vel aliquid? Praesentium, rem
											voluptate?</p>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="sc_content" id="sc_content">
						<a href="#">
							<div class="sc_section" id="sc_section">
								<div class="sc_article">
									<div class="sc_hd">
										<h3>만남 시간 줄이고 환기 자주하면 감염 위험 1/3까지 줄어</h3>
									</div>
									<div class="sc_dt">
										<p>2021-09-16</p>
									</div>
									<div class="sc_cnt">
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Ea itaque laudantium, cum, praesentium impedit
											consequatur soluta ab explicabo mollitia, recusandae deserunt
											placeat similique dolorum ipsum vel aliquid? Praesentium, rem
											voluptate?</p>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="sc_content" id="sc_content">
						<a href="#">
							<div class="sc_section" id="sc_section">
								<div class="sc_article">
									<div class="sc_hd">
										<h3>만남 시간 줄이고 환기 자주하면 감염 위험 1/3까지 줄어</h3>
									</div>
									<div class="sc_dt">
										<p>2021-09-16</p>
									</div>
									<div class="sc_cnt">
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Ea itaque laudantium, cum, praesentium impedit
											consequatur soluta ab explicabo mollitia, recusandae deserunt
											placeat similique dolorum ipsum vel aliquid? Praesentium, rem
											voluptate?</p>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- scMain -->
		</div>
		<!-- sc -->
		<script src="resources/script/coinfo_news/coinfo_news.js"></script>
		<script src="resources/script/menu_bar/menu_bar.js"></script>
	</main>
</body>
</html>