<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 배송 관리 페이지</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/admin_shop_mgt/admin_shop_mgt.css">
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
            <a href="#" class="cm_msg" id="cm_msg">Message</a>
            <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
            <div class="cm_dropdown">
                <a class="cm_dropbtn cm_dot" id="cm_dot"></a>
                <ul class="cm_dropdown-content">
                    <li>
                        <a href="#" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
                    </li>
                    <li>
                        <a href="#" class="cm_userinfo">개인정보수정</a>
                    </li>
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
        <nav>
            <div>
                <p id="adm_page">관리자페이지</p><br>
            </div>
            <div class="top_text">
                <h1>회원관리</h1>
                <div class="search_box">
                    <select id="dropbox" name="dropbox">
                        <option value="회원번호">회원번호</option>
                        <option value="ID" selected>ID</option>
                        <option value="이름">이름</option>
                        <option value="전화번호">전화번호</option>
                        <option value="이메일">이메일</option>
                        <option value="가입일">가입일</option>
                        <option value="보유포인트">보유포인트</option>
                        <option value="회원등급">회원등급</option>
                        <option value="관리">관리</option>
                    </select>
    
                    <input type="text" placeholder="검색어 입력">
                    <button class="search_btn">검색</button>
                </div>
            </div>
        </nav>
 
        <section>
            <div class="shop_mgt_title"><h3>상품 배송 관리</h3></div>
            <div class="side_box">
                <div class="cancel_select">
                    <span>배송 상태&nbsp;:&nbsp;</span>
                    <select id="ship_stat" name="ship_stat">
                        <option value="check1" checked>입금 확인 중</option>
                        <option value="check2">결제 완료</option>
                        <option value="check3">상품 준비 중</option>
                        <option value="check4">배송 준비 중</option>
                        <option value="check5">배송 중</option>
                        <option value="check5">배송 완료</option>
                    </select>
                </div>
                
                <table class="user_box">
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>카테고리 번호</th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>주문 회원번호</th>
                                <th>전화번호</th>
                                <th>주소</th>
                                <th>구매일</th>
                                <th>배송 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" class="chk"></td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Lorem</td>
                                <td>결제 완료</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="chk"></td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Lorem</td>
                                <td>배송 완료</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="chk"></td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Ipsum</td>
                                <td>Dolor</td>
                                <td>Lorem</td>
                                <td>Lorem</td>
                                <td>배송 완료</td>
                            </tr>
                        </tbody>
                </table>
                <button href="#" type="button" class="edit_btn">수정</button>
            </div>
        </section>
        <nav>
            <div class="shop_mgt_nav2">
                <div class="shop_mgt_title">
                    <h3>구매 취소 신청 목록</h3>
                </div>
                    <div class="cancel_dt">
                        <input type="date" id="cancel_dt1">
                        <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                        <input type="date" id="cancel_dt2">
                    </div>
                    <div class="cancel_box">
                        <select id="cancel_box" name="cancel_box">
                            <option value="c1">카테고리 번호</option>
                            <option value="c2" selected>ID</option>
                            <option value="c3">상품 번호</option>
                            <option value="c4">상품 명</option>
                            <option value="c5">주문 회원 번호</option>
                            <option value="c6">전화 번호</option>
                            <option value="c7">주소</option>
                            <option value="c8">구매 일</option>
                            <option value="c9">취소 여부</option>
                        </select>
                        <input type="text" placeholder="검색어 입력">
                        <button class="search_btn">검색</button>
                    </div>
            </div>
        </nav>
       <section>
        <div class="side_box">
            <div class="cancel_select">
                <span>취소 여부&nbsp;:&nbsp;</span>
                <select id="ship_stat" name="ship_stat">
                    <option value="cancel1" checked>취소 대기중</option>
                    <option value="cancel2">취소 완료</option>
                    <option value="cancel3">취소 불가</option>
                </select>
            </div>
            <table class="user_box">
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>카테고리 번호</th>
                            <th>상품 번호</th>
                            <th>상품 명</th>
                            <th>주문 회원 번호</th>
                            <th>전화 번호</th>
                            <th>주소</th>
                            <th>구매 일</th>
                            <th>취소 여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <label for="cb1"></label>
                                <input type="checkbox" id="cb1" class="chk">
                            </td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>취소 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="chk"></td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>취소 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="chk"></td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>취소 대기중</td>  
                        </tr>
                    </tbody>
            </table>
            <button href="#" type="button" class="edit_btn">수정</button>
        </div>
       </section>
        <!-- <table>
            <c:forEach items = "${}" var = "member">
               <tr>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
                 <td>${}</td>
               </tr>
            </c:forEach>
        </table> -->
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>