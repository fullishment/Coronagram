<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 배송 관리 페이지</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/prod_shipping/prod_shipping.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
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
    <form action="#" id="actionForm">
    	<input type="hidden" name="sMNo" id="sMNo" value="${sMNo}">
    	<input type="hidden" name="startDate" id="startDate" value="">
    	<input type="hidden" name="endDate" id="endDate" value="">
    </form>
        <nav>
            <div class="top_text">
                <h1>주문/배송 조회</h1>
            </div>
            <div>
                <ul class="bc">
                    <li class="bc_item">주문접수</li>
                    <li class="bc_item">상품 준비중</li>
                    <li class="bc_item">배송 준비중</li>
                    <li class="bc_item">배송중</li>
                    <li class="bc_item">배송 완료</li>
                  </ul>
            </div>
        </nav>
        <section>
            <div class="order_box">
                <div class="cancel_select">
                    <div class="order_list">

                        <input type="date" id="order_list1" name="date1" >
                        <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                        <input type="date" id="order_list2" name="date2" >
                    <button class="btn" id="dataBtn"><p>조회</p></button>
                    </div>
                    <br>
                    <span><h3>주문 내역</h3></span>
                    <br>
                </div>
                <div class="gbn"></div>
                <table class="user_box">
                        <thead>
                            <tr>
                                <th>카테고리 번호</th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>주문자명</th>
                                <th>주소</th>
                                <th>구매일</th>
                                <th>배송 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                           <div class="notlogin">
                           		<p>로그인 이후 사용가능합니다</p>
                           </div>
                        </tbody>
                </table>
            </div>
        </section>
        <nav>
        </nav>
       <section>
        <div class="order_box">
            <div>
                <span><h3>주문 공통</h3></span>
                <br>
            </div>
            <div class="order_dtl1">
                <ul class="">
                    <li>주문하신 상품마다 배송 및 도착 날짜가 서로 다를 수 있습니다.</li>
                    <li>일요일 및 공휴일에는 배송하지 않습니다.</li>
                    <li>주문 취소는 주문 취소 버튼을 클릭하여 작성하시거나 고객센터를 통해 주문 취소 신청을 해  주시기 바랍니다.</li>
                    <li>주문 취소가 가능한 단계에서만 주문취소 버튼이 표시됩니다.</li>
                    <li>반품은 고객센터를 통해서만 처리가 가능합니다.</li>
                </ul>
            </div>
            <br>
            <br>
            <div>
                <span><h3>주문 상세</h3></span>
                <br>
            </div>
            <div class="order_dtl2">
                <ul>
                    <li>
                        주문 접수
                        <p>주문 신청 및 결제가 완료된 상태입니다. 주문 정보를 수정/ 취소 하시려면 <br> '나의쇼핑>주문/배송조회' 메뉴 또는 고객센터로 연락해 주세요.</p>
                    </li>
                    <li>
                        상품 준비중
                        <p>주문하신 상품을 준비중인 상태입니다. 주문 정보를 수정/ 취소 하시려면 <br> '나의쇼핑>주문/배송조회' 메뉴 또는 고객센터로 연락해 주세요.</p>
                    </li>
                    <li>
                        배송 준비중
                        <p>배송 준비중 단계에서는 상품이 물류센터에 이동을 시작하였기 때문에 주문정보 <br> 수정/ 취소가 불가합니다. 배송상세 버튼을 클릭하시면 상세진행 현장을 확인 하실 수 있습니다.</p>
                    </li>
                    <li>
                        배송 중
                        <p>주문하신 상품 전체(또는 일부)의 배송이 시작된 상태입니다. <br> 배송상세 버튼을 클릭하시면 상세 진행 현장을 확인하실 수 있습니다.</p>
                    </li>
                    <li>
                        배송 완료
                        <p>주문하신 상품이 배송지로 전달 완료된 상태입니다.</p>
                    </li>
                </ul>
            </div>
        </div>
       </section>
    </main>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
    <script src="resources/script/prod_shipping/prod_shipping.js"></script>
</body>

</html>