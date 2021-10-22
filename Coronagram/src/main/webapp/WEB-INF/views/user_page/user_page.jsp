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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title><%= request.getAttribute("nicknm") %>님 개인 페이지</title>
    <style>
    	
    </style>
    <script>
        $(document).ready(function(){
        	reloadList();       	
        	
            $(document).on("click",".gallery-item",function(){
            	$("#myModal").val("");
            	$("#writingNo").val($(this).attr("wtno"));
            	$("#writingNo2").val($(this).attr("wtno"));
            	modal.style.display="block";
            	mdDraw();          	
            });
            
            var modal = document.getElementById('myModal');  
            
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }           
        });
        function modalFunc(){
            $(".close").on("click",function(){
            	document.getElementById("myModal").style.display="none";
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
					$("#myModal").val("");
					ProfileImg(res.intro);				
					intro(res.intro);
					introNm(res.intro);				
					profileCnt(res.intro);
					imgList(res.list);
					followArea();
					editProfile();
					addFollow();
		        	delFollow();					
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
        function intro(intro){
        	var html ="";
        		html+="<h1 id=\"mId\" class=\"profile-user-name\">"+intro.NICK_NM+"</h1> 	  ";
        		$(".profile-user-setting").html(html);      	
        }
        function introNm(data){
        	var html ="";
	        	html+="<span class=\"profile-real-name\">"+data.M_NM+"</span>			 	  ";
	        	if(data.INTRO_CON != '' && data.INTRO_CON != null){
	        		html+="<div class=\"intro_con\">"+data.INTRO_CON+"</div>			 	  ";
	        	}	        	
        		$(".profile-bio").html(html);
        }
        function profileCnt(data){
			var html ="";
				html +="<li>게시물 <span class=\"profile-stat-count\">"+data.PCNT+"</span></li> ";
			    html +="<li>팔로워 <span class=\"profile-stat-count\">"+data.FWER+"</span></li> ";
			    html +="<li>팔로우 <span class=\"profile-stat-count\">"+data.FWO+"</span></li>  ";
	    		$("#profile-stat").html(html);
        }
        
	    function imgList(list){
			var html ="";			
			for(var data of list){                                                                                    
				html+= "<div class=\"gallery-item\" tabindex=\"0\" wtno=\""+data.WRITING_NO+"\" no=\""+data.M_NO+"\">                   "; 
			    html+= "    	<img src=\"../"+data.FILE_ADR+"\" class=\"gallery-image\" alt=\"\" />									"; 
				if(data.WCNT>1){
				    html+= "	<div class=\"gallery-item-type\">																		";
				    html+= "        <span class=\"visually-hidden\">Gallery</span><i class=\"fas fa-clone\" aria-hidden=\"true\"></i>	";
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
					$("#myModal").val("");
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
			     html+="           <div class=\"slider\">                                                                              									   ";
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
			     html+=" 						<img src=\"../"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 		   ";
			     html+="                   </div>                                                                                      									   ";
			     html+="                   <div class=\"user_name\">                                                                   									   ";
			     html+="                       <div class=\"nick_name head_text\">"+data.NICK_NM+"</div>                               									   ";
			     html+="                   </div>                                                                                       								   ";
			     html+="               </div>                                                                                         									   ";
			     html+="           </div>                                                                                             									   ";
			     html+="           <div class=\"cmt_sec1\">                                                                            									   ";
			     html+="               <div class=\"user_container\">                                                                									   ";
			     html+="                   <div class=\"profile_img\">                                                                   								   ";
			     html+=" 						<img src=\"../"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" />	 	   ";
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
			     html+="                   <div class=\"right_icon\">                                                                                                      ";
			     html+="                       <i class=\"far fa-bookmark\"></i>                                                        								   ";
			     html+="                   </div>                                                                                                                          ";
			     html+="               </div>                                                                                                                              ";
			     html+="               <div class=\"likes head_text\"></div>                                                                                               ";
			     html+="           </div>                                                                                                                                  ";
			     html+="           <div class=\"cmt_field\" id=\"cmt_field\">                                                                                              ";
			     html+="               <textarea id=\"cmt_con\" class=\"cmt_con\" placeholder=\"댓글 달기...\"></textarea>                                                    ";
			     html+="               <div class=\"m_text head_text\" id=\"add_cmt\">게시</div>                                                                    			";
			     html+="           </div>                                                                                                                                   ";
			     html+="       </div>                                                                                                                          				";
			     html+="   </div>                                                                                                                              				";
			     
		    	 $("#myModal").html(html);
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
	    function ModalCmtArea(data,data2){  
	    	var html ="";                                                                                                                                                                                                                                                                      
			for(var list of data){                                                                                                                              				
			     html+="<div class=\"comment_container\" no=\""+list.CMT_NO+"\">        ";
			     html+="   <div class=\"comment\" id=\"comment-list-ajax-post37\">      ";
			     html+="       <div class=\"comment-detail\">                           ";
			     html+="           <div class=\"profile_img\">                          ";
			     html+=" 				<img src=\"../"+list.IMG_ADR+"\" onerror=\"this.src='../resources/images/userpage/replace.png'\" />	 ";
			     html+="		   </div>												";
			     html+="           <div class=\"head_text\">"+list.NICK_NM+"</div>      ";
			     html+="              <div class=\"ccon\">"+list.CMT_CON+"</div>        ";
			     html+="          </div>                                                ";
			     html+="       </div>                                                	";
			     if(list.CMT_WRITER_NO == ${sMNo}){
			    	 html+="	<i class=\"fas fa-ellipsis-h cmtMore\"></i>				";
			     }			     
			     html+="   </div>                                                       ";
			     html+="<div class=\"timer\">"+timeForToday(list.DT)+"</div>           	";
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
	    function ModalImg(md){                                                                                                                         
			var html ="";                                                                                                                                  
			var i=1;                                                                                                                                       
			for(var list of md){                                                                                                                              
				
				html+=" <div class=\"slide slide-"+i+"\">                                       ";
                html+=" <img src=\"../"+list.FILE_ADR+"\" alt=\"\" />	   						";
	           	html+=" </div>                                                                  ";
				i++;	
			}
			
			$("#slide-group").html(html);
		}
	    function ProfileImg(data){                                                                                                                         
			var html ="";
				
				html+=" <img src=\"../"+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='../resources/images/userpage/replace.png'\" /> 		   ";
					
			$(".profile-image").html(html);
		}
	    function heart(data){
	    	if( data == 1 ){
    			$("#checkbox").attr("checked",true);
	    	}else{
            	$("#checkbox").attr("checked",false);
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
				html +="	Edit Profile <i class=\"fas fa-cog\" aria-hidden=\"true\"></i>		   ";
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
	    function slide(){
	    	$('.slider').each(function(){
	            var $this = $(this);
	            var $group = $this.find('.slide-group');
	            var $slides = $this.find('.slide');
	            var buttonArray = [];
	            var currentIndex = 0;

	            var $nav = $('.slide-nav').find('div');
	        
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
	        	<div class="nav_line"></div>
		        	<div class="nav_list">
		        		<div class="nav_list_post">	        			
		        			<div class="menu_post">
		        				<i class="fas fa-camera-retro"></i>
		        				<span>게시물</span>
		        			</div>		        			
		        		</div>
		        	</div>
	        	</div>
            </nav>         
        </header>
     	<main>        
	        <div id="myModal" class="modal"></div>        
	        <div class="container">
	            <div id="gallery" class="gallery"></div>     
	        </div>   
    		<form action="#" id="addrForm" method="post">
    			<input type="hidden" name="m_no" value="${sMNo}"/>
    			<input type="hidden" name="nickNm" value="<%= request.getAttribute("nicknm") %>"/>
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
	 	</main>	   
    	<script src="../resources/script/menu_bar/menu_bar.js"></script>
	</body>
</html>