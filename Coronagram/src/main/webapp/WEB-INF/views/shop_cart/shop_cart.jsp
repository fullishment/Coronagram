<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/shop_cart/shop_cart.css?after">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Mono:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
    <script type="text/javascript">
    $(document).ready(function(){
    	redrawCartList();
    	$("#delBtn").on("click",function(){
    		delCart();
    	});
    	$("#allCheck").on("click",function(){
    		if($("#allCheck").prop("checked")) {
                $("input[type=checkbox]").prop("checked",true);
                $("#delBtn").css({"border-color":"red","color":"red"});
            } else {
                $("input[type=checkbox]").prop("checked",false);
                $("#delBtn").css({"border-color":"#ccc","color":"#ccc"});
            }
    	});
    	$("#cartList").on("click",".check_btn",function(){
    		var total = $("input[name=cartCheck]").length;
    		var checked = $("input[name=cartCheck]:checked").length;
			console.log(checked);
    		if(total != checked){
    			$("#allCheck").prop("checked", false);
    		}else {
    			$("#allCheck").prop("checked", true);
    		}
    		if(checked>=1){
    			$("#delBtn").css({"border-color":"red","color":"red"});
    		}else{
    			$("#delBtn").css({"border-color":"#ccc","color":"#ccc"});
    		}
    	});
    	
    	
    	$("#addr_btn").on("click",function(){
    		cm_execDaumPostcode();
    	});
    	
    	
    	$("#cartList").on("click",".qt-plus",function(){
    	   var qt = parseInt($(this).prev().html());
    	   var no = parseInt($(this).prev().attr("no"));
    	   var cnt = $("#totalCnt").html().substring(0,$("#totalCnt").html().length-1);
    	   cnt = (cnt*1)+1;
    	   $(this).prev().html(qt + 1);
    	   $(this).prev().attr("no",no+1);
    	   var total = parseInt($("#totalP").html());
    	   $("#totalP").html( total + (parseInt($(this).parent().next().children().html())));
    	   $("#totalPInp").val(parseInt($("#totalP").html()));
    	   $("#totalCnt").html(cnt+"개");
    	  
    	   
    	   
    	   
   	   	});
    	
   	   	$("#cartList").on("click",".qt-minus",function(){
   	   		var qt = parseInt($(this).next().html());
   	   		var no = parseInt($(this).next().attr("no"));
	   	   	var cnt = $("#totalCnt").html().substring(0,$("#totalCnt").html().length-1);
	 	   	cnt = (cnt*1)-1;
   	   		
   	   		if(qt > 1){ 
   	   			
	   	   		$(this).next().html(qt - 1);
	   	   		$(this).next().attr("no",no-1);
		   	   	var total = parseInt($("#totalP").html());
	 	   		$("#totalP").html( total - (parseInt($(this).parent().next().children().html())));
	 	   		$("#totalPInp").val(parseInt($("#totalP").html()));
	 	   		$("#totalCnt").html(cnt+"개");
   	   		}
    	});
    	   
    	   
    	
   
    
    
    $("#orderBtn").click(function(){
    	$("#totalPInp").val(parseInt($("#totalP").html()));
    	var totalP= $("#totalPInp").val();
    	var mP= parseInt($("#mPoint").html());
    	var resultP= mP-totalP;
    	console.log(resultP);
    	$("#totalPInp").val(resultP);
		if(checkVal("#cm_postcode")){
			alert("우편번호를 입력해주세요");
		}else if(checkVal("#cm_address")){
			alert("주소를 입력해주세요");
		}else if(checkVal("#cm_detailAddress")){
			alert("상세주소를 입력해주세요");
		}else if(resultP<0){
			alert("보유한 포인트가 부족합니다.");
		}else if(confirm("주문하시겠습니까?")){
			var sccnt = 0;
    		var cnt = parseInt($("#totalCnt").html());
    		var flag = 0;
   			for(var i=0; i<cnt; i++){
 						var params=$("#orderForm").serialize();
 				    	$.ajax({ 
 							url : "orderAdd",
 							type : "post",
 							dataType : "json",
 							data : params,
 							success : function(res){
 								sccnt++;
 								if(sccnt==cnt){
 						 			var rescnt=0;
 						 			for(var j=0;j<cnt;j++){
 						 				$("#noIndex").val(cnt-j);
	 						 			$("#pNoIn").val($("#pno"+j).val());
	 			 						$("#optNoIn").val($("#ono"+j).val());
	 			 						$("#qNoIn").val($("#qt"+j).attr("no"));
	 			 						var paramss=$("#orderForm").serialize();
	 						 			$.ajax({ 
	 							    		url : "orderAdds",
	 							    		type : "post",
	 							    		dataType : "json",
	 							    		data : paramss,
	 							    		success : function(res){
	 							    			if(res.result == "success"){
	 							    				rescnt++;
	 							    				if(rescnt==cnt){
	 							    					$.ajax({
	 							    						url : "cartAllDel",
	 				 							    		type : "post",
	 				 							    		dataType : "json",
	 				 							    		data : params,
	 				 							    		success : function(res){
	 				 							    			location.href="prodShipping"
	 				 	
	 				 							    		},
	 				 							   			error : function(request, status, error){
	 				 							       			console.log(error);
	 				 							       		}
	 							    					});
	 							    				}
	 							    			}
	 							    		},
	 							   			error : function(request, status, error){
	 							       			console.log(error);
	 							       		}
	 						   			});
 						 				
 						 			}
 					   			}
 							},
 							error : function(request, status, error){
 				   				console.log(error);
 				   			}
 						});
   				

			}
   			
   			
		}
    });
});
    function checkVal(sel){
    	if($.trim($(sel).val())==""){
    		return true;
    	}else{
    		return false;
    	}
    };
    function cm_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }

                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("cm_detailAddress").value = extraAddr;
                
                } else {
                    document.getElementById("cm_detailAddress").value = '';
                }

                document.getElementById('cm_postcode').value = data.zonecode;
                document.getElementById("cm_address").value = addr;
                document.getElementById("cm_detailAddress").focus();
            } 
        }).open();
    }
    function delCart(){
    	var valueArr = new Array();
    	var inp = $("input[name=\"cartCheck\"]");
    	for(var i = 0 ; i< inp.length; i++){
    		if(inp[i].checked){
    			valueArr.push(inp[i].value);
    		}
    	}
    	if(valueArr.length == 0){
    		alert("선택된 상품이 없습니다");
    	}else{
    		var chk = confirm("정말 삭제하시겠습니까?");
    		$.ajax({
    			url : "cartDel",
    			type : "post",
    			dataType : "json",
    			data : {
    				valueArr : valueArr
    			},
    			success : function(res){
    				if(res.result=="success"){
    					alert("삭제성공");
    					redrawCartList();
    					$("#delBtn").css({"border-color":"#ccc","color":"#ccc"});
    				}else if (res.result=="failed"){
    					alert("삭제에 실패했습니다");
    				}else{
    					alert("삭제중 문제가 발생했습니다");
    					console.log(result);
    				}
    			},
    			error : function(request, status, error){ 
					console.log(error);
				}
    		});
    	}
    }
    
    
    
    function redrawCartList(){
    	var params=$("#actionForm").serialize();
    	$.ajax({ 
			url : "shopCarts",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				drawCartList(res.list,res.cnt,res.mP);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
    function drawTotal(list,mno){
    	var html="";
    	html +="<div class=\"entire_item\"><span>전체 상품</span><span>"+cnt.CNT+"개</span></div>";
	    html +="<div class=\"order_price\"><span>주문 금액</span><span>"+total+"P</span></div>";
	    html +="<div class=\"order_price\"><span>보유 포인트</span><span>"+cnt.POINT+"P</span></div>";
	    
    	
    } 
    function drawCartList(list,cnt,mP){
    	var html="";
    	var total=0;
    	var totalhtml = "";
 		var i=0;
    	for(var data of list){
    			html+="<div class=\"lcon2_up\">								";
    			html+="<input type=\"hidden\" name=\"cno"+i+"\" value=\""+data.CART_NO+"\" id=\"cno"+i+"\">";
    			html+="<input type=\"hidden\" name=\"pno"+i+"\" value=\""+data.PROD_NO+"\" id=\"pno"+i+"\">";
    			html+="<input type=\"hidden\" name=\"ono"+i+"\" value=\""+data.OPT_NO+"\" id=\"ono"+i+"\">";
    		html+="	<div class=\"round\">                     ";
			html+="	<input type=\"checkbox\"  value=\""+data.CART_NO+"\"id=\"checkbox"+i+"\" name=\"cartCheck\" class=\"check_btn\"/>    ";
			html+="	<label for=\"checkbox"+i+"\"></label>              ";
			html+="	</div>                                      ";
   				//html+="<input type=\"checkbox\" name=\"cartCheck\" class=\"check_btn\" value=\""+data.CART_NO+"\"id=\"checkbox"+i+"\">						";
   				//html+="<label for=\"checkbox"+i+"\"></label>"
				html+="<div class=\"up_con1\"><img alt=\"\" src=\"resources/upload/"+data.FILE_ADDR+"\"></div>                                             ";
				html+="<div class=\"up_con2\">                                                   ";
				html+="   	<div class=\"con2_title\">"+data.PROD_NM+"</div>                   ";
				html+="		<div class=\"con2_subtitle\">"+data.CON+"</div>                       ";
				html+="		<div class=\"con2_color\"><p>"+data.UNIT+" : "+data.PRICE+"</p></div>  ";             
				html+="	</div>                                                              ";
				html+="	<div class=\"up_con3\">                                               ";
				html+="		<span class=\"qt-minus\">-</span>                                     ";
				html+="		<span class=\"qt\" id =\"qt"+i+"\" no=\"1\">1</span>                                           ";
				html+="		<span class=\"qt-plus\">+</span>                                      ";
				html+="	</div>                                                                  ";
				html+="		<div class=\"up_con4\">                                               ";
				html+="  			<p>"+data.POINT+"P</p>                                      ";
				html+="	</div>                                                                  ";
				html+="</div>                                                                   ";
				total += data.POINT;
				i++;
    	}
    	totalhtml +="<div class=\"entire_item\"><span>Total Product</span><span id=\"totalCnt\">"+cnt.CNT+"개</span></div>";
	    totalhtml +="<div class=\"order_price\"><span>Order Price</span><span id=\"totalP\">"+total+"</span></div>";
	    totalhtml +="<div class=\"order_price\"><span>Point</span><span id=\"mPoint\">"+mP.POINT+"P</span></div>";
	    
	    $("#totalPInp").val(total);
	    
    	$("#rcon2_con2").html(totalhtml);
    	$("#cartList").html(html);
    }
    
    </script>
    
</head>

<body>
    <header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      	<a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      	<c:choose>
      		<c:when test="${acctNo eq 6}">
      			<a href="admin_main" class="cm_admin" id="cm_admin">AdminPage</a>
      		</c:when>
      		<c:otherwise>
      			
      		</c:otherwise>
      	</c:choose>
      	<a href="#" class="cm_home" id="cm_home">Home</a>
      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      	<div class="cm_dropdown">
        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        	<ul class="cm_dropdown-content">
	          	<li>
	            	<c:choose >
	          			<c:when test="${empty sMNo}">
	            			<a href="login" class="cm_logIn"><i class="cm_icon-logIn"></i> <span>로그인</span> </a>
	            		</c:when>
	            	<c:otherwise>
	            			<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
	            	</c:otherwise>
	            	
	            	</c:choose>
	          	</li>
	          	<li>
	          		<c:choose>
	          			<c:when test="${empty sMNo}">
	            		</c:when>
	            		<c:otherwise>
	            			<a href="coronagram/${sMNick}" class="cm_userinfo">마이페이지</a>
	            		</c:otherwise>
	            	</c:choose>
	          	</li>
          	</ul>
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
          <a href="http://localhost:3000">국내</a> <br>
          <a href="MapAPI">해외</a>
        </ul>
      </a>
      <a href="coinfo_main" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_info"></div>Corona Info
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coinfo_infolist">관련 정보</a> <br>
          <a href="coinfo_step">거리두기</a> <br>
          <a href="coinfo_news">News</a>
        </ul>
      </a>
      <a href="coronagram" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coronagram/${sMNick}">개인 페이지</a> <br>
          <a href="calendar">출석 체크</a> <br>
          <a href="https://coronagram-zoom.herokuapp.com/">Zoom</a>
        </ul>
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_qna"></div>Service Center
        <ul class="cm_mcon" id="cm_mcon">
          <a href="qna">Q&A</a><br>
        </ul>
      </a>
    </div>
  </header>

    <main>
    <form action="#" id="actionForm" method="post">
		<input type="hidden" name="sMNo" id="sMNo" value="${sMNo}" />
	</form>
        <section id="main">
            <div class="main-left">
                <div class="lcon1">
                    <div class="input_box">
                        <h1>장바구니</h1>
                        <div class="check_all">
    						<input type="checkbox"  name="allCheck" id="allCheck" />
    						<label for="allCheck"></label> 
    						<p>전체선택</p>
  						</div>
                        <!-- <div  class="check_all">
                            <input type="checkbox" name="allCheck" id="allCheck"><label>&nbsp;&nbsp;전체선택</label>
                        </div> -->
                    </div>
                    <button class="seldel_btn" id="delBtn">
                        <span>삭제</span>
                    </button>
                </div>
                <div class="lcon2">
                <div class="cart_list" id="cartList">
                    
                </div>
                    <div class="lcon2_down">
                        <div class="down_con1">
                            <p>장바구니 상품은 30일간 보관됩니다</p>
                        </div>
                    </div>
                </div>
                <div class="lcon3"></div>
            </div>
            <div class="main-right">
                <div class="rcon1">

                </div>
                <div class="rcon2">
                    <div class="rcon2_con1">
                        <form action="#" id="orderForm" method="post">
	                        <input type="text" id="cm_postcode" name="postNo" class="post_num" placeholder="우편번호">
				            <input type="text" id="cm_address" name="adr" placeholder="주소"><br>
				            <input type="text" id="cm_detailAddress" name="dtlAdr"  placeholder="상세주소"><br>
				            <input type="hidden" name="sMNo" id="sMNo" value="${sMNo}" />
				            <input type="hidden" name="oNoI" id="optNoIn" value="" />
				            <input type="hidden" name="pNoI" id="pNoIn" value="" />
				            <input type="hidden" name="qNoI" id="qNoIn" value="" />
				            <input type="hidden" name="totalPInp" id="totalPInp" value=""/>
				            <input type="hidden" name="noIndex" id="noIndex" value=""/>
				            
                        </form>
                        <button class="addr_btn" id="addr_btn">배송지 등록</button>
                    </div>
                    <div class="rcon2_con2" id="rcon2_con2">
                    </div>
                    <div class="rcon2_con3">
                        <!-- <div class="due_price"><span>결제 예정 금액</span><span>원</span></div> -->
                        <button class="order_btn" id="orderBtn">주문하기</button>
                    </div>
                </div>
            </div>
        </section>
	</main>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>