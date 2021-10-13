<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css"><!-- css-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"> <!-- font-->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> <!-- jquery-->
    <link rel="stylesheet" href="resources/css/p_coronagram/common.css">
    <link rel="stylesheet" href="resources/css/p_coronagram/style.css">
</head>

<body>


    <section id="container">

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
        <div class="hidden_menu">
            <div class="scroll_inner">
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>

                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>

            </div>
        </div>


        <section id="main_container">
            <div class="inner">

                <div class="contents_box">
                    <article class="contents">
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name m_text">KindTiger</div>
                                    <div class="country s_text">Seoul, South Korea</div>
                                </div>
                            </div>
                            <div class="sprite_more_icon" data-name="more">
                                <ul class="toggle_box">
                                    <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>
                        </header>

                        <div class="img_section">
                            <div class="trans_inner">
                                <div><img src="resources/css/p_coronagram/imgs/img_section/img01.jpg" alt="visual01"></div>
                            </div>
                        </div>

                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                                </div>
                                <div class="sprite_bubble_icon"></div>
                                <div class="sprite_share_icon" data-name="share"></div>
                            </div>
                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                            </div>
                        </div>

                        <div class="likes m_text">
                            좋아요
                            <span id="like-count-39">2,346</span>
                            <span id="bookmark-count-39"></span>
                            개
                        </div>

                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="nick_name m_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                            <div class="small_heart">
                                <div class="sprite_small_heart_icon_outline"></div>
                            </div>
                        </div>

                        <div class="timer">1시간 전</div>

                        <div class="comment_field" id="add-comment-post37">
                            <input type="text" placeholder="댓글달기...">
                            <div class="upload_btn m_text" data-name="comment">게시</div>
                        </div>
                    </article>
                    <article class="contents">
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name m_text">KindTiger</div>
                                    <div class="country s_text">Seoul, South Korea</div>
                                </div>

                            </div>

                            <div class="sprite_more_icon" data-name="more">
                                <ul class="toggle_box">
                                    <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>
                        </header>

                        <div class="img_section">
                            <div class="trans_inner">
                                <div><img src="resources/css/p_coronagram/imgs/img_section/img01.jpg" alt="visual01"></div>
                            </div>
                        </div>

                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                                </div>
                                <div class="sprite_bubble_icon"></div>
                                <div class="sprite_share_icon" data-name="share"></div>
                            </div>
                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                            </div>
                        </div>

                        <div class="likes m_text">
                            좋아요
                            <span id="like-count-39">2,346</span>
                            개
                        </div>

                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="nick_name m_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                            <div class="small_heart">
                                <div class="sprite_small_heart_icon_outline"></div>
                            </div>
                        </div>

                        <div class="timer">1시간 전</div>

                        <div class="comment_field" id="add-comment-post37">
                            <input type="text" placeholder="댓글달기...">
                            <div class="upload_btn m_text" data-name="comment">게시</div>
                        </div>
                    </article>
                    <article class="contents">
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name m_text">KindTiger</div>
                                    <div class="country s_text">Seoul, South Korea</div>
                                </div>

                            </div>

                            <div class="sprite_more_icon" data-name="more">
                                <ul class="toggle_box">
                                    <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>
                        </header>

                        <div class="img_section">
                            <div class="trans_inner">
                                <div><img src="resources/css/p_coronagram/imgs/img_section/img01.jpg" alt="visual01"></div>
                            </div>
                        </div>

                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                                </div>
                                <div class="sprite_bubble_icon"></div>
                                <div class="sprite_share_icon" data-name="share"></div>
                            </div>
                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                            </div>
                        </div>

                        <div class="likes m_text">
                            좋아요
                            <span id="like-count-39">2,346</span>
                            개
                        </div>

                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="nick_name m_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                            <div class="small_heart">
                                <div class="sprite_small_heart_icon_outline"></div>
                            </div>
                        </div>

                        <div class="timer">1시간 전</div>

                        <div class="comment_field" id="add-comment-post37">
                            <input type="text" placeholder="댓글달기...">
                            <div class="upload_btn m_text" data-name="comment">게시</div>
                        </div>
                    </article>
                    <article class="contents">
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name m_text">KindTiger</div>
                                    <div class="country s_text">Seoul, South Korea</div>
                                </div>

                            </div>

                            <div class="sprite_more_icon" data-name="more">
                                <ul class="toggle_box">
                                    <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>
                        </header>

                        <div class="img_section">
                            <div class="trans_inner">
                                <div><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="visual01"></div>
                            </div>
                        </div>

                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                                </div>
                                <div class="sprite_bubble_icon"></div>
                                <div class="sprite_share_icon" data-name="share"></div>
                            </div>
                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                            </div>
                        </div>

                        <div class="likes m_text">
                            좋아요
                            <span id="like-count-39">2,346</span>
                            개
                        </div>

                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="nick_name m_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                            <div class="small_heart">
                                <div class="sprite_small_heart_icon_outline"></div>
                            </div>
                        </div>

                        <div class="timer">1시간 전</div>

                        <div class="comment_field" id="add-comment-post37">
                            <input type="text" placeholder="댓글달기...">
                            <div class="upload_btn m_text" data-name="comment">게시</div>
                        </div>
                    </article>



                </div>
                <input type="hidden" id="page" value="1">

                <div class="side_box">
                    <div class="user_profile">
                        <div class="profile_thumb">
                            <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진">
                        </div>
                        <div class="detail">
                            <div class="id m_text">KindTiger</div>
                            <div class="ko_name">심선범</div>
                        </div>
                    </div>

                    <article class="story">
                        <header class="story_header">
                            <div>스토리</div>
                            <div class="more">모두 보기</div>
                        </header>

                        <div class="scroll_inner">
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="recommend">
                        <header class="reco_header">
                            <div>회원님을 위한 추천</div>
                            <div class="more">모두 보기</div>
                        </header>

                        <div class="thumb_user">
                            <div class="profile_thumb">
                                <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id">kind_tigerrrr</div>
                                <div class="time">1시간 전</div>
                            </div>
                        </div>
                        <div class="thumb_user">
                            <div class="profile_thumb">
                                <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id">kind_tigerrrr</div>
                                <div class="time">1시간 전</div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>
    </section>
    <script src="resources/script/coronagram_main/coronagram_main.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script> <!-- script-->
</body>

</html>