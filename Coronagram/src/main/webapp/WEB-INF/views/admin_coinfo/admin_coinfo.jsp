<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="../../resources/css/admin_coinfo/admin_coinfo.css">
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
                                    <div class="QnaTitle">
                                        <div>
                                            <span>제목</span><input class="border" type="text" placeholder="내용을 입력하세요">
                                        </div>
                                        <div>
                                            <span>소제목</span><input class="border" type="text" placeholder="내용을 입력하세요">
                                        </div>
                                    </div>
                                </div>
                                <div class="qnaMain">
                                    <div class="QnaCon">
                                        <p>내용</p><textarea class="QCI" class="border" type="text" placeholder="내용을 입력하세요"></textarea>
                                    </div>
                                    <div class="qnaBtn">
                                        <button class="qnaBtn2">취소</button>
                                        <button class="qnaBtn1">저장</button>
                                    </div>
                                </div>
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
                                            <button class="qnaBtn2">취소</button>
                                            <button class="qnaBtn1">저장</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- sc-form -->
                    </div><!-- sc-html -->
                </div> <!-- sc-form -->
            </div>
    </main>

    <script src="../../resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>