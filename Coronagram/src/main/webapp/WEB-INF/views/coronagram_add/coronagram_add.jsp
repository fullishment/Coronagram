<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="../resources/css/coronagram_add/coronagram_add.css?after">
    <link rel="stylesheet" href="../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript" src="../resources/script/jquery/jquery.form.js"></script>
    <script>
    var cnt=0;
    $(document).ready(function(){
    		$(".upload_area").on("dragenter", function(e){
    			  e.stopPropagation();
    	          e.preventDefault();
    		});
    		$(".upload_area").on("dragleave", function(e){
  			  e.stopPropagation();
  	          e.preventDefault();
  			});
    		$(".upload_area").on("dragover", function(e){
    			  e.stopPropagation();
    	          e.preventDefault();
    		});
    		$(".upload_area").on("drop", function(e,file){
    			e.stopPropagation();
    			e.preventDefault();
    			var uploadFiles = [];
    			var files = e.originalEvent.dataTransfer.files;
    			for(var i = 0; i < files.length; i++) {
	    			var file = files[i];
	    			console.log(file);
	    			var size = uploadFiles.push(file);
    			}
    			var formData = new FormData();
    			
    			$.each(uploadFiles, function(i, file) {
    				formData.append('att',file,file.name);
    			});
    			
    			$.ajax({
    				url:'fileUploadAjax2',
    				data : formData,
    				type : 'post',
    				contentType:false,
    				processData:false,
    				success:function(res){
    					$("#CrngImgFile").val(res.fileName[0]);
    					var fileReplace = $("#CrngImgFile").val().replace('[', '%5B').replace(']', '%5D').replace(',', '%2C');
    					var fileLen = fileReplace.length;
    					var ExtensionNm = fileReplace.lastIndexOf('.')+1;
    					var fileExt = fileReplace.substring(ExtensionNm, fileLen).toLowerCase(); 					
    					
						var html="";
						if(fileExt=="mp4" || fileExt=="mov"){
							html+="<li class=\"preview\">																						  	 ";
							html+="		<video src=\"../resources/upload/"+fileReplace+"\" class=\"CrngPrevImg\" alt=\"thumbnail\" id=\"preview\" ></video>";
							html+=" 	<i class=\"fas fa-times-circle close_prev\"></i>															 ";
							html+="</li>																											 ";
						}
						else{
							html+="<li class=\"preview\">																						  	 ";
							html+="		<img src=\"../resources/upload/"+fileReplace+"\" class=\"CrngPrevImg\" alt=\"thumbnail\" id=\"preview\" >";
							html+=" 	<i class=\"fas fa-times-circle close_prev\"></i>															 ";
							html+="</li>																											 ";
						}
						
						$("#preview_area").append(html);
						imgMouseOver();
    				},
    				error : function(request, status, error){
        				console.log(error);
        			}
    			})
  			});
      		
    		
    		$("#cancel_btn").click(function(){
	    		if(confirm("작성내용을 취소하시겠습니까?")){
	    			history.back();
	    		}
    		});
    		$("#add_btn").click(function(){
    			var CrngArray = new Array();
        		var Crngimg = $("img[class=\"CrngPrevImg\"]"); 
        		var CrngVideo = $("video[class=\"CrngPrevImg\"]"); 
        		if(checkVal("#post_cont")){
        			alert("내용이 입력되지않았습니다");
        			$("#post_cont").focus();
        		}else if(Crngimg.length==0 && CrngVideo==0){
        			alert("사진이 첨부 되지 않았습니다");
        		}else if(Crngimg.length>10){
        			alert("사진을 10장 이상 업로드 할 수 없습니다");
        		}
        		else if(Crngimg.length>0){   
        			
	        		for(var i=0;i<Crngimg.length;i++){
	        			CrngArray.push(Crngimg[i].src.substring(Crngimg[i].src.lastIndexOf("/")+1));
	        		}
	
	        		
	        		var params = $("#postForm").serialize();
	        		console.log(params);
	        		$.ajax({
	    				url : "crngAdds",
	        			type : "post",
	        			dataType : "json",
	        			data : params, 
	        			success : function(res){
	        				for(var i =0;i<Crngimg.length ;i++){
	        					CrngAttcAjax(CrngArray,i);
	        					if(i==cnt){
	        						location.href="../coronagram/${sMNick}";
	        					}
	        				}
	        			},
	        			error : function(request, status, error){
	        				console.log(error);
	        			}
	    			});
        		}
        		else if(CrngVideo.length>0){
        			if(Crngimg.length>0){
        				alert("동영상과 사진을 같이 첨부할 수 없습니다");
        			}
        			else{
        				for(var i=0;i<CrngVideo.length;i++){
    	        			CrngArray.push(CrngVideo[i].src.substring(CrngVideo[i].src.lastIndexOf("/")+1));
    	        		}  	        		
    	        		var params = $("#postForm").serialize();
    	        		console.log(params);
    	        		$.ajax({
    	    				url : "crngAdds",
    	        			type : "post",
    	        			dataType : "json",
    	        			data : params, 
    	        			success : function(res){
    	        				for(var i =0;i<CrngVideo.length ;i++){
    	        					CrngAttcAjax(CrngArray,i);
    	        					if(i==cnt){
    	        						location.href="../coronagram/${sMNick}";
    	        					}
    	        				}
    	        			},
    	        			error : function(request, status, error){
    	        				console.log(error);
    	        			}
    	    			});
        			}        		
        		}else{
        			alert("업로드 중 오류 발생");
        		}
        	});
    		function imgMouseOver(){
    			$("li").on("click","i",function(){
            		if($(this).is("#preview_area") ==false){
            			$("#aNo").val($(this).attr("no"));
            			if(confirm("선택한 이미지를 삭제하시겠습니까?")){
        	    			$(this).parent().remove();
            			}
            		}else {
            			if($("li img").length >5){
            				alert("이미지 등록 최대갯수를 초과하셨습니다.");
            			}else {
        	    			$("#att").click();   				
            			}
            		}
            	});
    			$("li").on("mouseover","img",function(){
            		if($(this).is("#preview_area") ==false){
            			var html = "<img src=\""+$(this).attr("src")+"\" class=\"prev_area_img\" alt=\"preview\">";
            			$(".upload_area").html(html);
            		}
            	});
    			$("li").on("mouseleave","img",function(){
            		if($(this).is("#preview_area") ==false){
            			var html = "";
		            		html+="<div class=\"plus_icon\">";
		            		html+="		<span></span>";
		            		html+="		<span></span>";
		            		html+="</div>";
		            		html+="<div class=\"upload_text\">";
		            		html+=" 	사진 및 동영상 파일을 끌어다 놓으세요";
		            		html+="</div>";
		            		
            			$(".upload_area").html(html);
            		}
            	});
    			$("li").on("mouseover","video",function(){
            		if($(this).is("#preview_area") ==false){
            			var html = "<video src=\""+$(this).attr("src")+"\" class=\"prev_area_img\" alt=\"preview\" autoplay muted loop></video>";
            			$(".upload_area").html(html);
            		}
            	});
    			$("li").on("mouseleave","video",function(){
            		if($(this).is("#preview_area") ==false){
            			var html = "";
		            		html+="<div class=\"plus_icon\">";
		            		html+="		<span></span>";
		            		html+="		<span></span>";
		            		html+="</div>";
		            		html+="<div class=\"upload_text\">";
		            		html+=" 	사진 및 동영상 파일을 끌어다 놓으세요";
		            		html+="</div>";
		            		
            			$(".upload_area").html(html);
            		}
            	});
    		}    		
    		$(".upload_area").on("click",function(){
    			$("#att").click();   
    		});
        	
        	$("#fileForm").on("change","input[type='file']",function(){
        		var fileForm = $("#fileForm");
        		fileForm.ajaxForm({
        			success : function(res){
        				if(res.result == "SUCCESS"){
        					//업로드 파일명 적용
        					if(res.fileName.length > 0){
        						$("#CrngImgFile").val(res.fileName[0]);
        						var fileReplace = $("#CrngImgFile").val().replace('[', '%5B').replace(']', '%5D').replace(',', '%2C');
            					var fileLen = fileReplace.length;
            					var ExtensionNm = fileReplace.lastIndexOf('.')+1;
            					var fileExt = fileReplace.substring(ExtensionNm, fileLen).toLowerCase(); 					
            					
        						var html="";
        						if(fileExt=="mp4" || fileExt=="mov"){
        							html+="<li class=\"preview\">																						  	 ";
        							html+="		<video src=\"../resources/upload/"+fileReplace+"\" class=\"CrngPrevImg\" alt=\"thumbnail\" id=\"preview\" ></video>";
        							html+=" 	<i class=\"fas fa-times-circle close_prev\"></i>															 ";
        							html+="</li>																											 ";
        						}
        						else{
        							html+="<li class=\"preview\">																						  	 ";
        							html+="		<img src=\"../resources/upload/"+fileReplace+"\" class=\"CrngPrevImg\" alt=\"thumbnail\" id=\"preview\" >";
        							html+=" 	<i class=\"fas fa-times-circle close_prev\"></i>															 ";
        							html+="</li>																											 ";
        						}
        						
        						$("#preview_area").append(html);
        						imgMouseOver();
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
        	
    });
    function CrngAttcAjax(CrngArray,i){
    	$("#CrngImgFile").val(CrngArray[i]);
    	var params = $("#postForm").serialize();
		$.ajax({
			url : "postAcctAdd",
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
    function checkVal(sel){
    	if($.trim($(sel).val())==""){
    		return true;
    	}else{
    		return false;
    	}
    };
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
                        <a href="../logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
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
        <section class="upload_sec">
        	<form action="#" class="post_form" id="postForm">
	            <div class ="upload_content">
	                <div class="upload_area">
	                    <div class="plus_icon">
	                        <span></span>
	                        <span></span>
	                    </div>
	                    <div class="upload_text">
	                        사진 및 동영상 파일을 끌어다 놓으세요
	                    </div>
	                </div>
	            </div>
	            <div class="input_sec">
	                <div class="input_cont">
	                    <div class="page_title">
	                        <div class="page_cat cat_nm">
	                            <i class="fas fa-user-alt"></i>
	                            <span>게시판</span>
	                        </div>
	                        <div class="page_nm">
	                            <span>게시물 추가하기</span>
	                        </div>
	                    </div>
	                    <div class="input_area">
	                        <div class="cont_area">
	                            <p class="add_text">내용</p>
	                            <textarea id="post_cont" class="post_cont" cols="50" rows="5" name="con"></textarea>
	                        </div>
	                        
	                        <div class="preview_sec">
	                            <p class="add_text">미리보기</p>
	                            <ul id="preview_area" class="preview_area">                        
	                            </ul>                        
	                        </div>
	                        <div class="btn_area">
	                            <button type="button" id="add_btn" class="add_btn">작성</button>
	                            <button type="button" id="cancel_btn" class="cancel_btn">취소</button>
	                        </div>                      
	                    </div> 
	                </div>
	            </div>
	            <input type="hidden" id="last_no" name="last_no" value="${lastAcct.LAST_NUMBER}"/>
	            <input type="hidden" id="m_no" name="m_no" value="${sMNo}" />
	            <input type="hidden" name="CrngImgFile" id="CrngImgFile" value=""/>	            
            </form>
            <form action="fileUploadAjax2" method="post" enctype="multipart/form-data" id="fileForm">
				<input type="file" name="att" id="att">
			</form>	
        </section>
    <script src="../resources/script/menu_bar/menu_bar.js"></script>
</body>
</html>