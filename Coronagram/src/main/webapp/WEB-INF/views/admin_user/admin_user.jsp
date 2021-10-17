<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/admin_user/admin_user.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			redrawList();
			$("tbody").on("click","#dtlBtn",function(){
				$("#m_no").attr("no",$(this).parent.attr("no"));
				$("#actionForm").attr("action","주소");
				$("#actionForm").submit();
			});
		});
		function redrawList(){
	    	var params=$("#actionForm").serialize();
	    	$.ajax({ 
				url : "adminUsers",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					listDraw(res.list);
					drawPaging(res.pb);
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }
		function listDraw(list){ 
			var html ="";
			for(var data of list){
				html+="		<tr no=\""+data.M_NO+"\">                 ";
			    html+="       <td>"+data.M_NO+"</td>     ";
			    html+="       <td>"+data.M_ID+"</td>     ";
			    html+="       <td>"+data.M_NM+"</td>     ";
			    html+="       <td>"+data.PHONE+"</td>     ";
			    html+="       <td>"+data.EMAIL+"</td>     ";
			    html+="       <td>"+data.M_DT+"</td>     ";
			    html+="       <td>"+data.POINT+"</td>     ";
			    html+="       <td>"+data.ACCT_TYPE_NO+"</td>     ";
			    html+="       <td><input type=\"button\" id=\"dtlBtn\"></input></td>     ";
			    html+="   </tr>                  ";
			}
			$("tbody").html(html);
		}
		

		function drawPaging(pb){
			var html = "";
			
			html += "<span page=\"1\">처음</span>     ";
			
			if($("#page").val() == "1"){
				html += "<span page=\"1\">이전</span>     ";
			} else {
				html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>   ";
			}
			// *1을 하면 자동 숫자변환
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
				if($("#page").val() == i){
					html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
				} else {
					html += "<span page=\"" + i + "\">" + i + "</span>		  ";
				}
			}
			
			if($("#page").val() == pb.maxPcount){
				html += "<span page=\"" + pb.maxPcount + "\">다음</span>     ";
			} else {
				html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>     ";
			}
			
			html += "<span page=\"" + pb.maxPcount + "\">마지막</span>   ";
			
			$(".paging_wrap").html(html);
		}
		
		
	</script>
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
		<form action="#" id="actionForm">
			<input type="hidden" name="m_no" id="m_no">
		</form>
        <div class="side_box">
            <table class="user_box">
                    <thead>
                        <tr >
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
                   
            </table>
			 
        </div>
        
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>