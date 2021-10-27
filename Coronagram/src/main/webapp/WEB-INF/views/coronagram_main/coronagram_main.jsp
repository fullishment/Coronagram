<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Coronagram</title>
    <link rel="stylesheet" href="resources/css/p_coronagram/menu_bar.css"><!-- css-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"> <!-- font-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> <!-- jquery-->
    <link rel="stylesheet" href="resources/css/p_coronagram/common.css?after">
    <link rel="stylesheet" href="resources/css/p_coronagram/style.css">
    <link rel="stylesheet" href="resources/css/p_coronagram/coronagram.css">
	    <script>
		    $(document).ready(function(){
		    	reloadList();
		    });
	    	$(window).load(function(){
	    		
	    	});
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
			            }).appendTo($(this).parent().parent().parent().children(".slide-buttons"));
			            
			            buttonArray.push($button);
			        });
		        })
		    }
			function reloadList(){
				var params=$("#postForm").serialize();	
				$.ajax({ 
					url:"crngPost",
					type:"post",
					dataType:"json",
					data: params,
					success : function(res){
						crngPost(res.post, res.postCmt);			
						timeForToday();
						heart(res.post);
						heartAD();
						addPostCmt();
						followList(res.listFo);
						notFollowList(res.notFo);
						followAdd();						
						modalMover();
						modalMover2();
					},
					error : function(request,status,error){
						console.log(error);
					}
				});
			}
		    function crngPost(list,list2){
				var html ="";	
				
				var k=0;
				var u=0;
				 for(data of list){
		
				 html+="	<article class=\"contents postNo\" wtno=\""+data.WRITING_NO+"\">                                               								";  
			     html+="      <header class=\"top\">                                                                                    								";    
			     html+="          <div class=\"user_container\">                                                                       									";  
				 html+="		  <div class=\"pGradient1\"> 																								   			";
				 html+="			  <svg class=\"pGradient2\" width=\"453\" height=\"453\" viewBox=\"0 0 453 453\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">";
				 html+="			  	<defs>																															";
				 html+="	   				<linearGradient id=\"MyGradient\">																							";
				 html+="	        			<stop offset=\"5%\" stop-color=\"#F9913F\" />																			";				
				 html+="	        			<stop offset=\"40%\" stop-color=\"#e01b6a\" />																			";
				 html+="	        			<stop offset=\"80%\" stop-color=\"#CD51A4\" />																			";
				 html+="	        		</linearGradient>																											";
				 html+="	 		  	</defs>																															";
				 html+="			  <circle cx=\"226.5\" cy=\"226.5\" r=\"216.5\" stroke=\"url(#MyGradient)\" stroke-width=\"30\"/>									";
				 html+="			  </svg>																															";	     
			     html+="              <div class=\"profile_img\">                                                                       				 				";    
			     html+=" 				   <img src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	 				";    
			     html+="              </div>                                                                                            								";    
			     html+="              <div class=\"user_name\">                                                                         								";    
			     html+="                  <div class=\"nick_name m_text\">                                        														";
			     html+="					<a href=\"coronagram/"+data.NICK_NM+"\">"+data.NICK_NM+"</a> 																";
			     html+="                  </div>                                        																				";
			     html+="                  <div class=\"country s_text\">"+timeForToday(data.DT)+"</div>                                 								";    
			     html+="              </div>                                                                                            								";    
			     html+="          </div>                                                                                                								"; 
			     html+="          </div>                                                                                            									";
			     html+="          <div class=\"sprite_more_icon\" data-name=\"more\">                                                   								";    
			     html+="              <ul class=\"toggle_box\">                                                                         								";    
			     html+="              </ul>                                                                                             								";    
			     html+="          </div>                                                                                                								";    
			     html+="      </header>                                                                                                 								";     
			     html+="      <div class=\"img_section\">                                                                               								";    
			     html+="          <div class=\"trans_inner\">                                                                           								";    
			     html+="              <div class=\"slider\">                                                                            								";    
			     html+="                  <div class=\"slide-viewer\">                                                                  								";    
			     html+="                    <div id=\"slide-group\" class=\"slide-group\">                                             									";
		         var j=1;	    
		         var fileAdr=data.FILE_ADRS;
		         var fileAdrSplit = fileAdr.split(',');
		         for ( var i = 0; i < fileAdrSplit.length; i++) {
		       	 	 html+=" <div class=\"slide slide-"+j+"\">                                       									 								";
		           	 html+=" <img class=\"p_img\" src=\""+fileAdrSplit[i]+"\" alt=\"\" />	   						   									 				";
		          	 html+=" </div>                                                                  									 								";
		          	 j++;        	
		         }	
			     html+="                    </div>                                                                     					 								";
			     html+="                  </div>                                                                                         								";    
			     html+="                  <div class=\"slide-nav\">                                                                      								";   
			     if(fileAdrSplit.length > 1){
			    	 html+="                      <div class=\"prev\"></div>                                                             								";    
				     html+="                      <div class=\"next\"></div>                                                             								"; 
			     }     
			     html+="                    </div>                                                                                       								";    
			     html+="                  <div class=\"slide-buttons\"></div>                                                            								";    
			     html+="              </div>                                                                                             								";    
			     html+="      </div>                                                                                                     								";    
			     html+="      <div class=\"bottom_icons\">                                                                               								";    
			     html+="          <div class=\"left_icons\">                                                                             								";    
			     html+="              <div class=\"heart_btn\">                                                                          								";	     
			     html+="                  <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\">                  								"; 	     
			     html+="                                     <input type=\"checkbox\" class=\"checkbox\" id=\"checkbox"+k+"\" >          								";
			     html+="                                     <label for=\"checkbox"+k+"\" class=\"hLabel\">                              								";
			     k++; 
			     html+="                                       <svg id=\"heart-svg\" viewBox=\"467 392 58 57\" xmlns=\"http://www.w3.org/2000/svg\">					";
			     html+="                                         <g id=\"Group\" fill=\"none\" fill-rule=\"evenodd\" transform=\"translate(467 392)\">					";
			     html+="                                           <path d=\"M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z\" class=\"heart\" stroke=\"#000000\" stroke-width=\"3\"></path>";
			     html+="                                           <circle class=\"main-circ\" fill=\"#E2264D\" opacity=\"0\" cx=\"29.5\" cy=\"29.5\"r=\"1.5\"></circle>";
			     html+="                                           <g class=\"grp7\" opacity=\"0\" transform=\"translate(7 6)\">                                        ";
			     html+="                                             <circle class=\"oval1\" fill=\"#9CD8C3\" cx=\"2\" cy=\"6\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval2\" fill=\"#8CE8C3\" cx=\"5\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                                                                                                                                ";
			     html+="                                           <g id=\"grp6\" opacity=\"0\" transform=\"translate(0 28)\">                                          ";
			     html+="                                             <circle class=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval2\" fill=\"#91D2FA\" cx=\"3\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                                                                                                                                ";
			     html+="                                           <g id=\"grp3\" opacity=\"0\" transform=\"translate(52 28)\">                                         ";
			     html+="                                             <circle class=\"oval2\" fill=\"#9CD8C3\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval1\" fill=\"#8CE8C3\" cx=\"4\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                                                                                                                                ";
			     html+="                                           <g id=\"grp2\" opacity=\"0\" transform=\"translate(44 6)\">                                          ";
			     html+="                                             <circle class=\"oval2\" fill=\"#CC8EF5\" cx=\"5\" cy=\"6\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                           <g id=\"grp5\" opacity=\"0\" transform=\"translate(14 50)\">                                         ";
			     html+="                                             <circle class=\"oval1\" fill=\"#91D2FA\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval2\" fill=\"#91D2FA\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                           <g id=\"grp4\" opacity=\"0\" transform=\"translate(35 50)\">                                         ";
			     html+="                                             <circle class=\"oval1\" fill=\"#F48EA7\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                       ";
			     html+="                                             <circle class=\"oval2\" fill=\"#F48EA7\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                       ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                           <g id=\"grp1\" opacity=\"0\" transform=\"translate(24)\">                                            ";
			     html+="                                             <circle class=\"oval1\" fill=\"#9FC7FA\" cx=\"2.5\" cy=\"3\" r=\"2\"></circle>                     ";
			     html+="                                             <circle class=\"oval2\" fill=\"#9FC7FA\" cx=\"7.5\" cy=\"2\" r=\"2\"></circle>                     ";
			     html+="                                           </g>                                                                                                 ";
			     html+="                                         </g>                                                                                                   ";
			     html+="                                       </svg>                                                                                                   ";
			     html+="                                     </label>                                                                                                   ";
			     html+="                           </div>                                                                                        						";
			     html+="              		   </div>                                                                                                					";
			     html+="                       <div class=\"sprite_bubble_icon\">                                                                                       ";
			     html+="                           <i class=\"far fa-comment f_size\"></i>                                                                              ";
			     html+="                       </div>                                                                                                                   ";
			     html+="                       <div class=\"sprite_share_icon\" data-name=\"share\">                                                                    ";
			     html+="                           <i class=\"far fa-paper-plane f_size\"></i>                                                                          ";
			     html+="                       </div>                                                                                                                   ";
			     html+="          </div>                                                                                                    							";
			     html+="          <div class=\"right_icon\">                                                                                  							";
			     html+="              <div class=\"sprite_bookmark_outline\" data-name=\"bookmark\"></div>                                      						";
			     html+="          </div>                                                                                                    							";
			     html+="      </div>                                                                                                        							";
			     html+="      <div class=\"likes head_text\">                                                                                    						";
			     html+="			좋아요<span id=\"like-count-39\">"+data.LC+"</span>개																				    ";	
			     html+="      </div>                                                                                                        							";
			     html+="      <div class=\"comment_container\">                                                                               							";
			     html+="      <div class=\"comment_cnt\"> 																												";
			     html+="		<a href=\"\" class=\"total_cmt_cnt\">댓글"+data.CCNT+"개 모두 보기</a>																		";
			     html+="	  </div>																																	";
			     var m = 1;
			     var q = 2;
			     for(data2 of list2){			    	 
			    	 if(data2.WRITING_NO == data.WRITING_NO){
			    		 html+="<div class=\"cmt_area\"> ";
			    		 html+="<div class=\"comment_container\" no=\""+data2.CMT_WRITER_NO+"\">         																";
					     html+="   <div class=\"comment\" id=\"comment-list-ajax-post37\">        																		";
					     html+="       <div class=\"comment-detail\">                             																		";
					     html+="           	  <div class=\"cmt_list"+m+" head_text\">      						 														";				     
					     html+="					<a href=\"coronagram/"+data2.NICK_NM+"\">"+data2.NICK_NM+"</a> 														";
					     html+="  	  				<div id=\"m_info"+u+"\" class=\"modal_info_area"+q+"\"></div>    			  										";
					     html+="           	  </div>      											  																	";
					     html+="              <div class=\"ccon\">"+data2.CMT_CON+"</div>         																		";
					     html+="          </div>                                                  																		";
					     html+="       </div>                                                	  																		";			     
					     html+="   </div>                                                         																		";
					     html+="<div class=\"timer\">"+timeForToday(data2.DT)+"</div>             																		";
					     if(data2.CMT_WRITER_NO == ${sMNo}){
					    	 html+="	<i class=\"fas fa-ellipsis-h cmtMore\"></i>				  																		";
					     }			     
					     html+="</div>";					     
					     m++;
					     q++;
					     u++;
				     }			    	 
			     }    
			     html+="      </div>                                                                                                        							";
			     html+="      <div class=\"comment_field\" id=\"add-comment-post37\">                                                           						";
			     html+="          <input type=\"text\" placeholder=\"댓글달기...\">                                                             							";
			     html+="          <div class=\"upload_btn m_text\" data-name=\"comment\">게시</div>                                             							";
			     html+="      </div>                                                                                                        							";
			     html+="  </article>                                                                                                        							";
			    
				}
				
				$("#contents_box").html(html);
				
				slide();
			}
		    function modalMover(){
		    	$(".cmt_list1").mouseover(function(){	    		
		    		$("#m_no3").val($(this).parent().parent().parent().attr('no'));
		    		var params = $("#modalInfoForm").serialize();
		    		$(this).children('.modal_info_area2').css("display","block");
		    		$.ajax({
		    			url : "mInfo",
		    			type : "post",
		    			dataType : "json",
		    			data : params,
		    			success : function(res){	    				
		    				modalInfo(res.mInfo);
		    				modalInfoImg(res.mImg);
		    				modalMLeave();
		    			},
		    			error : function(request, status, error){
		    				console.log(error);
		    			}
		    		});
		    	})
		    }
		    function modalMLeave(){
		    	$(".cmt_list1").mouseleave(function(){
		    		$(this).children('.modal_info_area2').css("display","none");
		    	});
		    }
		    function modalInfo(data){
		    		 var html = "";
		    		
		    		  	 html+="           	  	<div class=\"modal_info_top2\" mdno=\""+data.M_NO+"\">      																							";
					     html+="					<div class=\"modal_info_sec2\">																								";
					     html+="						<div class=\"modal_info_head2\">																						";
					     html+="							<div class=\"pro_area\">																							";								     
						 html+="								<div class=\"pro_thumb\">																						";						                 
						 html+=" 				   					<img class=\"pro_img\" src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	 				";      
						 html+="								</div>																											";						                 
						 html+="								<div class=\"pro_dtl\">																							";					                 
						 html+="									<div class=\"m_nick\">"+data.NICK_NM+"</div>																";		                     
						 html+="									<div class=\"m_name\">"+data.M_NM+"</div>																	";						                    
						 html+="								</div>																											";							                 
						 html+="							</div>																												";			             	
					     html+="           	  			</div>      																											";
					     html+="						<div class=\"modal_info_mid2\">																							";
					     html+="							<div class=\"modal_mid_box\">																						";
					     html+="           	  					<div class=\"m_name\">게시글</div>     																			";
					     html+="           	  					<div class=\"m_nick\">"+data.WC+"</div>      																	";
					     html+="           	  				</div>      																										";
					     html+="							<div class=\"modal_mid_box\">																						";
					     html+="           	  					<div class=\"m_name\">팔로우</div>     																			";
					     html+="           	  					<div class=\"m_nick\">"+data.PC+"</div>      																	";
					     html+="           	  				</div>      																										";
					     html+="							<div class=\"modal_mid_box\">																						";	
					     html+="           	  					<div class=\"m_name\">팔로워</div>     																			";
					     html+="           	  					<div class=\"m_nick\">"+data.QC+"</div>      																	";
					     html+="           	  				</div>      																										";
					     html+="           	  			</div>      																											";
					     html+="						<div class=\"modal_info_img2\">																							";					     
					     html+="           	  			</div>      																											";
					     html+="						<div class=\"modal_info_follow2\">																						";
					     html+="           	  			</div>      																											";
					     html+="           	  		</div>      																												";
					     html+="           	  	</div>      																													";
				     
				     	$(".modal_info_area2").html(html);
		    }
		    function modalInfoImg(list){
		    	var html = "";
		    	for(data of list){
		    		 html+="<div pi=\""+data.M_NO+"\"> ";
			    	 html+=" <img class=\"modal_img_box\" src=\""+data.FILE_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	"; 
			    	 html+="</div>";
		    	}
		    	$(".modal_info_img2").html(html);
		    }
		   	    
		    function modalMover2(){
		    	$(".cmt_list2").mouseover(function(){	    		
		    		$("#m_no3").val($(this).parent().parent().parent().attr('no'));
		    		var params = $("#modalInfoForm").serialize();
		    		$(this).children('.modal_info_area3').attr("style","display:block;");
		    		$.ajax({
		    			url : "mInfo",
		    			type : "post",
		    			dataType : "json",
		    			data : params,
		    			success : function(res){		    				
		    				modalInfo2(res.mInfo);
		    				modalInfoImg2(res.mImg);
		    				modalMLeave2();
		    			},
		    			error : function(request, status, error){
		    				console.log(error);
		    			}
		    		});
		    	})
		    }
		    function modalMLeave2(){
		    	$(".cmt_list2").mouseleave(function(){
		    		$(this).children('.modal_info_area3').attr("style","display:none;");
		    	});
		    }
		    function modalInfo2(data){
	    		 var html = "";
	    		
	    		  	 html+="           	  	<div class=\"modal_info_top3\" mdno=\""+data.M_NO+"\">      																							";
				     html+="					<div class=\"modal_info_sec3\">																								";
				     html+="						<div class=\"modal_info_head3\">																						";
				     html+="							<div class=\"pro_area\">																							";								     
					 html+="								<div class=\"pro_thumb\">																						";						                 
					 html+=" 				   					<img class=\"pro_img\" src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	 				";      
					 html+="								</div>																											";						                 
					 html+="								<div class=\"pro_dtl\">																							";					                 
					 html+="									<div class=\"m_nick\">"+data.NICK_NM+"</div>																		";		                     
					 html+="									<div class=\"m_name\">"+data.M_NM+"</div>																			";						                    
					 html+="								</div>																											";							                 
					 html+="							</div>																												";			             	
				     html+="           	  			</div>      								";
				     html+="						<div class=\"modal_info_mid3\">				";
				     html+="							<div class=\"modal_mid_box\">				";
				     html+="           	  					<div class=\"m_name\">게시글</div>     ";
				     html+="           	  					<div class=\"m_nick\">"+data.WC+"</div>      						";
				     html+="           	  				</div>      								";
				     html+="							<div class=\"modal_mid_box\">				";
				     html+="           	  					<div class=\"m_name\">팔로우</div>     ";
				     html+="           	  					<div class=\"m_nick\">"+data.PC+"</div>      						";
				     html+="           	  				</div>      								";
				     html+="							<div class=\"modal_mid_box\">				";	
				     html+="           	  					<div class=\"m_name\">팔로워</div>     ";
				     html+="           	  					<div class=\"m_nick\">"+data.QC+"</div>      						";
				     html+="           	  				</div>      								";
				     html+="           	  			</div>      								";
				     html+="						<div class=\"modal_info_img3\">				";					     
				     html+="           	  			</div>      								";
				     html+="						<div class=\"modal_info_follow3\">			";
				     html+="           	  			</div>      								";
				     html+="           	  		</div>      									";
				     html+="           	  	</div>      										";
			     
			     $(".modal_info_area3").html(html);
	    	}
		    function modalInfoImg2(list){
		    	var html = "";
		    	for(data of list){
		    		 html+="<div pi=\""+data.M_NO+"\"> ";
			    	 html+=" <img class=\"modal_img_box\" src=\""+data.FILE_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	"; 
			    	 html+="</div>";
		    	}
		    	$(".modal_info_img3").html(html);
		    }
		    
		    
		    
		    function followList(list){
				var html ="";	
				
				 for(data of list){
					 	html+="<div class=\"pGradient0\"> 																								   				";
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
						html+=" 			<img src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 		   			";
						html+="			</div>																															";
						html+="       	<div class=\"id\">																												";
						html+="				<a href=\"coronagram/"+data.NICK_NM+"\" class=\"fo_id\">"+data.NICK_NM+"</a>												";
						html+="			</div>																															";
						html+="   	</div>																																";
						html+="</div>																																	";
						
				 }
				 $(".scroll_inner").html(html);
		    }	
		    
		    function notFollowList(list){
				var html ="";	
				
				 for(data of list){
					 	
					 	html+="<div class=\"rec_user\" nfo=\""+data.M_NO+"\">																		 ";
						html+="		<div class=\"profile_thumb\">																					 ";
						html+=" 		<img src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	 "; 
						html+="		</div>																											 ";
						html+="		<div class=\"detail\">																							 ";
						html+="			<div class=\"rec_id\">"+data.NICK_NM+"</div>																 ";			
						html+="		</div>																											 ";
						html+="			<div class=\"rec_follow\">																					 ";
						html+="				<span class=\"follow_submit fospan\">팔로우</span>														 ";
						html+="			</div>																										 ";
						html+="</div>																												 ";
				 }
				 $(".rec_area").html(html);
		    }
		    
		    	
		    function addPostCmt(){
		    	$(".upload_btn").on("click",function(){
		    		if($(this).prev().val()==""){
		    			alert("댓글 내용을 입력하세요.");
		    		}
		    		else{
		    			$("#cmtVal").val($(this).prev().val());
		    			$("#writingNo2").val($(this).parent().parent().parent().attr('wtno'));
			    		var params = $("#addCmtForm").serialize();
						$.ajax({
							url : "addPostCmt",
							type : "post",
							dataType : "json",
							data : params,
							success : function(res){
								if(res.result=="success"){
									reloadList();	
									$(this).prev().val("");
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
		    function heart(data){
		    	var i=0;  	
		    	for(list1 of data){
		    		var chk = "#checkbox"+i;
		    		if( list1.LEX == 1 ){
		    			$(chk).attr("checked",true);
		        	}else{
		            	$(chk).attr("checked",false);
		        	}
		    		i++;
		    	}
		    	
		    }
		    function heartAD(){
		    	$(".checkbox").on("click",function(){
		    		$("#writingNo").val($(this).parent().parent().parent().parent().parent().parent().attr('wtno'));
		    		if($(this).is(":checked") == true) {   					
			    		var params = $("#heartForm").serialize();
			    		$.ajax({
			    			url : "aHeart",
			    			type : "post",
			    			dataType : "json",
			    			data : params,
			    			success : function(res){
			    				if(res.result=="success"){
			    					reloadList();
			    				}else{
			    					alert("add실패");
			    				}
			    			},
			    			error : function(request, status, error){
			    				console.log(error);
			    			}
			    		});
		    		}else{
			    		var params = $("#heartForm").serialize();
		    			$.ajax({
		    				url : "dHeart",
		    				type : "post",
		    				dataType : "json",
		    				data : params,
		    				success : function(res){
		    					if(res.result=="success"){
		    						reloadList();
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
		    function followAdd(){
		    	$(".fospan").on("click",function(){
		    		if(confirm("팔로우 하시겠습니까?")){
			    		$("#m_no2").val($(this).parent().parent().attr("nfo"));
			    		var params = $("#AddFoForm").serialize();
			    		$.ajax({
			    			url : "FollowAdd",
			    			type : "post",
			    			dataType : "json",
			    			data : params,
			    			success : function(res){
			    				if(res.result=="success"){
			    					reloadList();
			    					alert("팔로워가 되었습니다.");
			    				}else{
			    					alert("add실패");
			    				}
			    			},
			    			error : function(request, status, error){
			    				console.log(error);
			    			}
			    		});
		    		}
		    	});
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
		    function ScrollNext() {
		    	  var _scrollX = $('.scroll_inner').scrollLeft();
		    	  $('.scroll_inner').scrollLeft(_scrollX + 600);
		    };
		    function ScrollPrev() {
		  	  var _scrollX = $('.scroll_inner').scrollLeft();
		  	  $('.scroll_inner').scrollLeft(_scrollX - 600);
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
    <main>
	    <section id="container">
	    	<section class="head_container">
					<div class="hidden_menu">
							<div class="follow_prev" onclick="ScrollPrev()"></div>
			            	<div class="follow_next" onclick="ScrollNext()"></div>
			            <div class="scroll_inner"></div>
			        </div>    
	        </section>
	        <section id="main_container">     
	            <div class="inner">
	                <div id="contents_box" class="contents_box">               
	                </div>	                
	                <input type="hidden" id="page" value="1">            
	                <div class="side_box">
	                    
	                    <article class="recommend">
	                        <header class="reco_header">
	                            <div>회원님을 위한 추천</div>
	                            <div class="more">모두 보기</div>
	                        </header>
							<div class="rec_area"></div>                
	                    </article>
	                </div>
	            </div>
	        </section>
	    </section>
		  <form action="#" id="postForm" method="post">
          	  <input type="hidden" name="m_no" value="${sMNo}"/> 
	      </form>
	      <form action="#" id="AddFoForm" method="post">
          	  <input type="hidden" name="m_no" value="${sMNo}"/>
          	  <input type="hidden" name="m_no2" id="m_no2"/> 
	      </form>
	      <form action="#" id="heartForm" method="post">
          	  <input type="hidden" name="m_no" value="${sMNo}"/>
          	  <input type="hidden" name="writingNo" id="writingNo"/> 
	      </form>
	      <form action="#" id="addCmtForm" method="post">
          	  <input type="hidden" name="m_no" value="${sMNo}"/> 
	   	   	  <input type="hidden" name="writingNo" id="writingNo2"/>
	   	   	  <input type="hidden" name="cmt_con" id="cmtVal"/>
	   	  </form>
	   	  <form action="#" id="modalInfoForm" method="post">
          	  <input type="hidden" name="m_no3" id="m_no3"/> 
	   	  </form>
	</main>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>