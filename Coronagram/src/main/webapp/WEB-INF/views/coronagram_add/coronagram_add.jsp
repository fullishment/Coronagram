<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="../resources/css/coronagram_add/coronagram_add.css?after">
    <link rel="stylesheet" href="../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
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
        <section class="upload_sec">
            <div class ="upload_content">
                <div class="upload_area">
                    <div class="plus_icon">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="upload_text">
                        사진 및 동영상 파일을 끌어다 놓으세요
                    </div>
                </div>
            </div>
            <div class="input_sec">
                <div class="input_cont">
                    <div class="page_title">
                        <div class="page_cat cat_nm">
                            <i class="fas fa-user-alt"></i>
                            <span>게시판</span>
                        </div>
                        <div class="page_nm">
                            <span>게시물 추가하기</span>
                        </div>
                    </div>
                    <div class="input_area">
                        <div class="title_area">
                            <p class="title_nm add_text">제목</p>
                            <input type="text" id="post_title" class="post_title">
                        </div>
                        <div class="cont_area">
                            <p class="add_text">내용</p>
                            <textarea class="post_cont"></textarea>
                        </div>
                        
                        <div class="preview_sec">
                            <p class="add_text">미리보기</p>
                            <div class="preview_area">
                                <div class="preview">
                                    <i class="fas fa-times-circle close_prev"></i>
                                </div>
                                <div class="preview">
                                    <i class="fas fa-times-circle close_prev"></i>
                                </div>
                                <div class="preview">
                                    <i class="fas fa-times-circle close_prev"></i>
                                </div>
                                <div class="preview">
                                    <i class="fas fa-times-circle close_prev"></i>
                                </div>
                            </div>                        
                        </div>
                        <div class="btn_area">
                            <button href="#" type="button" class="add_btn">작성</button>
                            <button href="#" type="button" class="cancel_btn">취소</button>
                        </div>                      
                    </div> 
                </div>
            </div>
        </section>
    <script src="../resources/script/menu_bar/menu_bar.js"></script>
</body>
</html>