<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="../../resources/css/admin_user/admin_user.css">
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
        <div>
            <h4 id="adm_page">관리자페이지</h4>
        </div>
        <div class="top_text">
            <h2>회원관리</h2>
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
                <input class="border" type="text" placeholder="검색어 입력">
                <button class="search_btn">검색</button>
            </div>

        </div>

        <div class="side_box">
            <table class="user_box">
                <c:forEach items="${}" var="member">
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
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                        <tr>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                            <td>Lorem</td>
                            <td>Ipsum</td>
                            <td>Dolor</td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>

        </div>
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

    <script src="../../resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>