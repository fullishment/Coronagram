<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		reDraw();
    		
    		$("#addBtn").click(function(){
    			
	    			location.href="prodAdd";    				
    			
    		});
    		$("#findBtn").on("click",function(){
    			$("#searchGbn").val($("#searchGbnInp").val());
    			$("#searchTxt").val($("#searchInp").val());
    			reDraw();
    		});
    		$("tbody").on("click","#edit_btn",function(){
    			$("#no").val($(this).parent().parent().attr("no"));
    			$("#actionForm").attr("action","prodInfo");
    			$("#actionForm").submit();
    		});
    	});
    	function reDraw(){
    		var params=$("#actionForm").serialize();
    		$.ajax({
    			url : "adminShopLists",
    			type : "post",
    			dataType : "json",
    			data : params,
    			success : function(res){
    				drawList(res.list);
    			},
    			error : function(request, status, error){
    				console.log(error);
    			}
    		});
    	}
    	function drawList(list){
    		var html ="";
    		for(var data of list){
    		html+="<tr no=\""+data.PROD_NO+"\">                     ";
            html+="<td>"+data.PROD_NO+"</td>        ";
            html+="<td>"+data.M_NM+"</td>        ";
            html+="<td>"+data.CAT_NM+"</td>        ";
            html+="<td>"+data.PROD_NM+"</td>        ";
            html+="<td>"+data.POINT+"P</td>        ";
            html+="<td>"+data.SALE_STAT+"</td>        ";
            html+="<td>"+data.PROD_DT+"</td>        ";
            html+="<td><input type=\"button\"  value=\"수정\" id=\"edit_btn\"> <input type=\"button\"  value=\"삭제\" id=\"del_btn\"> </td>        ";
            
            html+="</tr>                    ";
    		}
    		$("tbody").html(html);
    	}
    </script>
    <style>
        html {
            background: #ecf0f1;
            width: 100%;
            height: 100%;
            
        }
        body{
        	
        }

        main {
            font-family: "Noto Sans KR", sans-serif;
            width: 100%;
            height: 100%;
            
        }

        .searchCon {
            margin-left: 20vw;
            margin-top: 100px;
            width: 60vw;
            min-width:800px;
            height: 20px;
            display: flex;
            justify-content: space-between;

        }
        .searchbox{
            padding-top: 11px;
        }

        .con1 {
            background-color: white;
            width: 60vw;
            min-width:800px;
            border-radius: 15px;
            border: 1px solid white;
            box-shadow: 0 1px 6px 0 rgb(32 33 36 / 28%);
            margin: 40px 20vw;
           
        }

        .user_box {
            border: solid 1px grey;
            width: 90%;
            text-align: center;
            border-collapse: collapse;
            padding: 0;
            margin: 20px auto;


        }

        table {
            border-radius: 15px;
        }

        tr,
        td,
        th {
        	
            border: 1px solid grey;
            padding: 4px;
        }
        .thList{
            height:50px;
            font-size:20px;
        }
        .th-1,.th-5,.th-6  {
            width:10%;
        }
        
        .th-3, .th-2,.th-4, .th-7{
            width:14%; 
        }
        .th-8{
        	width:14%;
        	min-width:135px;
        }
        
        
		#searchGbnInp{
			height:26px;	
			border: 2px solid #b7b7b7;
			border-radius: 15px;
		}
		
		#searchGbnInp:focus {
			height:26px;	
			outline: none;
  			border: 2px solid #64d488;
		}
		
		#searchInp{
			height:26px;	
			border: 2px solid #b7b7b7;
			border-radius: 15px;
			 font-size: 12px;
		}
		
		#searchInp:focus {
			height:26px;	
			outline: none;
  			border: 2px solid #64d488;		
		}
		
		.add_btn {
            display: inline-block;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
            width: 60px;
            height: 30px;
            border: none;
            border-radius: 7px;
            background: #0d6efd;
        }
        .add_btn:hover {
            opacity: .8;
        }
		
        .find_btn {
            display: inline-block;
            color: black;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
            width: 60px;
            height: 30px;
            border: none;
            border-radius: 7px;
            background: #ffc107;
        }

        .find_btn:hover {
            opacity: .8;
        }
        
         #edit_btn {
            display: inline-block;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
            width: 45px;
    		height: 27px;
            border: none;
            border-radius: 7px;
            background: #64d488;
            
            margin-bottom: 3px;
        }
        #edit_btn:hover {
            opacity: .8;
        }

        #del_btn {
            display: inline-block;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
             width: 45px;
    		height: 27px;
            border: none;
            border-radius: 7px;
            background: #dc3545;
        }
        #del_btn:hover {
            opacity: .8;
        }
    </style>
</head>
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
                    <a href="edit_profile" class="cm_userinfo">개인정보수정</a>
                </li>
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

<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="searchGbn" id="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="no" id="no" value="" />
	</form>
    <main>
        <div class="searchCon">
            <h1>상품 리스트</h1>
            <div class="searchbox">
            	<select id="searchGbnInp" name="searchGbnInp">
            		<option value="0">상품번호</option>
            		<option value="1">카테고리명</option>
            		<option value="2">상품명</option>
            		<option value="3">판매상태</option>
            	</select>
                <input type="text" id="searchInp" value="${param.searchGbn}"/> 
                <input type="button"  value="등록" class="add_btn" id="addBtn"/>
                <button class="find_btn" id="findBtn">검색</button>
            </div>
        </div>
        <div class="con1">
            <table class="user_box">
               
                    <thead>
                        <tr class="thList">
                            <th class="th-1">상품번호</th>
                            <th class="th-2">등록자 이름</th>
                            <th class="th-3">카테고리명</th>
                            <th class="th-4">상품명</th>
                            <th class="th-5">가격</th>
                            <th class="th-6">판매상태</th>
                            <th class="th-7">등록일</th>
                            <th class="th-8">수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                
            </table>
        </div>
    </main>
</body>

</html>