<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/qna/qna.css?after">
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
    <main>
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>고객센터</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked><label for="tab-1" class="tab"><p>FAQ</p></label>
                    <input id="tab-2" type="radio" name="tab" class="scm2"><label for="tab-2" class="tab"><p>Q&A</p></label>
                    <input id="tab-3" type="radio" name="tab" class="scm3"><label for="tab-3" class="tab"><p>문의내역</p></label>
                    <div class="sc-form">
                        <div class="scm1-htm">
                            <label for="user" class="sclabel"><p>자주 묻는 질문</p></label>
                            <div class="group">
                                <div class="scImg"></div>
                                <div class="scMain" id="scMain">
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis, laborum ex, eligendi tempore harum saepe, ea corporis at totam ipsum eum inventore veniam itaque fuga repudiandae sit voluptatibus. Error, rerum.
                                        </p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi neque in architecto eaque velit eum distinctio aliquid pariatur laboriosam tempore? Veniam at exercitationem quaerat consectetur nostrum, ea ipsam optio saepe?</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                    <button class="scQ">Q. 왜이리 어렵나요</button>
                                    <div class="scA">
                                        <p>A. 나도 몰라요</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="scm2-htm">
                            <label for="user" class="sclabel"><p>1:1문의하기</p></label>
                            <div class="group">
                                <div class="qnaMain">
                                    <div class="QnaTitle">
                                        <p>제목</p><input class="QTI">
                                    </div>
                                </div>
                                <div class="qnaMain">
                                    <div class="QnaCon">
                                        <p>내용</p><textarea class="QCI"></textarea>
                                    </div>
                                    <div class="qnaBtn">
                                        <button href="#" type="button" class="add_btn">작성</button>
                                        <button href="#" type="button" class="cancel_btn">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="scm3-htm">
                            <label for="user" class="sclabel"><p>문의내역</p></label>
                            <div class="group">
                                <div class="qnaList">
                                    <table class="scmL" border="1">
                                        <thead class="scmLT">
                                            <tr>
                                                <th><p>번호</p></th>
                                                <th><p>제목</p></th>
                                                <th><p>등록일</p></th>
                                                <th><p>현황</p></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <!-- <table>
                                        <tr>
                                            <th>1</th>
                                            <td><a href="file:///C:/base/coronagram/view/qna/myqna.html">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td class="check0">확인중</td>
                                        </tr>
                                        <tr>
                                            <th>2</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                        </tr>
                                        <tr>
                                            <th>3</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td class="check1">답변완료</td>
                                        </tr>
                                        <tr>
                                            <th>4</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td style="color: green;">답변완료</td>
                                        </tr>
                                        <tr>
                                            <th>5</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td class="check1">답변완료</td>
                                        </tr>
                                        <tr>
                                            <th>6</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td class="check1">답변완료</td>
                                        </tr>
                                    </table> -->
                                </div>
                            </div>
                        </div>
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-form -->
        </div>
    </main>
        <script src="resources/script/qna/qna.js"></script>
        <script>
            //목록 그리기
      function drawList(list){
         var html ="";
         
         for(var data of list){
            html += "<tr no=\""+NO+"\">";
            html += "<td>"+TITLE+"</td>";
            html += "<td>"+DATE+"</td>";
            html += "<td>"+CHECK
            if(data.CHECK == OK){
               html +="<td style=\"color: green;\"/>";
            }
            html += "</td>";
         }
         
         
         $("tbody").html(html);
      }

        </script>
    </body>
    
    </html>
