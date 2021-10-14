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
    <link rel="stylesheet" href="resources/css/prod_dtl/prod_dtl.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	redrawOpt();
	   var point= parseInt(${data.POINT});
	   $(".qt-plus").click(function(){
	   	var qt = parseInt($("#qt").html());
	       $("#qt").html( qt + 1 );
	       $("#total").html(point * parseInt($("#qt").html()));
	   });
	
	   $(".qt-minus").click(function(){
	   	var qt = parseInt($("#qt").html());
	       $("#qt").html( qt - 1);
	       $("#total").html(point * parseInt($("#qt").html()));
	       
	   });
    	$("#cartBtn").click(function(){
    		$("#priceInp").val($(".color_L p").html());
    		$("#unitInp").val($("#color").val());
    		$("#qtInp").val($("#qt").html());
    		var params = $("#addForm").serialize();
			$.ajax({ 
				url : "cartAdd", 
				type : "post", 
				dataType : "json", 
				data : params, 
				success : function(res){ 
					if(res.result == "success"){
						location.href="shop";
					}else if(res.result == "failed"){
						alert("작성에 실패했습니다");
					}else {
						alert("작성중 문제가 발생했습니다");
						console.log(result);
					}
				},
				error : function(request, status, error){ 
					console.log(error);
				}
			});
   		});
    })
   	function imgdraw(list){
    	var html = "";
    	for(var data of list){
	    	html+="<li>                                                      ";
	    	html+="	<a href=\"#abc\" onmouseover=\"changeImage()\">             ";
	        html+="		<img src=\"resources/images/etc/msk1.jpg\" alt=\"\" />  ";
	        html+="	</a>                                                    ";
	        html+="</li>                                                     ";
    		
    	}
		
    }
    function changeImage() {
    	$("#mainImage").src = $(this).children(img).attr("src");
    }
    function redrawOpt(){
    	var params = $("#addForm").serialize();
		$.ajax({ 
			url : "prodDetails",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				drawOpt(res.opt);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
    function drawOpt(list){
    	var html = "";
    	var same= new Array();
    	var i = 0;
    	for(var data of list){   
    		var key = data.UNIT;
    		if(same.indexOf(data.UNIT) < 0){
    			html+= "<div class=\"opt_box\">";
		    	html +="	<div class=\"color_L\"><p>"+data.UNIT+"</p></div>                ";
		        html +="	<div class=\"color_R\">                                    ";
		        html +="		<select name=\"color\" id=\"color\" class=\"select_color\">";
		        html += 			drawSelectOpt(key ,list);
		        html +="		</select>                                            ";
		        html +="	</div>                                                   ";
		        html +="	</div>                                                   ";
    		}
    		same[i] = data.UNIT;
    		i++;

    	}
    	$(".dtl_color").html(html);
    }
    function drawSelectOpt(key,list){
    	var html = "";
    	for(var data of list){
    		if(data.UNIT == key){
    			html += "<option value=\""+data.PRICE+"\" selected>"+data.PRICE+"</option>" ;
    		}
    	}
    	return html;
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
    <!-- 메인 -->
    <main>
        <div class="wrapper">
            <div class="mainContent">
                <div class="firstCont">
                    <div class="thumbsCont">
                        <ul class="thumbs" id="imgBox">
                            <li><a href="#abc" onmouseover="changeImage(img1src)">
                                    <img src="resources/images/etc/msk1.jpg" alt="" /></a></li>

                            <li><a href="#abc" onmouseover="changeImage(img2src)">
                                    <img src="resources/images/etc/msk2.jpg" alt="" /></a></li>

                            <li><a href="#abc" onmouseover="changeImage(img3src)">
                                    <img src="resources/images/etc/msk3.jpg" alt="" /></a></li>
                            <li><a href="#abc" onmouseover="changeImage(img4src)">
                                    <img src="resources/images/etc/msk4.jpg" alt="" /></a></li>
                        </ul>
                    </div>
                </div>
                <div class="leftCont">
                    <div class="imagesCont">
                        <div class="mainImageCont">
                            <img id="mainImage" src="resources/images/etc/msk1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="rightCont">
                    <div class="detailsCont">
                        <div class="dtl">
                            <!--이름 -->
                            <div class="dtl_title">
                                <h1> ${data.PROD_NM}</h1>
                            </div>
                            <div class="dtl_text">
                                <p>${data.CON}</p>
                            </div>
                        </div>
                        <br>
                        <div class="price"><!--가격 -->
                            <div class="price1"><p>판매가</p></div>
                            <div class="price2"><p><span>${data.POINT}</span> P</p></div>
                        </div>
                        <br>
                        <div class="dtl_option"><!--옵션 -->
                            <div class="dtl_color">
                            </div>
                            <div class="dtl_cnt">
                                <div class="cnt_L"><p>수량</p></div>
                                <div class="cnt_R">
                                    <span class="qt-minus">-</span>
                                    <span class="qt" id ="qt">1</span>
                                    <span class="qt-plus">+</span>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="gbn"></div>
                        <br>
                        <div class="full_price"><!--총 가격 -->
                            <div class="price1"><p>총금액</p></div>
                            <div class="price2"><p ><span id="total">${data.POINT}</span> P</p></div>
                        </div>
                        <br>
                        <div class="gbn"></div>
                        <br>
                        <form action="#" id="addForm">
                        	<input type="hidden" name="prodNo" id="prodNo" value="${data.PROD_NO}">
                        	<input type="hidden" name="sMNo" id="sMNo" value="${sMNo}">
                        	<input type="hidden" name="price" id="priceInp">
                        	<input type="hidden" name="unit" id="unitInp">
                        	<input type="hidden" name="qt" id="qtInp">             
                        </form>
                        <div class="otherLinksCont">
                        	<ul class="otherLinks">
                               	<li class="btn_L" id="cartBtn"><a href="#"><p>장바구니</p></a></li>
                                <li class="btn_R" id="buyBtn"><a href="#"><p>바로구매</p></a></li>
                            </ul>
                        	<%-- <c:choose>
                        	<c:when test="${!empty sMNo}">
                        		<ul class="otherLinks">
                               	<li class="btn_L"><a href="#"><p>장바구니</p></a></li>
                                <li class="btn_R"><a href="#"><p>바로구매</p></a></li>
                            </ul>
                            </c:when>
	                        	<c:otherwise>
		                           	<div class="loginBtn">로그인</div>
	                        	</c:otherwise>
                        	</c:choose> --%>
                        </div>

                    </div>
                </div>
    </main>
    <script src="resources/script/prod_dtl/prod_dtl.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>