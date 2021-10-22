<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>instagram</title>
    <link rel="stylesheet" href="resources/css/p_coronagram/common.css">
    <link rel="stylesheet" href="resources/css/p_coronagram/style.css">
    <link rel="stylesheet" href="resources/css/shop_add/shop_add.css">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
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
            <a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
          </li>
          <li>
            <a href="#" class="cm_userinfo">개인정보수정</a>
          </li>
      </div>
      <div class="cm_user_name">
						<c:if test="${!empty sMNo}">
							${sMNm}님 어서오세요.
						</c:if>
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


    <div id="main_container">

        <div class="product_form_container">
            <form action="#" class="product_form">
                <div class="title">
                    NEW PRODUCT
                </div>
                <div class="preview">
                    <div class="upload">
                        <div class="product_btn">
                            <div class="plus_icon">
                                <span></span>
                                <span></span>
                            </div>
                            <p>상품 이미지</p>
                            <canvas id="imageCanvas"></canvas>
                            <!--<p><img id="img_id" src="#" style="width: 300px; height: 300px; object-fit: cover" alt="thumbnail"></p>-->
                        </div>
                    </div>
                </div>
                <div class="upload_box">

                    <input type="file" class="temporaryFile" name="thumbnailImg[0]" onChange="temporaryFileTransmit(0);"
                        style="display:none;" />
                    <input type="file" class="temporaryFile" name="thumbnailImg[1]" onChange="temporaryFileTransmit(1);"
                        style="display:none;" />
                    <input type="file" class="temporaryFile" name="thumbnailImg[2]" onChange="temporaryFileTransmit(2);"
                        style="display:none;" />
                    <input type="file" class="temporaryFile" name="thumbnailImg[3]" onChange="temporaryFileTransmit(3);"
                        style="display:none;" />
                    <input type="file" class="temporaryFile" name="thumbnailImg[4]" onChange="temporaryFileTransmit(4);"
                        style="display:none;" />
                    <table>
                        <tr>
                            <th>이미지 업로드 : </th>
                            <td>
                                <a href="">
                                    <img class="thumbnailImg" src="resources/images/icon/plus.png" style="display:inline;" />
                                </a>
                                <a href="">
                                    <img class="thumbnailImg" src="resources/images/icon/plus.png" style="display:none;" />
                                </a>
                                <a href="" >
                                    <img class="thumbnailImg" src="resources/images/icon/plus.png" style="display:none;" />
                                </a>
                                <a href="">
                                    <img class="thumbnailImg" src="resources/images/icon/plus.png" style="display:none;" />
                                </a>
                                <a href="">
                                    <img class="thumbnailImg" src="resources/images/icon/plus.png" style="display:none;" />
                                </a>
                            </td>
                        </tr>
                    </table>

                </div>
                
                <p>
                    <label for="price" class="pri_label">상품명 : </label><input type="text" name="" id="price" class="pri_input"> 
                    <label for="price" class="pri_label">가격 : </label><input type="text" name="" id="price" class="pri_input"> 
                    <label for="price" class="pri_label">상품카테고리번호 : </label><input type="text" name="" id="price" class="pri_input"> 
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
    </section>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>