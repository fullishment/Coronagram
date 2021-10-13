<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>instagram</title>
    <link rel="stylesheet" href="../../resources/css/p_coronagram/common.css">
    <link rel="stylesheet" href="../../resources/css/p_coronagram/style.css">
    <link rel="stylesheet" href="../../resources/css/post_add/post_add.css">
    <link rel="stylesheet" href="../../resources/css/menu_bar/menu_bar.css">
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
        <div id="main_container">

            <div class="post_form_container">
                <form action="#" class="post_form">
                    <div class="title">
                        NEW POST
                    </div>
                    <div class="preview">
                        <div class="upload">
                            <div class="post_btn">
                                <div class="plus_icon">
                                    <span></span>
                                    <span></span>
                                </div>
                                <p>포스트 이미지 추가</p>
                                <canvas id="imageCanvas"></canvas>
                                <!-- <p><img id="img_id" src="#" style="width: 300px; height: 300px; object-fit: cover" alt="thumbnail"></p> -->
                            </div>
                        </div>
                    </div>
                    <p>
                        <input type="file" name="photo" id="id_photo" required="required"
                            accept="image/jpeg,image/gif,image/png" onchange="chk_file_type(this)">
                    </p>
                    <p>
                        <textarea name="content" id="text_field" cols="50" rows="5"
                            placeholder="140자 까지 등록 가능합니다. #태그명 을 통해서 검색 태그를 등록할 수 있습니다. 예시 : I # love # insta!"></textarea>
                    </p>
                    <div class="btn_area">
                        <input class="add_btn" type="submit" value="게시">
                        <input class="cancel_btn" type="submit" value="취소">
                    </div>
                </form>
            </div>
        </div>
    
    <script src="../../resources/script/menu_bar/menu_bar.js"></script>
    <script src="../../resources/script/post_add/post_add.js"></script>
</main>
</body>

</html>