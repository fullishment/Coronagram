<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/shop_cart/shop_cart.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Mono:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	redrawCartList();
    	$("#delBtn").on("click",function(){
    		delCart();
    	});
    	$("#allCheck").on("click",function(){
    		if($("#allCheck").is("":checked') == true){
    				$("input[name=\"cartCheck\"]:checked").attr("checked", true);
    			}else{
    				$("input[name=\"cartCheck\"]:checked").attr("checked", false);
    			}
    	});
    });
    
    
    
    
    
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
				drawCartList(res.list);
				drawTotal(res.cnt);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
    function drawTotal(list){
    	var html="";
	    html +="<div class=\"entire_item\"><span>전체 상품</span><span>"+list.CNT+"개</span></div>";
	    html +="<div class=\"order_price\"><span>주문 금액</span><span>"+list.SUM+"P</span></div>";
    	$("#rcon2_con2").html(html);
    	
    } 
    function drawCartList(list){
    	var html="";
    	
    	for(var data of list){
    			html+="<div class=\"lcon2_up\" no=\"${data.CART_NO}\">								";                                   
   				html+=" <input type=\"checkbox\" name=\"cartCheck\" class=\"check_btn\" value=\""+data.CART_NO+"\">						";                    
				html+="	<div class=\"up_con1\"></div>                                             ";
				html+="	<div class=\"up_con2\">                                                   ";
				html+="   		<div class=\"con2_title\">"+data.PROD_NM+"</div>                   ";
				html+="		<div class=\"con2_subtitle\">"+data.CON+"</div>                       ";
				html+="		<div class=\"con2_color\"><p>"+data.UNIT+" : "+data.PRICE+"</p></div>  ";             
				html+="		<div class=\"con2_memo\">메모</div>                                   	";
				html+="		</div>                                                              ";
				html+="		<div class=\"up_con3\">                                               ";
				html+="		<span class=\"qt-minus\">-</span>                                     ";
				html+="		<span class=\"qt\">1</span>                                           ";
				html+="		<span class=\"qt-plus\">+</span>                                      ";
				html+="	</div>                                                                  ";
				html+="		<div class=\"up_con4\">                                               ";
				html+="		<p class=\"del_btn\"></p>                                             ";
				html+="  			<p>"+data.POINT+"P</p>                                      ";
				html+="	</div>                                                                  ";
				html+="</div>                                                                   ";
    	}
    	$("#cartList").html(html);
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
    <form action="#" id="actionForm" method="post">
		<input type="hidden" name="sMNo" id="sMNo" value="${sMNo}" />
	</form>
        <section id="main">
            <div class="main-left">
                <div class="lcon1">
                    <div class="input_box">
                        <h1>장바구니</h1>
                        <div  class="check_all">
                            <input type="checkbox" name="allCheck" id="allCheck"><label>&nbsp;&nbsp;전체선택</label></button>
                        </div>
                    </div>
                    <button class="seldel_btn" id="delBtn">
                        <span>선택삭제</span>
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
                        <p>배송지를 등록해 주세요.</p><br>
                        <button class="add_btn">배송지 등록</button>
                    </div>
                    <div class="rcon2_con2" id="rcon2_con2">
                    </div>
                    <div class="rcon2_con3">
                        <!-- <div class="due_price"><span>결제 예정 금액</span><span>원</span></div> -->
                        <button class="order_btn">주문하기</button>
                    </div>
                </div>
            </div>
        </section>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>