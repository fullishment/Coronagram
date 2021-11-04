<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="../resources/css/user_page/user_page.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
    <title><%= request.getAttribute("nicknm") %>님 개인 페이지</title>
    <style>
    	
    </style>
    <script>
	    $(document).ready(function(){
	    	reloadList();    	
	    	storyListAjax();
	    	searchUser();
	    	var modal = document.getElementById('myModal');
	    	var lkmodal = document.getElementById('lk_modal');
	        $(document).on("click",".gallery-item",function(){
	        	$("#myModal").html("");
	        	$("#writingNo").val($(this).attr("wtno"));
	        	$("#writingNo2").val($(this).attr("wtno"));
	        	
	        	modal.style.display="block";
	        	$('body').css("overflow","hidden");
	        	mdDraw();          	
	        });   
	        $(document).on("click",".gallery-item1",function(){
	        	$("#myModal").html("");
	        	$("#reelsNo").val($(this).attr("wtno"));
	        	modal.style.display="block";
	        	$('body').css("overflow","hidden");
	        	ReelsModal();   
	        });  
	        
	        window.onclick = function(event) {
	            if (event.target == modal) {
	            	if(document.getElementById("player")){
	            		document.getElementById("player").muted = true;
	            	}
	            	$("#myModal").html("");
	            	$('body').css("overflow","auto");
	                modal.style.display = "none";                    
	            }else if(event.target == lkmodal){
	            	$('body').css("overflow","auto");
	            	lkmodal.style.display = "none";   
	            	reloadList();
	            }
	        }  
		    var _scrollX = $('.scroll_inner').scrollLeft();
		    var _scrollX = $('.scroll_inner').scrollLeft();
		    	
		    $('.scroll_inner').scrollLeft(_scrollX + 600);	  	  	
	  	  	$('.scroll_inner').scrollLeft(_scrollX - 600);
	    });
        function modalFunc(){
            $(".close").on("click",function(){
            	if(document.getElementById("player")){
            		document.getElementById("player").muted = true;
            	}
            	$("#myModal").html("");
            	$('body').css("overflow","auto");
            	document.getElementById("myModal").style.display="none";          	
            });
            $(document).keydown(function(event) {
                if ( event.keyCode == 27 || event.which == 27 ) {
                	if(document.getElementById("player")){
                		document.getElementById("player").muted = true;
                	}
                	$("#myModal").html("");
                	$('body').css("overflow","auto");
                	document.getElementById("myModal").style.display = "none";     
                }
            });
            $(".exit").on("click",function(){
            	if(document.getElementById("player")){
            		document.getElementById("player").muted = true;
            	}
            	$("#myModal").html("");
            	$('body').css("overflow","auto");
            	document.getElementById("myModal").style.display="none";          	
            });
            $(".story_icon").on("click",function(){
	    		location.href="../coronagram/storyAdd";
	    	});
        }
        function reloadList(){
			var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"userpages",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){
					$("#myModal").html("");
					ProfileImg(res.intro);				
					intro(res.intro);
					introNm(res.intro);				
					profileCnt(res.intro);
					imgList(res.list);
					followArea();
					editProfile();
					addFollow();
		        	delFollow();			        	
		        	mInfo(res.intro);
		        	mInfoClick();
		        	videoListBtn();
		        	storyAjax();
		        	modalFunc();
		        	followModal();
		        	followerModal();
		        	
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
		}
        function reloadReels(){
        	var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"reels",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){
					ReelsList(res.reels);
					ReelsInfo(res.intro);
					ReelsInfoClick();
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
        }
        function ReelsList(list){
        	var html ="";			
			for(var data of list){                                                                                    
				html+= "<div class=\"gallery-item1\" tabindex=\"0\" wtno=\""+data.REELS_NO+"\" no=\""+data.M_NO+"\">                     ";				
				html+= "			<video class=\"gallery-image\">																		";
				html+= " 				<source src=\"../resources/upload/"+data.FILE_ADR+"\" type=\"video/mp4\"></source>				";
				html+= "			</video>																							";   				
				html+= "		<div class=\"gallery-item-type1\">																		";
				html+= "        	<i class=\"fas fa-play\"></i>																		";
				html+="				<span class=\"view_cnt\">"+data.VIEW_CNT+"</span>													";
				html+= "    	</div>																						    		";				
			    html+= "    	<div class=\"gallery-item-info\">                                                            			"; 
			    html+= "        <ul>                                                                                     	 			"; 
			    html+= "            <li class=\"gallery-item-likes\"><span class=\"visually-hidden\">Likes:</span><i         			"; 
			    html+= "                    class=\"fas fa-heart\" aria-hidden=\"true\"></i>"+data.LCNT+"</li>               			"; 
			    html+= "            <li class=\"gallery-item-comments\"><span class=\"visually-hidden\">Comments:</span><i   			"; 
			    html+= "                    class=\"fas fa-comment\" aria-hidden=\"true\"></i>"+data.CCNT+"</li>             			"; 
			    html+= "        </ul>                                                                                    	 			";
			    html+= "    	</div>                                                                                       			"; 
		    	html+= "</div>                                                                                           	 			"; 
		    	
			}			
			$("#gallery").html(html);
        }
        function ReelsInfo(data){
        	var html="";
        		if(data.NICK_NM == "${sMNick}"){
        			html+="<div class=\"btn_area\">										";
            		html+="		<div id=\"reels_add\" class=\"photo_add\">  			";
            		html+="			<i class=\"far fa-plus-square\"></i>				";
            		html+="			<span class=\"btn_font\">&nbsp;새 릴스</span>			";
            		html+="		</div>													";
            		html+="</div>														";
        		}
        		else{
        			
        		}       		
        		$(".nav_line").html(html);
        		var html2="";
        		if(data.NICK_NM == "${sMNick}"){
		        	html2+="<div class=\"add_story_area\">                                                          ";
					html2+="	<img class=\"story_icon\" src=\"../resources/images/userpage/plus.png\" alt=\"\">   ";
					html2+="	<div class=\"add_story_span\">                                                      ";
					html2+="		<span>New</span>                                                                ";
					html2+="	</div>                                                                              ";
					html2+="</div>                                                                                  ";
				}
        		else{
        			
        		} 
        		$(".add_story_container").html(html2);
        }
        function ReelsInfoClick(){
        	$("#reels_add").on("click",function(){
        		$("#addReelsForm").submit();
        	});
        }
        function ReelsModal(){  	
	    	var params = $("#ReelsMForm").serialize();
			$.ajax({
				url : "ReelsModal",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					$("#myModal").html("");
					ReelsModalArea(res.reelsModal);
					reloadReels();
					ReelsLK();
					ReelsAddDelHeart();
					ReelsControl1();
					ReelsControl2();
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }
        function ReelsLK(){  	
        	var params = $("#ReelsMForm").serialize();
			$.ajax({
				url : "ReelsLK",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					ReelsHeart(res.reelsHChk);
					ReelsLkArea(res.ReelsLk);
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }
        function ReelsControl1(){
        	var player = document.getElementById("player");
        	if(player.muted == true){
        		$(".mute_area").on("click",function(){
    				 				
    				player.muted = false;
    							
    				var html="";
    				html+="<i class=\"fas fa-volume-up vup\"></i>";
    				$(".muted_btn1").html(html);
    				
    				setTimeout(function(){
						$(".muted_btn1").html("");
						
					},1000);
    				ReelsControl2();
    			});
        	}			
		}
	    function ReelsControl2(){
	    	if(player.muted == false){
	    		$(".mute_area").on("click",function(){    		
					
					player.muted = true;
					
					var html="";
					html+="<i class=\"fas fa-volume-mute vmute\"></i>";
					$(".muted_btn1").html(html);
					
					setTimeout(function(){
						$(".muted_btn1").html("");
					},1000);
					
					ReelsControl1();
				});
	    	}    	
	    }
        function ReelsLkArea(data){
        	var html="";
        		html+="<span class=\"reels_heart_cnt\">"+data+"<span>";       		
        		$(".reels_hcnt_area").html(html);
        }
        function ReelsHeart(data){
	    	if( data == 1 ){
    			$("#checkbox").attr("checked",true);
	    	}else{
            	$("#checkbox").attr("checked",false);
	    	}
	    }
        function ReelsAddDelHeart(){
        	$("#checkbox").on("click",function(){
	    		if($(this).is(":checked") == true) {
		    		var params = $("#ReelsMForm").serialize();
		    		$.ajax({
		    			url : "addReelsHeart",
		    			type : "post",
		    			dataType : "json",
		    			data : params,
		    			success : function(res){
		    				if(res.result=="success"){
		    					ReelsLK();
		    					var html="";
		    						html+="<i class=\"fas fa-heart hicon\"></i>";
		    						$(".muted_btn1").html(html);
		    					setTimeout(function(){
		    						$(".muted_btn1").html("");
		    					},2000);
		    				}else{
		    					alert("add실패");
		    				}
		    			},
		    			error : function(request, status, error){
		    				console.log(error);
		    			}
		    		});
	    		}else{
		    		var params = $("#ReelsMForm").serialize();
	    			$.ajax({
	    				url : "delReelsHeart",
	    				type : "post",
	    				dataType : "json",
	    				data : params,
	    				success : function(res){
	    					if(res.result=="success"){
	    						ReelsLK();
	    					}else{
	    						alert("삭제실패");
	    					}
	    				},
	    				error : function(request, status, error){
	    					console.log(error);
	    				}
	    			});
	    		}
    		});	    		    	
        }
        function ReelsModalArea(data){
        	var html="";
        		html+="<div class=\"reels_content\" rno=\""+data.REELS_NO+"\">	";
        		html+="		<div class=\"reels_area\">";
        		html+="			<div class=\"reels_title\">		";
        		html+="				<span>Reels</span>				";
        		html+="			</div>							";
        		html+="			<div class=\"reels_title_icon\">		";
        		html+=" 			<img class=\"music_img\" src=\"../resources/images/userpage/camera.png\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> ";
        		html+="			</div>							";
        		html+=" 		<div class=\"muted_btn1\">																";
                html+=" 		</div>																					";
        		html+="			<div class=\"reels_video_area\">	";
        		html+="				<video id=\"player\" controls playsinline autoplay muted loop>							"; 
                html+=" 				<source src=\"../resources/upload/"+data.FILE_ADR+"\" alt=\"\" /></source>	   		";
                html+="				</video>																				"; 
        		html+="			</div>																						";
        		html+="			<div class=\"mute_area\"></div>																";
        		html+="			<div class=\"reels_icon\">																	";
        		html+="                       <div class=\"heart_btn\">                                                                 								   ";
			    html+="                           <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\">         								   ";			     											
			    html+="                                     <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" >                								   ";
			    html+="                                     <label class=\"heart_label\"for=\"checkbox\">                                                    								   ";
			    html+="                                       <svg id=\"heart-svg\" viewBox=\"467 392 58 57\" xmlns=\"http://www.w3.org/2000/svg\"> ";
			    html+="                                         <g id=\"Group\" fill=\"none\" fill-rule=\"evenodd\" transform=\"translate(467 392)\">";
			    html+="                                           <path d=\"M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z\" id=\"heart\" stroke=\"#ffffff\" stroke-width=\"3\"></path>";
			    html+="                                           <circle id=\"main-circ\" fill=\"#E2264D\" opacity=\"0\" cx=\"29.5\" cy=\"29.5\" r=\"1.5\"></circle>     ";
			    html+="                                           <g id=\"grp7\" opacity=\"0\" transform=\"translate(7 6)\">                                              ";
			    html+="                                             <circle id=\"oval1\" fill=\"#9CD8C3\" cx=\"2\" cy=\"6\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval2\" fill=\"#8CE8C3\" cx=\"5\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                                                                                                                                   ";
			    html+="                                           <g id=\"grp6\" opacity=\"0\" transform=\"translate(0 28)\">                                             ";
			    html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"3\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                                                                                                                                   ";
			    html+="                                           <g id=\"grp3\" opacity=\"0\" transform=\"translate(52 28)\">                                            ";
			    html+="                                             <circle id=\"oval2\" fill=\"#9CD8C3\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval1\" fill=\"#8CE8C3\" cx=\"4\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                                                                                                                                   ";
			    html+="                                           <g id=\"grp2\" opacity=\"0\" transform=\"translate(44 6)\">                                             ";
			    html+="                                             <circle id=\"oval2\" fill=\"#CC8EF5\" cx=\"5\" cy=\"6\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                           <g id=\"grp5\" opacity=\"0\" transform=\"translate(14 50)\">                                            ";
			    html+="                                             <circle id=\"oval1\" fill=\"#91D2FA\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                           <g id=\"grp4\" opacity=\"0\" transform=\"translate(35 50)\">                                            ";
			    html+="                                             <circle id=\"oval1\" fill=\"#F48EA7\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
			    html+="                                             <circle id=\"oval2\" fill=\"#F48EA7\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                           <g id=\"grp1\" opacity=\"0\" transform=\"translate(24)\">                                               ";
			    html+="                                             <circle id=\"oval1\" fill=\"#9FC7FA\" cx=\"2.5\" cy=\"3\" r=\"2\"></circle>                           ";
			    html+="                                             <circle id=\"oval2\" fill=\"#9FC7FA\" cx=\"7.5\" cy=\"2\" r=\"2\"></circle>                           ";
			    html+="                                           </g>                                                                                                    ";
			    html+="                                         </g>                                                                                                      ";
			    html+="                                       </svg>                                                                                                      ";
			    html+="                                     </label>                                                                                                      ";
			    html+="                           </div>                                                                                                                  ";
			    html+="                       </div>                                                                                                                      ";
			    html+="							<div class=\"reels_hcnt_area\">										";			    
			    html+="							</div>																";
			    html+="                       <div class=\"sprite_bubble_icon1\">                                                                                          ";
			    html+="                           <i class=\"far fa-comment f_size\"></i>                                                                                 ";
			    html+="                       </div>                                                                                                                      ";
			    html+="							<div class=\"reels_ccnt_area\">										";
			    html+="								<span class=\"reels_cmt_cnt\">"+data.CCNT+"<span>				";
			    html+="							</div>																";
			    html+="                       <div class=\"sprite_share_icon1\" data-name=\"share\">                                                                       ";
			    html+="                           <i class=\"far fa-paper-plane f_size\"></i>                                                                             ";
			    html+="                       </div>                                                                                                                      ";
			    html+="						  <div class=\"sprite_more_icon1\">								";
			    html+=" 						<img class=\"music_img\" src=\"../resources/images/userpage/more.png\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> ";
        		html+="						  </div>															";			      		
         		html+="				</div>";
         		html+="						  <div class=\"sprite_square_icon1\">								";
        		html+=" 						<img class=\"music_img\" src=\"../resources/images/userpage/replace.png\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> ";
         		html+="						  </div>															";
        		html+="		</div>";
        		html+="</div>";
        		$("#myModal").html(html);
        }
        function reloadPart2(){
        	var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"userpages",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){
					profileCnt(res.intro);			
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
        }
        function reloadImgList(){
			var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"userpages",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){		
					profileCnt(res.intro);
					imgList(res.list);			
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
		}
        function storyListAjax(){
        	var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"storyList",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){
					StoryList(res.story);
					
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
        }
        function storyAjax(){
        	$(".pGradient0").on("click",function(){      		
       			$("#storyNo").val($(this).attr("stno"));	        		
           		var params=$("#storyForm").serialize();		
       			$.ajax({ 
       				url:"storyMList",
       				type:"post",
       				dataType:"json",
       				data:params,
       				success : function(res){
       					setTimeout(function(){
       						$("#myModal").css("display","block");
       						$('body').css("overflow","hidden");
       						StoryModal(res.mStory);
       						progressbar();
       						modalFunc();	
       					},2000);
       				},
       				error : function(request,status,error){
       					console.log(error);
       				}
       			});          		    			    		
        	});
        }
        function StoryModal(data){
        	var html="";
        	
        	html+="<i class=\"fas fa-times exit\"></i>                                                                                                                     ";
        	html+="<div class=\"sliderContainer\">                                                                                                                         ";
        	html+="  	<div class=\"s_user_container\">                                                                									               ";
		    html+="   		<div class=\"profile_img\">                                                                   								                   ";
		    html+=" 			<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> "; 
		    html+="    		</div>																						 								                   ";
		    html+="        <div class=\"s_user_name\">                                                                 	 								                   ";
		    html+="            <div class=\"s_nick_name head_text\">"+data.STORY_TITLE+"</div>                                                                             ";            
		    html+="            <div class=\"s_date head_text\">"+timeForToday(data.DT)+"</div>                               	 								           ";                  
		    html+="        </div>                                                                                    	 								                   ";
		    html+="  	</div>                                                                                     	 	 								                   ";
			html+="	<div class=\"slider single-item\">                                                                                                                     ";
	        var fileAdr=data.FILE_ADDRS;                                                                                                                                   
	        var fileAdrSplit = fileAdr.split(',');                                                                                                                         
	        for ( var i = 0; i < fileAdrSplit.length; i++) {                                                                                                               
	        	var fileLen = fileAdrSplit[i].length;                                                                                                                      
				var ExtensionNm = fileAdrSplit[i].lastIndexOf('.')+1;                                                                                                      
				var fileExt = fileAdrSplit[i].substring(ExtensionNm, fileLen).toLowerCase();                                                                               
				if(fileExt=="mp4" || fileExt=="mov"){
					html+="	  	<div>                                                                                                                                      ";
					html+="			<video class=\"p_video\" playsinline autoplay muted loop>																			   ";
		           	html+="				<source src=\"../resources/upload/"+fileAdrSplit[i]+"\" alt=\"\" type=\"video/mp4\"/></source>	   						   		   ";
		           	html+="			</video>																															   ";       
					html+="	  	</div>                                                                                                                                     ";
				}
				else{
					html+="	  	<div>                                                                                                                                      ";
					html+=" 		<img class=\"story_box\" src=\"../resources/upload/"+fileAdrSplit[i]+"\" alt=\"\" />	   						   					   ";
					html+="	  	</div>                                                                                                                                     ";
				}				
	        }                                                                                                                                                              
			html+="	</div>                                                                                                                                                 ";
			html+=" 	<div class=\"progress_area\">                                                                                                                      ";
			html+="	  		<div class=\"progressBarContainer\">                                                                                                           ";
			for ( var j = 0; j < fileAdrSplit.length; j++) {                                                                                                               
				html+="		    <div>                                                                                                                                      ";
				html+="		      <span data-slick-index=\""+j+"\" class=\"progressBar\"></span>                                                                           ";      
				html+="		    </div>                                                                                                                                     ";
			}		                                                                                                                                                                                                                                                                   
			html+="	  		</div>                                                                                                                                         ";
			html+="  	</div>                                                                                                                                             ";
			html+="</div>                                                                                                                                                  ";
			
			$("#myModal").html(html);
        }                                                                                                                                                                  
        function StoryList(list){                                                                                                                                          
        	var html ="";	
			
			 for(data of list){
				 	html+="<div class=\"pGradient0\" stno=\""+data.STORY_NO+"\"> 																					";
					html+="		<svg class=\"pGradient\" width=\"453\" height=\"453\" viewBox=\"0 0 453 453\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">	";
					html+="			<defs>																															";
					html+="	   			<linearGradient id=\"MyGradient\">																							";
					html+="	        		<stop offset=\"5%\" stop-color=\"#F9913F\" />																			";				
					html+="	        		<stop offset=\"40%\" stop-color=\"#e01b6a\" />																			";
					html+="	        		<stop offset=\"80%\" stop-color=\"#CD51A4\" />																			";
					html+="	        	</linearGradient>																											";
					html+="	 		</defs>																															";
					html+="			<circle cx=\"226.5\" cy=\"226.5\" r=\"216.5\" stroke=\"url(#MyGradient)\" stroke-width=\"20\"/>									";
					html+="		</svg>																																";
					html+="		<div class=\"user\">																												";
					html+="      	<div class=\"thumb_img\" fono=\""+data.M_NO+"\">																				";
					var fileLen = data.FILE_ADDR.length;
					var ExtensionNm = data.FILE_ADDR.lastIndexOf('.')+1;
					var fileExt = data.FILE_ADDR.substring(ExtensionNm, fileLen).toLowerCase();			
					if(fileExt=="mp4" || fileExt=="mov"){
						html+= "			<video class=\"modal_video_box\">																						";
						html+= " 				<source src=\"../resources/upload/"+data.FILE_ADDR+"\" type=\"video/mp4\"></source>									";
						html+= "			</video>																												";
					}
					else{
						html+=" 			<img src=\"../resources/upload/"+data.FILE_ADDR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" />";
					}								
					html+="			</div>																															";
					html+="       	<div class=\"title_area\">																										";
					if(data.STORY_TITLE.length<6){
						html+="				<span class=\"title_nm\">"+data.STORY_TITLE+"</span>																	";
					}
					else{
						var str = data.STORY_TITLE;
						html+="				<span class=\"title_nm\">"+str.substr(0,8)+"...</span>																	";
					}
					
					html+="			</div>																															";
					html+="   	</div>																																";
					html+="</div>																																	";					
			 }
			 $(".scroll_inner").prepend(html);
        }
        function followModal(){
        	$(".follow_event").on("click",function(){
	    		$('.lk_modal').css("display","block");
	    		$('body').css("overflow","hidden");
	    		followEvent();
	    		var modal = document.getElementById('lk_modal');  		            
	            window.onclick = function(event) {
	                if (event.target == modal) {
	                    modal.style.display = "none";
	                    $('body').css("overflow","auto");
	                }
	            }
	            $(".lk_modal_close").on("click",function(){
	            	modal.style.display="none";
	            	$('body').css("overflow","auto");
	            });	            
	    	});
	    }
		function followEvent(){   		
   			var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"followEvent",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){						
					FollowMList(res.eFollow);
					FollowMAdd1();
					FollowMDel1();
				},
				error : function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	   	}
		function followerModal(){
			$('.follower_event').on("click",function(){	
	    		$('.lk_modal').css("display","block");
	    		$('body').css("overflow","hidden");
	    		followerEvent();
	    		var modal = document.getElementById('lk_modal');  		            
	            window.onclick = function(event) {
	                if (event.target == modal) {
	                    modal.style.display = "none";
	                    $('body').css("overflow","auto");
	                }
	            }
	            $(".lk_modal_close").on("click",function(){
	            	modal.style.display="none";
	            	$('body').css("overflow","auto");
	            });	            
	    	});
	    }
		function followerEvent(){
			var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"followerEvent",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){						
					FollowerMList(res.eFollower);
					FollowMAdd2();
					FollowMDel2();
				},
				error : function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	   	}
		function FollowMAdd1(){
	    	$(".fospan2").on("click",function(){
	    		$("#m_no2").val($(this).parent().parent().attr("nfo"));
	    		var params = $("#AddDelFoForm").serialize();
	    		$.ajax({
	    			url : "FollowMAdd",
	    			type : "post",
	    			dataType : "json",
	    			data : params,
	    			context: this,
	    			success : function(res){
	    				if(res.result=="success"){									
	    					followEvent();		
	    					reloadPart2();
	    				}else{
	    					alert("add실패");
	    				}
	    			},
	    			error : function(request, status, error){
	    				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    			}
	    		});
	    	});
	    }
	    function FollowMDel1(){
	    	$(".fispan2").on("click",function(){
	    		$("#m_no2").val($(this).parent().parent().attr("nfo"));
	    		var params = $("#AddDelFoForm").serialize();
	    		$.ajax({
	    			url : "FollowMDel",
	    			type : "post",
	    			dataType : "json",
	    			data : params,
	    			context: this,
	    			success : function(res){
	    				if(res.result=="success"){
	    					followEvent();
	    					reloadPart2();
	    				}else{
	    					alert("add실패");
	    				}
	    			},
	    			error : function(request, status, error){
	    				console.log(error);
	    			}
	    		});
	    	});
	    }	
	    function FollowMAdd2(){
	    	$(".fospan2").on("click",function(){
	    		$("#m_no2").val($(this).parent().parent().attr("nfo"));
	    		var params = $("#AddDelFoForm").serialize();
	    		$.ajax({
	    			url : "FollowMAdd",
	    			type : "post",
	    			dataType : "json",
	    			data : params,
	    			context: this,
	    			success : function(res){
	    				if(res.result=="success"){									
	    					followerEvent();
	    					reloadPart2();
	    				}else{
	    					alert("add실패");
	    				}
	    			},
	    			error : function(request, status, error){
	    				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    			}
	    		});
	    	});
	    }
	    function FollowMDel2(){
	    	$(".fispan2").on("click",function(){
	    		$("#m_no2").val($(this).parent().parent().attr("nfo"));
	    		var params = $("#AddDelFoForm").serialize();
	    		$.ajax({
	    			url : "FollowMDel",
	    			type : "post",
	    			dataType : "json",
	    			data : params,
	    			context: this,
	    			success : function(res){
	    				if(res.result=="success"){
	    					followerEvent();
	    					reloadPart2();
	    				}else{
	    					alert("add실패");
	    				}
	    			},
	    			error : function(request, status, error){
	    				console.log(error);
	    			}
	    		});
	    	});
	    }	
	    function FollowMList(list){
	    	var html = "";
	    	for(data of list){
	    		html+="<div class=\"rec_user\" nfo=\""+data.M_NO+"\">																								 ";
				html+="		<div class=\"profile_thumb\">																											 ";
				html+=" 		<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 	 "; 
				html+="		</div>																											 						 ";
				html+="		<div class=\"detail\">																													 ";
				html+="			<a href=\"coronagram/"+data.NICK_NM+"\" class=\"modal_nick\">"+data.NICK_NM+"</a>																 ";			
				html+="		</div>																																	 ";
				if(data.M_NO == ${sMNo}){
					
				}
				else{
					if(data.CNTF == 1){
						html+="			<div class=\"rec_follow\">																			 	";
						html+="				<span class=\"modal_follow1 fispan2\">팔로잉</span>												 	";
						html+="			</div>																								 	";
					}
					else if(data.CNTF == 0){
						html+="			<div class=\"rec_follow\">																			 	";
						html+="				<span class=\"modal_follow2 fospan2\">팔로우</span>												 	";
						html+="			</div>																								 	";
					}							
					html+="</div>																												";
				}								
				html+="</div>																												 	";
	    	}				
			$(".lk_modal_main").html(html);
	    }
		function FollowerMList(list){
	    	var html = "";
	    	for(data of list){
	    		html+="<div class=\"rec_user\" nfo=\""+data.M_NO+"\">																								 ";
				html+="		<div class=\"profile_thumb\">																											 ";
				html+=" 		<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 	 "; 
				html+="		</div>																											 						 ";
				html+="		<div class=\"detail\">																													 ";
				html+="			<a href=\"coronagram/"+data.NICK_NM+"\" class=\"modal_nick\">"+data.NICK_NM+"</a>																 ";			
				html+="		</div>																																	 ";
				if(data.M_NO == ${sMNo}){
					
				}
				else{
					if(data.CNTF == 1){
						html+="			<div class=\"rec_follow\">																			 	";
						html+="				<span class=\"modal_follow1 fispan2\">팔로잉</span>												 	";
						html+="			</div>																								 	";
					}
					else if(data.CNTF == 0){
						html+="			<div class=\"rec_follow\">																			 	";
						html+="				<span class=\"modal_follow2 fospan2\">팔로우</span>												 	";
						html+="			</div>																								 	";
					}							
					html+="</div>																												";
				}								
				html+="</div>																												 	";
	    	}				
			$(".lk_modal_main").html(html);
	    }
        function reloadFollowArea(){
        	var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"userpages",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){			
					profileCnt(res.intro);
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
        }
        function videoListBtn(){
        	$(".menu_post2").on("click",function(){
        		$('#gallery').html("");
        		$('#gallery').css("grid-template-rows","300px 300px 300px");
        		$(".menu_post2").css({
        			"color":"#262626",
        			"border-top":"2px solid #262626"
        		});
        		var html="";
        		html+="<img class=\"menu_icon1\" src=\"../resources/images/userpage/grid2.png\" alt=\"\">";
        		$(".menu_icon_area1").html(html);
        		$(".menu_post").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html2="";
        		html2+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/play1.png\" alt=\"\">";
        		$(".menu_icon_area2").html(html2);
        		reloadVideo();
        		
        		$(".menu_post3").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html3="";
        		html3+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/film2.png\" alt=\"\">";
        		$(".menu_icon_area3").html(html3);
        	});
        	$(".menu_post").on("click",function(){
        		$('#gallery').html("");
        		$('#gallery').css("grid-template-rows","300px 300px 300px");
        		$(".menu_post").css({
        			"color":"#262626",
        			"border-top":"2px solid #262626"
        		});
        		var html="";
        		html+="<img class=\"menu_icon1\" src=\"../resources/images/userpage/grid1.png\" alt=\"\">";
        		$(".menu_icon_area1").html(html);
        		$(".menu_post2").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html2="";
        		html2+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/film2.png\" alt=\"\">";
        		$(".menu_icon_area2").html(html2);
        		reloadList();
        		
        		$(".menu_post3").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html3="";
        		html3+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/film2.png\" alt=\"\">";
        		$(".menu_icon_area3").html(html3);
        	});
        	$(".menu_post3").on("click",function(){
        		$('#gallery').html("");
        		$('#gallery').css("grid-template-rows","400px 400px 400px");
        		$(".menu_post3").css({
        			"color":"#262626",
        			"border-top":"2px solid #262626"
        		});
        		var html3="";
        		html3+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/film1.png\" alt=\"\">";
        		$(".menu_icon_area3").html(html3);
        		
        		$(".menu_post").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html="";
        		html+="<img class=\"menu_icon1\" src=\"../resources/images/userpage/grid2.png\" alt=\"\">";
        		$(".menu_icon_area1").html(html);
        		$(".menu_post2").css({
        			"color":"#8e8e8e",
        			"border-top":"2px"
        		});
        		var html2="";
        		html2+="<img class=\"menu_icon2\" src=\"../resources/images/userpage/film2.png\" alt=\"\">";
        		$(".menu_icon_area2").html(html2);
        		reloadReels();
        	});
        }
        function reloadVideo(){
        	var params=$("#addrForm").serialize();		
			$.ajax({ 
				url:"videoList",
				type:"post",
				dataType:"json",
				data:params,
				success : function(res){
					$("#myModal").html("");
					imgList(res.video);
					ProfileImg(res.intro);				
					intro(res.intro);
					introNm(res.intro);				
					profileCnt(res.intro);
					mInfo(res.intro);
					mInfoClick();
					followArea();
					editProfile();
					addFollow();
		        	delFollow();
		        	videoListBtn();
		        	modalFunc();
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
        }
        function intro(data){
        	var html ="";
        		html+="<h1 id=\"mId\" class=\"profile-user-name\">"+data.NICK_NM+"</h1> 	  ";
        		$(".profile-user-setting").html(html);      	
        }
        function mInfoClick(){
        	$("#photo_add").on("click",function(){
        		$("#addCrngForm").submit();
        	});
        }
        function mInfo(data){
        	var html="";
        		if(data.NICK_NM == "${sMNick}"){
        			html+="<div class=\"btn_area\">										";
            		html+="		<div id=\"photo_add\" class=\"photo_add\">  			";
            		html+="			<i class=\"far fa-plus-square\"></i>				";
            		html+="			<span class=\"btn_font\">&nbsp;새 컬렉션</span>		";
            		html+="		</div>													";
            		html+="</div>														";
        		}
        		else{
        			
        		}       		
        		$(".nav_line").html(html);
        	var html2="";
        		if(data.NICK_NM == "${sMNick}"){
		        	html2+="<div class=\"add_story_area\">                                                          ";
					html2+="	<img class=\"story_icon\" src=\"../resources/images/userpage/plus.png\" alt=\"\">   ";
					html2+="	<div class=\"add_story_span\">                                                      ";
					html2+="		<span>New</span>                                                                ";
					html2+="	</div>                                                                              ";
					html2+="</div>                                                                                  ";
				}
        		else{
        			
        		} 
        		$(".add_story_container").html(html2);
        }        
        function introNm(data){
        	var html ="";
	        	html+="<span class=\"profile-real-name\">"+data.M_NM+"</span>			";
	        	if(data.INTRO_CON != '' && data.INTRO_CON != null){
	        		html+="<div class=\"intro_con\">"+data.INTRO_CON+"</div>			";
	        	}	        	
        		$(".profile-bio").html(html);
        }
        function profileCnt(data){
			var html ="";
			
				html +="<li>게시물 <span class=\"profile_pcnt\">"+data.PCNT+"</span></li> ";
			    html +="<li class=\"follower_event\">팔로워 <span class=\"profile_fwer\">"+data.FWER+"</span></li> ";
			    html +="<li class=\"follow_event\">팔로우 <span class=\"profile_fwo\">"+data.FWO+"</span></li>   ";
			    
	    		$("#profile-stat").html(html);
        }
        
	    function imgList(list){
			var html ="";			
			for(var data of list){                                                                                    
				html+= "<div class=\"gallery-item\" tabindex=\"0\" wtno=\""+data.WRITING_NO+"\" no=\""+data.M_NO+"\">                   ";
				var fileLen = data.FILE_ADR.length;
				var ExtensionNm = data.FILE_ADR.lastIndexOf('.')+1;
				var fileExt = data.FILE_ADR.substring(ExtensionNm, fileLen).toLowerCase();			
				if(fileExt=="mp4" || fileExt=="mov"){
					html+= "			<video class=\"gallery-image\">";
					html+= " 				<source src=\"../resources/upload/"+data.FILE_ADR+"\" type=\"video/mp4\"></source>			";
					html+= "			</video>";
				}
				else{
					html+= "    	<img src=\"../resources/upload/"+data.FILE_ADR+"\" class=\"gallery-image\" alt=\"\" />				";
				}		   
				if(data.WCNT>1){
				    html+= "	<div class=\"gallery-item-type\">																		";
				    html+= "        <i class=\"fas fa-clone\"></i>																		";
				    html+= "    </div>																						    		";
				}
				else if(fileExt=="mp4" || fileExt=="mov"){
					html+= "	<div class=\"gallery-item-type\">																		";
				    html+= "        <i class=\"fas fa-play\"></i>																		";
				    html+= "    </div>																						    		";
				}
			    html+= "    	<div class=\"gallery-item-info\">                                                            			"; 
			    html+= "        <ul>                                                                                     	 			"; 
			    html+= "            <li class=\"gallery-item-likes\"><span class=\"visually-hidden\">Likes:</span><i         			"; 
			    html+= "                    class=\"fas fa-heart\" aria-hidden=\"true\"></i>"+data.LCNT+"</li>               			"; 
			    html+= "            <li class=\"gallery-item-comments\"><span class=\"visually-hidden\">Comments:</span><i   			"; 
			    html+= "                    class=\"fas fa-comment\" aria-hidden=\"true\"></i>"+data.CCNT+"</li>             			"; 
			    html+= "        </ul>                                                                                    	 			";
			    html+= "    	</div>                                                                                       			"; 
		    	html+= "</div>                                                                                           	 			"; 
		    	
			}			
			$("#gallery").html(html);
		}

	    function mdDraw(){  	
	    	var params = $("#modalForm").serialize();
			$.ajax({
				url : "modalpages",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					$("#myModal").html("");
					ModalContent(res.modalM);
					ModalImg(res.md);
					modalFunc();
					ModalCmt();
					like();
					slide();
					heart(res.hcnt);
					heartAD();
					addModalCmt();
					delModalCmt();
					delPost();
					mediaControl();
					mediaControl2();
					mediaControl3();
					mediaControl4();
					emojiAreaClick();					
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }
		
	    function ModalContent(data){   
	    	var html ="";
	    		
				 html+="   	<div class=\"modal-content\" no=\""+data.WRITING_NO+"\">                                                    								   ";
			     html+="       <div class=\"modal_img\">                                                                               									   ";
			     html+="           <div class=\"slider1\">                                                                              								   ";
			     html+="               <div class=\"slide-viewer\">                                                                    									   ";
			     html+="               <div id=\"slide-group\" class=\"slide-group\">                                                  									   ";	                                                                        
			     html+="               </div>                                                                                          									   ";
			     html+="               </div>                                                                                          									   ";
			     html+="               <div class=\"slide-nav\">                                                                       									   ";
			     html+="                   <div class=\"prev\"></div>                                                                 									   ";
			     html+="                   <div class=\"next\"></div>                                                                  									   ";
			     html+="               </div>                                                                                           								   ";
			     html+="               <div class=\"slide-buttons\"></div>                                                             									   ";
			     html+="           </div>                                                                                              									   ";
			     html+="       </div>                                                                                                  									   ";
			     html+="       <div class=\"modal_box\">                                                                               									   ";
			     html+="           <div class=\"cmt_head\">                                                                            									   ";			     		     
			     html+="               <span id=\"close\" class=\"close\">&times;</span>                                               									   ";
			     if(data.M_NO == ${sMNo} ){
			    	 html+="			   <i class=\"fas fa-ellipsis-h postMore\"></i>													 								   ";
			     }	
			     html+="               <div class=\"user_container\">                                                                  									   ";
			     html+="                   <div class=\"profile_img\">                                                                 									   ";
			     html+=" 						<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 		   ";
			     html+="                   </div>                                                                                      									   ";
			     html+="                   <div class=\"user_name\">                                                                   									   ";
			     html+="                       <div class=\"nick_name head_text\">"+data.NICK_NM+"</div>                               									   ";
			     html+="                   </div>                                                                                       								   ";
			     html+="               </div>                                                                                         									   ";
			     html+="           </div>                                                                                             									   ";
			     html+="           <div class=\"cmt_sec1\">                                                                            									   ";
			     html+="               <div class=\"user_container\">                                                                									   ";
			     html+="                   <div class=\"profile_img\">                                                                   								   ";
			     html+=" 						<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" />	 	   ";
			     html+="				   </div>																						 								   ";
			     html+="                   <div class=\"user_name\">                                                                 	 								   ";
			     html+="                        <div class=\"nick_name head_text\">"+data.NICK_NM+"</div>                             	 								   ";
			     html+="                   </div>                                                                                    	 								   ";
			     html+="               </div>                                                                                     	 	 								   ";
			     html+="               <div class=\"modal_con\">"+data.CON+"</div>                                                   	 								   ";
			     html+="               <div class=\"modal_cmt\"></div> 																 	 								   ";
			     html+="           </div>                                                                                                								   ";
			     html+="           <div class=\"cmt_sec2\">                                                                              								   ";
			     html+="               <div class=\"bottom_icons\">                                                                      								   ";
			     html+="                   <div class=\"left_icons\">                                                                    								   ";
			     html+="                       <div class=\"heart_btn\">                                                                 								   ";
			     html+="                           <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\">         								   ";			     											
			     html+="                                     <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" >                								   ";
			     html+="                                     <label for=\"checkbox\">                                                    								   ";
			     html+="                                       <svg id=\"heart-svg\" viewBox=\"467 392 58 57\" xmlns=\"http://www.w3.org/2000/svg\"> ";
			     html+="                                         <g id=\"Group\" fill=\"none\" fill-rule=\"evenodd\" transform=\"translate(467 392)\">";
			     html+="                                           <path d=\"M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z\" id=\"heart\" stroke=\"#000000\" stroke-width=\"3\"></path>";
			     html+="                                           <circle id=\"main-circ\" fill=\"#E2264D\" opacity=\"0\" cx=\"29.5\" cy=\"29.5\" r=\"1.5\"></circle>     ";
			     html+="                                           <g id=\"grp7\" opacity=\"0\" transform=\"translate(7 6)\">                                              ";
			     html+="                                             <circle id=\"oval1\" fill=\"#9CD8C3\" cx=\"2\" cy=\"6\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval2\" fill=\"#8CE8C3\" cx=\"5\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                                                                                                                                   ";
			     html+="                                           <g id=\"grp6\" opacity=\"0\" transform=\"translate(0 28)\">                                             ";
			     html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"3\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                                                                                                                                   ";
			     html+="                                           <g id=\"grp3\" opacity=\"0\" transform=\"translate(52 28)\">                                            ";
			     html+="                                             <circle id=\"oval2\" fill=\"#9CD8C3\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval1\" fill=\"#8CE8C3\" cx=\"4\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                                                                                                                                   ";
			     html+="                                           <g id=\"grp2\" opacity=\"0\" transform=\"translate(44 6)\">                                             ";
			     html+="                                             <circle id=\"oval2\" fill=\"#CC8EF5\" cx=\"5\" cy=\"6\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                           <g id=\"grp5\" opacity=\"0\" transform=\"translate(14 50)\">                                            ";
			     html+="                                             <circle id=\"oval1\" fill=\"#91D2FA\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                           <g id=\"grp4\" opacity=\"0\" transform=\"translate(35 50)\">                                            ";
			     html+="                                             <circle id=\"oval1\" fill=\"#F48EA7\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
			     html+="                                             <circle id=\"oval2\" fill=\"#F48EA7\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                           <g id=\"grp1\" opacity=\"0\" transform=\"translate(24)\">                                               ";
			     html+="                                             <circle id=\"oval1\" fill=\"#9FC7FA\" cx=\"2.5\" cy=\"3\" r=\"2\"></circle>                           ";
			     html+="                                             <circle id=\"oval2\" fill=\"#9FC7FA\" cx=\"7.5\" cy=\"2\" r=\"2\"></circle>                           ";
			     html+="                                           </g>                                                                                                    ";
			     html+="                                         </g>                                                                                                      ";
			     html+="                                       </svg>                                                                                                      ";
			     html+="                                     </label>                                                                                                      ";
			     html+="                           </div>                                                                                                                  ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                       <div class=\"sprite_bubble_icon\">                                                                                          ";
			     html+="                           <i class=\"far fa-comment f_size\"></i>                                                                                 ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                       <div class=\"sprite_share_icon\" data-name=\"share\">                                                                       ";
			     html+="                           <i class=\"far fa-paper-plane f_size\"></i>                                                                             ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                   </div>                                                                                                                          ";
			     html+="               </div>                                                                                                                              ";
			     html+="               <div class=\"likes head_text\"></div>                                                                                               ";
			     html+="           </div>                                                                                                                                  ";
			     html+="           <div class=\"cmt_field\" id=\"cmt_field\">                                                                                              ";
			     html+="			   <div id=\"emoji_area\" class=\"emoji_area\"></div>																					";			    
			     html+="			   <i class=\"far fa-smile\"></i>																										";
			     html+="               <textarea id=\"cmt_con\" class=\"cmt_con\" placeholder=\"댓글 달기...\"></textarea>                                                    ";
			     html+="               <div class=\"m_text head_text\" id=\"add_cmt\">게시</div>                                                                    			";
			     html+="           </div>                                                                                                                                   ";
			     html+="       </div>                                                                                                                          				";
			     html+="   </div>                                                                                                                              				";
			     
		    	 $("#myModal").html(html);
	    }
	    function emojiAreaClick(){
	    	$(".fa-smile").on("click",function(){	   
	    		console.log("gd");
	    		$(this).prev().css("display","block");
	    		emojiArea();
	    		var params = $("#modalForm").serialize();
				$.ajax({
					url : "emoji",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){						    		
			    		emojiList1(res.emoji);
						emojiList2(res.emoji);
						emojiList3(res.emoji);
						emojiList4(res.emoji);
						emojiList5(res.emoji);
						emojiClick();
						emojiClickEvent();
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
	    	});    	
	    }
	    function emojiClickEvent(){
	    	$(".modal-content").click(function(e){ 
	    		if(!$(e.target).hasClass('fa-smile')){ 
	    			$(this).children().children().children('.emoji_area').css("display","none");    			
	    		}
	    	});  		    	
	    }
	    function emojiArea(){
	    	 var html="";
	    	
	    	 html+="					<div class=\"emoji_container\" >       																			 			   ";
		     html+="						<div class=\"emoji_title\"><span>웃는 얼굴 및 사람</span></div>																	";
		     html+="						<div class=\"first emoji\"></div>																							";
		     html+="						<div class=\"emoji_title\"><span>하트 및 기호</span></div>																	";
		     html+="						<div class=\"second emoji\"></div>																						   	";
		     html+="						<div class=\"emoji_title\"><span>사람 손 모양</span></div>																	";
		     html+="						<div class=\"third emoji\"></div>																						   	";
		     html+="						<div class=\"emoji_title\"><span>동물과 자연</span></div>																	";
		     html+="						<div class=\"fourth emoji\"></div>																						   	";
		     html+="						<div class=\"emoji_title\"><span>음식 및 음료</span></div>																	";
		     html+="						<div class=\"fifth emoji\"></div>																						   	";
		     html+="			   		</div>																														   ";
		     
		     $(".emoji_area").html(html);
	    }
	    function emojiList1(list){
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){  
				if(data.EMO_CAT_NO ==1){
					html+="<div class=\"emo\" emo=\""+data.EMOJI+"\">"+data.EMOJI+"</div>";					
				}	
			}	
			$(".first").html(html);
	    }
	    function emojiList2(list){
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){  
				if(data.EMO_CAT_NO ==2){
					html+="<div class=\"emo\" emo=\""+data.EMOJI+"\">"+data.EMOJI+"</div>";					
				}
			}	
			$(".second").html(html);
	    }
	    function emojiList3(list){
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){  
				if(data.EMO_CAT_NO ==3){
					html+="<div class=\"emo\" emo=\""+data.EMOJI+"\">"+data.EMOJI+"</div>";					
				}
			}	
			$(".third").html(html);
	    }
	    function emojiList4(list){
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){  
				if(data.EMO_CAT_NO ==4){
					html+="<div class=\"emo\" emo=\""+data.EMOJI+"\">"+data.EMOJI+"</div>";					
				}			
			}	
			$(".fourth").html(html);
	    }
	    function emojiList5(list){
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){  
				if(data.EMO_CAT_NO ==5){
					html+="<div class=\"emo\" emo=\""+data.EMOJI+"\">"+data.EMOJI+"</div>";					
				}			
			}	
			$(".fifth").html(html);
	    }
	    function emojiClick(){
	    	$(".emo").on("click",function(){
	    		var textVal = $(this).parent().parent().parent().next().next().val();
	    		var newText = textVal + $(this).attr("emo");
	    		var emoText = $(this).parent().parent().parent().next().next().val(newText);
	    	});
	    }	    	   	
	    function ModalCmt(){
	    	var params = $("#modalForm").serialize();
			$.ajax({
				url : "mCmt",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					ModalCmtArea(res.mCmt, res.ModalCmtEx);
					delModalCmt();
					
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }	
	    function ModalCmtArea(list,data2){  
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var data of list){                                                                                                                              				
			     html+="<div class=\"comment_container\" no=\""+data.CMT_NO+"\">       																			 ";
			     html+="   <div class=\"comment\" id=\"comment-list-ajax-post37\">     														 					 ";
			     html+="       <div class=\"comment-detail\">                          														 					 ";
			     html+="           <div class=\"profile_img\">                          													 					 ";
			     html+=" 				<img src=\"../resources/upload/"+data.IMG_ADR+"\" onerror=\"this.src='../resources/images/userpage/replace.png'\" />	 ";
			     html+="		   </div>																									 					 ";
			     html+="           <div class=\"head_text\">"+data.NICK_NM+"</div>      													 					 ";
			     html+="              <div class=\"ccon\">"+data.CMT_CON+"</div>        													 					 ";
			     html+="          </div>                                                													 					 ";
			     html+="       </div>                                                														 					 ";
			     if(data.CMT_WRITER_NO == ${sMNo}){
			    	 html+="	<i class=\"fas fa-ellipsis-h cmtMore\"></i>																	 					 ";
			     }			     
			     html+="   </div>                                                      														 					 ";
			     html+="<div class=\"timer\">"+timeForToday(data.DT)+"</div>           														 					 ";
			}
			
			$(".modal_cmt").html(html);
	    };
	    function addModalCmt(){
	    	$("#add_cmt").on("click",function(){
	    		if($("#cmt_con").val()==""){
	    			alert("댓글 내용을 입력하세요.");
	    		}
	    		else{
	    			$("#cmtVal").val($("#cmt_con").val());
		    		var params = $("#modalCmtForm").serialize();
					$.ajax({
						url : "addModalCmt",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res){
							if(res.result=="success"){
								ModalCmt();	
								$("#cmt_con").val("");
								$("#cmtVal").val("");
							}else{							
								alert("추가실패");
							}
						},
						error : function(request, status, error){
							console.log(error);
						}
					});
	    		}	
	    	})	
	    }
	    function delModalCmt(){ 	
	    	$(".cmtMore").on("click",function(){
	    		if(confirm("삭제하시겠습니까?")){
	    			$("#cmtNo").val($(this).parent().attr("no"));
	    			var params = $("#delMCmtForm").serialize();
					$.ajax({
						url : "delModal",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res){
							if(res.result=="success"){
								ModalCmt();	
							}else{							
								alert("추가실패");
							}
						},
						error : function(request, status, error){
							console.log(error);
						}
					});
	    		}		
	    	});
	    }
	    function delPost(){ 	
	    	$(".postMore").on("click",function(){
	    		if(confirm("삭제하시겠습니까?")){
	    			$("#writingNo3").val($(this).parent().parent().parent().attr("no"));
	    			var params = $("#delPostForm").serialize();
					$.ajax({
						url : "delCrng",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res){
							if(res.result=="success"){
								document.getElementById('myModal').style.display = "none";
								$('body').css("overflow","auto");
								reloadImgList();								
							}else{							
								alert("게시글 삭제 실패");
							}
						},
						error : function(request, status, error){
							console.log(error);
						}
					});
	    		}		
	    	});
	    }
	    function like(){
	    	var params = $("#modalForm").serialize();
			$.ajax({
				url : "likeCnt",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					likeArea(res.like);
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }	
	    function likeArea(data){
	       var html ="";    
			   html+="좋아요<span id=\"like-count-39\">"+data+"</span>개";				   
			   $(".likes").html(html);
	    }
	    function timeForToday(value) {
	        const today = new Date();
	        const timeValue = new Date(value);

	        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        if (betweenTime < 1) return '방금전';
	        if (betweenTime < 60) {
	            return betweenTime+'분전';
	        }

	        const betweenTimeHour = Math.floor(betweenTime / 60);
	        if (betweenTimeHour < 24) {
	            return betweenTimeHour+'시간전';
	        }

	        const betweenTimeDay = Math.floor(betweenTimeHour / 24);
	        if (betweenTimeDay < 7) {
	            return betweenTimeDay+'일전';
	        }
	        const betweenTimeWeek = Math.floor(betweenTimeDay / 7);
	        if (betweenTimeWeek	< 5) {
	            return betweenTimeWeek+'주전';
	        }
	        const betweenTimeMonth = Math.floor(betweenTimeDay / 30);
	        if (betweenTimeMonth < 12) {
	            return betweenTimeDay+'개월';
	        }
	        return Math.floor(betweenTimeDay / 365)+'년전';
	 	}		
	    function ModalImg(list){                                                                                                                         
			var html ="";                                                                                                                                  
			var i=1;                                                                                                                                       
			for(var data of list){                                                                                                                              
				var fileLen = data.FILE_ADR.length;
				var ExtensionNm = data.FILE_ADR.lastIndexOf('.')+1;
				var fileExt = data.FILE_ADR.substring(ExtensionNm, fileLen).toLowerCase();
				
				if(fileExt=="mp4" || fileExt=="mov"){
					html+=" <div class=\"slide slide-"+i+"\">                                       					";
					html+="		<video id=\"player\" controls playsinline autoplay muted loop>							";
	                html+=" 		<source src=\"../resources/upload/"+data.FILE_ADR+"\" alt=\"\" /></source>	   		";
	                html+="		</video>																				"; 
	                html+=" 	<div class=\"play_btn\">																";
	                html+=" 	</div>																					";
	                html+=" 	<div class=\"muted_btn\">																";
	                html+="			<i class=\"fas fa-volume-mute\"></i>												";
	                html+=" 	</div>																					";
		           	html+=" </div>                                                                  					";
				}
				else{
					html+=" <div class=\"slide slide-"+i+"\">                                       ";
	                html+=" <img src=\"../resources/upload/"+data.FILE_ADR+"\" alt=\"\" />	   		";
		           	html+=" </div>                                                                  ";						
				}	
				i++;
			}
			
			$("#slide-group").html(html);
		}
	    function mediaControl(){
			$(".fa-volume-mute").on("click",function(){
				
				const player = document.getElementById("player");
				player.muted = false;
							
				var html="";
				html+="<i class=\"fas fa-volume-up\"></i>";
				$(".muted_btn").html(html);
				mediaControl2();
			});
			
		}
	    function mediaControl2(){
	    	$(".fa-volume-up").on("click",function(){
	    		
				const player = document.getElementById("player");
				player.muted = true;
				
				var html="";
				html+="<i class=\"fas fa-volume-mute\"></i>";
				$(".muted_btn").html(html);
				mediaControl();
			});
	    }
	    function mediaControl3(){
	    	$("#player").on("click",function(){
	    		const player = document.getElementById("player");
				player.pause();
				$(".play_btn").css("width", "100%");
				$(".play_btn").css("height", "100%");
				var html="";
				html+="<i class=\"fas fa-play fa-play1\"></i>";
				$(".play_btn").html(html);
				mediaControl4();
	    	});	    	
	    }
	    function mediaControl4(){
    		$(".play_btn").on("click",function(){
	    		const player = document.getElementById("player");
				player.play();
				mediaControl3();
				$(".play_btn").css("width", 0);
				$(".play_btn").css("height", 0);
				var html="";
				html+=" ";
				$(".play_btn").html(html);
				mediaControl3();
	    	});
	    }
	    function ProfileImg(data){                                                                                                                         
			var html ="";
			
				html+=" <div class=\"pGradient4\"> 																								   				";
				html+="		<svg class=\"pGradient5\" width=\"453\" height=\"453\" viewBox=\"0 0 453 453\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">	";
				html+="			<defs>																															";
				html+="	   			<linearGradient id=\"MyGradient\">																							";
				html+="	        		<stop offset=\"5%\" stop-color=\"#F9913F\" />																			";				
				html+="	        		<stop offset=\"40%\" stop-color=\"#e01b6a\" />																			";
				html+="	        		<stop offset=\"80%\" stop-color=\"#CD51A4\" />																			";
				html+="	        	</linearGradient>																											";
				html+="	 		</defs>																															";
				html+="			<circle cx=\"226.5\" cy=\"226.5\" r=\"216.5\" stroke=\"url(#MyGradient)\" stroke-width=\"10\"/>									";
				html+="		</svg>																																";
				html+=" 	<div class=\"pGradient6\"> 																								   			";
				html+=" 		<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 		   		";
				html+=" 	</div> 																								   					   			";
				html+=" </div>																								   					   				";	
			$(".profile-image").html(html);
		}
	    function heart(data){
	    	if( data == 1 ){
    			$(".checkbox").attr("checked",true);
	    	}else{
            	$(".checkbox").attr("checked",false);
	    	}
	    }
	    function heartAD(){
	    	$("#checkbox").on("click",function(){
	    		if($(this).is(":checked") == true) {
		    		var params = $("#modalForm").serialize();
		    		$.ajax({
		    			url : "addHeart",
		    			type : "post",
		    			dataType : "json",
		    			data : params,
		    			success : function(res){
		    				if(res.result=="success"){
		    					like();
		    				}else{
		    					alert("add실패");
		    				}
		    			},
		    			error : function(request, status, error){
		    				console.log(error);
		    			}
		    		});
	    		}else{
		    		var params = $("#modalForm").serialize();
	    			$.ajax({
	    				url : "delHeart",
	    				type : "post",
	    				dataType : "json",
	    				data : params,
	    				success : function(res){
	    					if(res.result=="success"){
	    						like();
	    					}else{
	    						alert("삭제실패");
	    					}
	    				},
	    				error : function(request, status, error){
	    					console.log(error);
	    				}
	    			});
	    		}
    		});	    		    		
	    }
	    function followArea(){
        	var params = $("#modalForm").serialize();
			$.ajax({
				url : "followArea",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					follows(res.fExist,res.fExist2);
					editProfile();
					addFollow();
					delFollow();
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
        }
        
        function follows(data1,data2){
			var html ="";
			if(data1 == 0 && data2 == 0){
				html +="<button id=\"follow_btn\" class=\"follow_btn\">		";
			    html +="팔로우<i class=\"fas fa-user-plus\"></i>				";
			    html +="</button>											";
			}
			else if(data1 > 0 && data2 == 0){
			    html +="<button id=\"unfollow_btn\" class=\"unfollow_btn\"> ";
			    html +="<i class=\"fas fa-user-check\"></i>					";
			    html +="</button>											";
			}else if(data1 == 0 && data2 > 0){
				html +="<button id=\"editBtn\" class=\"btn profile-edit-btn\">		         	   ";
				html +="	프로필 편집 <i class=\"fas fa-cog\" aria-hidden=\"true\"></i>		   	   ";
				html +="</button>																   ";
			}else{
				alert("error");
			}		
	    	$(".follow_area").html(html);
        }
	    function addFollow(){
	    	$("#follow_btn").on("click",function(){
	    		var params = $("#addrForm").serialize();
	    		$.ajax({
	    			url : "addFollow",
	    			type : "post",
	    			dataType : "json",
	    			data : params,
	    			success : function(res){
	    				if(res.result=="success"){
	    					followArea(); 	
	    					reloadFollowArea();
	    				}else{
	    					alert("add실패");
	    				}
	    			},
	    			error : function(request, status, error){
	    				console.log(error);
	    			}
	    		});
	    	});
	    }
	    function delFollow(){
	    	$("#unfollow_btn").on("click",function(){
	    		var params = $("#addrForm").serialize();
				$.ajax({
					url : "delFollow",
					type : "post",
					dataType : "json",
					data : params,
					success : function(res){
						if(res.result=="success"){
							followArea();
							reloadFollowArea();
						}else{							
							alert("삭제실패");
						}
					},
					error : function(request, status, error){
						console.log(error);
					}
				});
	    	})	
	    }
	    function editProfile(){
	    	$("#editBtn").on("click",function(){	   
	  			  $("#editForm").attr("action","../edit_profile");
	  			  $("#editForm").submit(); 
	  		}); 
	    }
	    function searchUser(){	    	
	    	$("#searchText").on("change keyup paste",function(){
	    		if($("#searchText").val() == '' || $("#searchText").val() == null){
	    			var html="";
		    		html+="<i class=\"fas fa-search\"></i>";
		    		$(".search_icon").html(html);	
	    			$(".user_area").css("display","none");	    			
		    	}else{
		    		$(".user_area").css("display","block");
		    		var params = $("#searchForm").serialize();		    		
		    		$.ajax({
		    			url: "searchUser",
		    			type : "post",
		    			dataType:"json",
		    			data: params,
		    			success: function(res) {
		    				searchResult(res.search);		    				
		    			},
		    			error:function(request, status, error) {
		    				console.log(error);
		    			},complete : function() {
		    				searchExit();   
		    				searchLocate();
		    		    }
		    		});
		    	}		    		
	    	});		    	
	    }
	    function searchLocate(){
	    	$("rec_user1").on("click",function(){
	    		var user = $(this).attr("nfo");
	    		location.href="coronagram/"+user+"";
	    	});
	    }
	    function searchResult(list){
	    	var html="";
	    	
	    	for(data of list){
	    		html+="<div class=\"rec_user1\" nfo=\""+data.NICK_NM+"\">																		 				";
				html+="		<div class=\"profile_thumb\">																					 					";
				html+=" 		<img src=\"../resources/upload/"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 	"; 
				html+="		</div>																											 					";
				html+="		<div class=\"detail1\">																							 					";
				html+="			<div class=\"rec_id1\">"+data.NICK_NM+"</div>																 					";
				if(data.INTRO_CON != null){
					html+="			<span class=\"rec_con\">"+data.INTRO_CON+"</span>														 					";
				}					
				html+="		</div>																											 					";
				html+="</div>																												 					";
	    	}
	    	$(".user_result").html(html);
	    	var html2="";
	    		html2+="<i class=\"fas fa-times-circle\"></i>";
	    	$(".search_icon").html(html2);		    	
	    }
	    function searchExit(){
	    	$(".fa-times-circle").on("click",function(){
	    		$(".user_area").css("display","none");
	    	});
	    }
	    function progressbar(){
	    	$(".slider").slick({
	    		  infinite: true,
	    		  arrows: true,
	    		  dots: false,
	    		  autoplay: false,
	    		  speed: 800,
	    		  slidesToShow: 1,
	    		  slidesToScroll: 1,
	    		   prevArrow: '<div class="slide-arrow prev-arrow"><i class="fas fa-chevron-circle-left sleft"></i></div>',
	    		   nextArrow: '<div class="slide-arrow next-arrow"><i class="fas fa-chevron-circle-right sright"></i></div>',
	    		});

	    		 //ticking machine
	    		    var percentTime;
	    		    var tick;
	    		    var time = 1;
	    		    var progressBarIndex = 0;

	    		    $('.progressBarContainer .progressBar').each(function(index) {
	    		        var progress = "<div class='inProgress inProgress" + index + "'></div>";
	    		        $(this).html(progress);
	    		    });

	    		    function startProgressbar() {
	    		        resetProgressbar();
	    		        percentTime = 0;
	    		        tick = setInterval(interval, 10);
	    		    }

	    		    function interval() {
	    		        if (($('.slider .slick-track div[data-slick-index="' + progressBarIndex + '"]').attr("aria-hidden")) === "true") {
	    		            progressBarIndex = $('.slider .slick-track div[aria-hidden="false"]').data("slickIndex");
	    		            startProgressbar();
	    		        } else {
	    		            percentTime += 1 / (time + 10);
	    		            $('.inProgress' + progressBarIndex).css({
	    		                width: percentTime + "%"
	    		            });
	    		            if (percentTime >= 100) {
	    		                $('.single-item').slick('slickNext');
	    		                progressBarIndex++;
	    		                if (progressBarIndex > 2) {
	    		                    progressBarIndex = 0;
	    		                }
	    		                startProgressbar();
	    		            }
	    		        }
	    		    }

	    		    function resetProgressbar() {
	    		        $('.inProgress').css({
	    		            width: 0 + '%'
	    		        });
	    		        clearInterval(tick);
	    		    }
	    		    startProgressbar();
	    		    // End ticking machine

	    		    $('.progressBarContainer div').click(function () {
	    		    	clearInterval(tick);
	    		    	var goToThisIndex = $(this).find("span").data("slickIndex");
	    		    	$('.single-item').slick('slickGoTo', goToThisIndex, false);
	    		    	startProgressbar();
	    		    });


	    		//close the slider if the slider index is last index
	    		  var $slider = $('.slider');

	    		  $slider.on('afterChange', function(event, slick, currentSlide, nextSlide) { 
	    		       console.log(currentSlide);
	    		  });

	    		 $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide) { 
	    		       console.log("nextSlide",nextSlide);
	    		  })
	    }
	    function slide(){
	    	$('.slider1').each(function(){
	            var $this = $(this);
	            var $group = $this.find('.slide-group');
	            var $slides = $this.find('.slide');
	            var buttonArray = [];
	            var currentIndex = 0;

	            var $nav = $(this).children('.slide-nav').find('div');
	        
	             $nav.on('click', function (event) {
	                event.preventDefault();
	                console.log($(this));
	                if ($(this).hasClass('next')) {
	                    if (currentIndex === $slides.length -1) {
	                        move(0);
	                    }
	                    move(currentIndex + 1);
	                } else {
	                    if (currentIndex === 0) {
	                        move($slides.length -1);
	                    }
	                    move(currentIndex - 1);
	                }
	            });

	        function move(newIndex) {
	            var animateLeft, slideLeft;

	            if ($group.is(':animated') || currentIndex === newIndex) {
	                return;
	            }

	            buttonArray[currentIndex].removeClass('active');
	            buttonArray[newIndex].addClass('active');

	            if (newIndex > currentIndex) {
	                slideLeft = '100%';
	                animateLeft = '-100%';
	            } else {
	                slideLeft = '-100%';
	                animateLeft = '100%';
	            }

	            $slides.eq(newIndex).css({
	                left: slideLeft,
	                display: 'block'
	            });

	            $group.animate({left: animateLeft}, function() {
	                $slides.eq(currentIndex).css({display: 'none'});
	                $slides.eq(newIndex).css({left: 0});
	                $group.css({left: 0});
	                currentIndex = newIndex;
	            });
	        }

	        $.each($slides, function(index) {
	            var $button = $('<button type="button" class="slide-btn">&bull;</button>');
	            if (index === currentIndex) {
	                $button.addClass('active');
	            }
	            $button.on('click', function(){
	                move(index);
	            }).appendTo('.slide-buttons');
	            buttonArray.push($button);
	        });
	        })
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
		                        <a href="../logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
		                    </li>
		                    <li>
		                        <a href="#" class="cm_userinfo">개인정보수정</a>
		                    </li>
		                </ul>
                	</div>
	            <div class="cm_user_name">
					<c:if test="${!empty sMNo}">
						${sMNm}님 어서오세요.
					</c:if>
				</div>
				<form action="#" id="searchForm" method="post">
					<div class="search_area">
						<div class="search_icon">
							<i class="fas fa-search"></i>
						</div>						
						<input type="text" name="searchText" id="searchText" class="search_text">						
					</div>									
				</form>	
				<div class="user_area">
					<div class="user_result"></div>
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
            <div class="container">    
                <div class="profile">   
                    <div class="profile-image"> 
                    </div>    
                    <div class="profile-user-settings">    
                        <div class="profile-user-setting">
                        </div>                                                         
                       	<div class="follow_area"></div>
                    </div>  
                    <div class="profile-stats">  
                        <ul id="profile-stat"></ul>   
                    </div>   
                    <div class="profile-bio"></div>    
                </div>
            </div>
            <nav>
            	<div class="nav_menu">
            		<div class="hidden_menu">
						<div class="follow_prev" onclick="ScrollPrev()"></div>
			            <div class="follow_next" onclick="ScrollNext()"></div>
			            <div class="scroll_inner">
			            	<div class="add_story_container"></div>
			            </div>			            
			        </div> 
            		<hr class="nav_hr">	        		
		        	<div class="nav_list">
		        		<div class="nav_list_post">	        			
		        			<div class="menu_post">
		        				<div class="menu_icon_area1">
		        					<img class="menu_icon1" src="../resources/images/userpage/grid1.png" alt="">
		        				</div>	        				
		        				<span>게시물</span>
		        			</div>
		        			<div class="menu_post2">
		        				<div class="menu_icon_area2">
		        					<img class="menu_icon2" src="../resources/images/userpage/play2.png" alt="">
		        				</div>       				
		        				<span>동영상</span>
		        			</div>
		        			<div class="menu_post3">
		        				<div class="menu_icon_area3">
		        					<img class="menu_icon3" src="../resources/images/userpage/film2.png" alt="">
		        				</div>       				
		        				<span>릴스</span>
		        			</div>		        			
		        		</div>
		        	</div>
		        	<div class="nav_line"></div>
	        	</div>
            </nav>         
        </header>
     	<main>    
     		<div id="lk_modal" class="lk_modal">																											
				<div class="lk_modal_body">
					<div class="lk_modal_header">
						좋아요
					<i class="fas fa-times lk_modal_close"></i>
					</div>
					<div class="lk_modal_main">
						
					</div>
				</div>																								
	 		</div>    
	        <div id="myModal" class="modal">
	        	
	        </div>        
	        <div class="container">
	            <div id="gallery" class="gallery"></div>     
	        </div>   
    		<form action="#" id="addrForm" method="post">
    			<input type="hidden" name="m_no" value="${sMNo}"/>
    			<input type="hidden" name="nickNm" value="<%= request.getAttribute("nicknm") %>"/>
    		</form>
    		<form action="#" id="storyForm" method="post">
    	   	  <input type="hidden" name="storyNo" id="storyNo"/>
    	   	  <input type="hidden" name="nickNm" value="<%=request.getAttribute("nicknm")%>"/>
		   </form>
           <form action="#" id="editForm" method="post">
               <input type="hidden" name="m_no" value="${sMNo}"/>  
           </form>
           <form action="#" id="modalForm" method="post">
           	  <input type="hidden" name="m_no" value="${sMNo}"/> 
    	   	  <input type="hidden" name="writingNo" id="writingNo"/>
    	   	  <input type="hidden" name="nickNm" value="<%=request.getAttribute("nicknm")%>"/>
		   </form>
		   <form action="#" id="modalCmtForm" method="post">
           	  <input type="hidden" name="m_no" value="${sMNo}"/> 
    	   	  <input type="hidden" name="writingNo" id="writingNo2"/>
    	   	  <input type="hidden" name="cmt_con" id="cmtVal"/>
		   </form>
		   <form action="#" id="delMCmtForm" method="post">
    	   	  <input type="hidden" name="cmtNo" id="cmtNo"/>
		   </form>
		   <form action="#" id="delPostForm" method="post">
    	   	  <input type="hidden" name="writingNo" id="writingNo3"/>
		   </form>
		   <form action="crngAdd" id="addCrngForm" method="post">
    	   	  <input type="hidden" name="m_no" value="${sMNo}"/>
		   </form>
		   <form action="#" id="ReelsMForm" method="post">
    	   	  <input type="hidden" name="reelsNo" id="reelsNo"/>
    	   	  <input type="hidden" name="nickNm" value="<%=request.getAttribute("nicknm")%>"/>
    	   	  <input type="hidden" name="m_no" value="${sMNo}"/>
		   </form>
		   <form action="reelsAdd" id="addReelsForm" method="post">
    	   	  <input type="hidden" name="m_no" value="${sMNo}"/>
		   </form>
		   <form action="crngVideoAdd" id="addCrngVideoForm" method="post">
    	   	  <input type="hidden" name="m_no" value="${sMNo}"/>
		   </form>
		   <form action="#" id="AddDelFoForm" method="post">
          	  <input type="hidden" name="m_no" value="${sMNo}"/>
          	  <input type="hidden" name="m_no2" id="m_no2"/> 
	      </form>
	     
	 	</main>	   
    	<script src="../resources/script/menu_bar/menu_bar.js"></script>
    	<script src='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js'></script>
	</body>
</html>