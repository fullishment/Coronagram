<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>instagram</title>
    <link rel="stylesheet" href="resources/css/p_coronagram/common.css">
    <link rel="stylesheet" href="resources/css/prod_info/style.css">
    <link rel="stylesheet" href="resources/css/prod_info/prod_info.css">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
    <script type="text/javascript">
    var cnt=0;
    $(document).ready(function(){
    	$("#cancleBtn").click(function(){
    		if(confirm("수정내용을 취소하시겠습니까?")){
    			history.back();
    		}
    	});
    	$("#updateBtn").click(function(){
    		if(checkVal("#prodNm")){
    			alert("상품명이 입력되지않았습니다");
    			$("#prodNm").focus();
    		}else if(checkVal("#price")){
    			alert("가격이 입력되지않았습니다");
    			$("#price").focus();
    		}else if(checkVal("#text_field")){
    			alert("내용이 입력되지않았습니다");
    			$("#text_field").focus();
    		}else{
  				var opt = $("input[name=\"option\"]");
  				var optArray = new Array ();
  				for(var i=0;i<opt.length;i++){
  					optArray.push(opt[i].value);
  				}
  				
  				$("#optInp").val(optArray);
        		var srcArray = new Array();
        		var imgA = $("img[alt=\"thumbnail\"]"); 
        		for(var i=0;i<imgA.length;i++){
    				srcArray.push(imgA[i].src.substring(imgA[i].src.lastIndexOf("/")+1));
        		}
        		$("#bFile").val(srcArray);

        		
        		var params = $("#productForm").serialize();
        		console.log(params);
        		$.ajax({
    				url : "prodUs",
        			type : "post",
        			dataType : "json",
        			data :params,
        			success : function(res){
    					if(res.result == "success"){
    						location.href="adminShopList";
    					}
        				
        			},
        			error : function(request, status, error){
        				console.log(error);
        			}
    			});
    		}
    		
    	});
    	$("td").on("click","img",function(){
    		if($(this).is("#plusImg") ==false){
    			$("#aNo").val($(this).attr("no"));
    			if(confirm("선택한 이미지를 삭제하시겠습니까?")){
	    			$(this).remove();
    			}
    		}else {
    			if($("td img").length >5){
    				alert("이미지 등록 최대갯수를 초과하셨습니다.");
    			}else {
	    			$("#att").click();
    				
    			}
    		}
    	});
    	$("td").on("mouseover","img",function(){
    		if($(this).is("#plusImg") ==false){
    			var html = "<img src="+$(this).attr("src")+"  alt=\"preview\">";
    			$(".upload").html(html);
    		}
    	});
    	
    	$("#fileForm").on("change","input[type='file']",function(){
    		var fileForm = $("#fileForm");
    		fileForm.ajaxForm({
    			success : function(res){
    				if(res.result == "SUCCESS"){
    					//업로드 파일명 적용
    					if(res.fileName.length > 0){
    						$("#bFile").val(res.fileName[0]);
    						var html = " <img src=\"resources/upload/"+$("#bFile").val()+"\" class=\"thumbnailImg\" alt=\"thumbnail\" id=\"preview\" >";
    						$("#plusImg").before(html);
    					}
    				}else{
    					alert("파일 업로드에 실패했습니다.");
    				}
    			},
    			error : function(req, status, error){
    				console.log(error);
    				alert("파일 업로드중 문제가 발생했습니다.")
    			}
    		});
    		fileForm.submit();
    	});
    	$("#plus").on("click",function(){
    		var html = "<img alt=\"del\" src=\"resources/images/icon/plusNOBorder.png\"  class=\"del_icon\" id=\"delIcon\"><br/><label>옵션 값</label><input type=\"text\" id=\"op\" name=\"option\" class=\"pri_input\"/> ";
    		$(this).before(html);
    	});
    	$("#opt").on("click","#delIcon",function(){
    		$(this).prev().prev().prev().remove();
    		$(this).prev().prev().remove();
    		$(this).prev().remove();
    		$(this).remove();
    	});
    	
    });
    function checkVal(sel){
    	if($.trim($(sel).val())==""){
    		return true;
    	}else{
    		return false;
    	}
    };
    function attcAjax(srcArray,i){
    	console.log("aaa");
    	$("#bFile").val(srcArray[i]);
    	var params = $("#productForm").serialize();
		$.ajax({
			url : "prodAttcAdd",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				cnt++;
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
    
   
    
    </script>
    
</head>

<body>

<form action="fileUploadAjax" method="post" enctype="multipart/form-data" id="fileForm">
	<input type="file" name="att" id="att" style="display:none"/>

</form>
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
	

    <div id="main_container">

        <div class="product_form_container">
            <form action="#" class="product_form" id="productForm">
                <div class="title">
                    PRODUCT DETAIL
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
                            
                        </div>
                    </div>
                </div>
                <div class="upload_box">
                    <table>
                        <tr>
                            <th>이미지 업로드 : </th>
                            
                            <td>
                            <c:forEach var="data" items="${list}">
                            	<img src="resources/upload/${data.FILE_ADDR}" class="thumbnailImg" alt="thumbnail" no="${data.ATTC_NO}"> 
                            </c:forEach>
                                <img class="thumbnailImg" src="resources/images/icon/plus.png" id="plusImg"/>
                            </td>
                        </tr>
                    </table>

                </div>
                
                <p>
                	<input type="hidden" id="optInp" name="opt" value="" />
                	<input type="hidden" id="sMNo" name="sMNo" value="${sMNo}" />
                    <input type="hidden" id="pNo" name="pNo" value="${data.PROD_NO}" />
                    <input type="hidden" name="bFile" id="bFile" value=""/>
                    <label for="price" class="pri_label">상품명 : </label><input type="text" name="prodNm" id="prodNm" class="pri_input" value="${data.PROD_NM}"> <br/>
                    <label for="price" class="pri_label">카테고리명 : </label>
                    <select name="catNo" id="catNo">
                    	<c:forEach var ="cat" items="${catList}">
                    		<c:choose>
                    			<c:when test="${cat.CAT_NM == data.CAT_NM}">
                    				<option value="${cat.CAT_NO}" selected>${cat.CAT_NM}</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="${cat.CAT_NO}" >${cat.CAT_NM}</option>
                    			</c:otherwise>
                    		</c:choose>
                    			<option value="0" >기본값</option>
                    	</c:forEach>
                    </select><br/>
                    <label for="price" class="pri_label">가격 : </label><input type="text" name="price" id="price" class="pri_input"  value="${data.POINT}"> <br/>
                    <label for="price" class="pri_label">판매상태 : </label>
                    
                    <select name="saleStat" id="saleStat">
                    	<c:choose>
                    		<c:when test="${data.SALE_STAT eq 0 }">
                    			<option value="0">판매중</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option value="0" selected>판매중</option>
                    		</c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    		<c:when test="${data.SALE_STAT eq 1 }">
                    			<option value="1">상품준비중</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option value="1" selected>상품준비중</option>
                    		</c:otherwise>
                    	</c:choose>
                    </select> <br/>
                    <label for="opCategory">옵션 단위</label><input type="text" id="opCategory" name = "opCategory" class="pri_input"/>
                    <div id="opt">
                    	<label>옵션 값</label><input type="text" id="op" name="option" class="pri_input"/> 
                    	<img alt="plus" src="resources/images/icon/plusNOBorder.png"  class="plus" id="plus">   
                    </div>   
                    <textarea name="con" id="text_field" cols="50" rows="5"
                        placeholder="140자 까지 등록 가능합니다. #태그명 을 통해서 검색 태그를 등록할 수 있습니다. 예시 : I # love # insta!"  >${data.CON}</textarea>
                
                </p>
                <div class="btn_area">
                    <input class="add_btn" type="button" value="수정" id="updateBtn">
                    <input class="cancel_btn" type="button" value="취소" id="cancleBtn">
                </div>
                </form>
               
            
        </div>
    </div>
    
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>