<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/user_page/user_page.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>Document</title>
    <style>
    	.img_size{
    		width:500px;
    		height:500px;
    	}
    	
    </style>
            <script>
        $(document).ready(function(){
        	reloadList();
        	$("#editBtn").on("click",function(){	   
  			  $("#editForm").attr("action","edit_profile");
  			  $("#editForm").submit(); 
  		   });
        	
            $(document).on("click",".gallery-item",function(){
            	$("#writingNo2").val($(this).attr("wtno"));
            	modal.style.display="block";
	      		mdDraw();
                
            });
            $(".close").on("click",function(){
                document.getElementById("myModal").style.display="none";
            });
            
            var modal = document.getElementById('myModal');

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
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
        });
        
        function reloadList(){
			var params=$("#actionForm").serialize();
			
			$.ajax({ 
				url:"userpages",
				type:"post",
				dataType:"json",
				data: params,
				success : function(res){
					drawList(res.list);
					profileCnt(res.f1,res.f2);
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
		}
        function profileCnt(f1,f2){
			var html ="";
			html +="<li><span class=\"profile-stat-count\"></span> posts</li>";
		    html +="<li><span class=\"profile-stat-count\">"+f1.FPCNT+"</span> followers</li>";
		    html +="<li><span class=\"profile-stat-count\">"+f2.FQCNT+"</span> following</li>";
	    	$("#profile-stat").html(html);
        }
	    function drawList(list){
			var html ="";
			
			for(var data of list){                                                                                    
				html+= "<div class=\"gallery-item\" tabindex=\"0\" wtno=\""+data.WRITING_NO+"\" no=\""+data.M_NO+"\">                                     "; 
				
			    html+= "    	<img src=\""+data.FILE_ADR+"\" class=\"gallery-image\" alt=\"\" />							 "; 
			    html+= "    	<div class=\"gallery-item-info\">                                                              "; 
			    html+= "        	<ul>                                                                                     "; 
			    html+= "            <li class=\"gallery-item-likes\"><span class=\"visually-hidden\">Likes:</span><i         "; 
			    html+= "                    class=\"fas fa-heart\" aria-hidden=\"true\"></i>"+data.LCNT+"</li>               "; 
			    html+= "            <li class=\"gallery-item-comments\"><span class=\"visually-hidden\">Comments:</span><i   "; 
			    html+= "                    class=\"fas fa-comment\" aria-hidden=\"true\"></i>"+data.CCNT+"</li>             "; 
			    html+= "        	</ul>                                                                                    ";
			    html+= "    	</div>                                                                                       "; 

		    	html+= "</div>                                                                                           "; 
			}
			
			$("#gallery").html(html);
		}
	    function mdDraw(){
	    	
	    	var params = $("#addForm").serialize();
			$.ajax({ 
				url : "modalpages",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					drawModal(res.md);
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
	    }
	    function drawModal(md){
			var html ="";
			var i=1;
			for(var v of md){ 
				
				html+=" <div class=\"slide slide-"+i+"\">                                       ";
                html+=" <img src=\""+v.FILE_ADR+"\" alt=\"\" />	   							    ";
	           	html+=" </div>                                                                  ";
				i++;	
			}
			$("#slide-group").html(html);
		}
        </script>
</head>

<body>
    <div id="menu">
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
        <header>
            <div class="container">    
                <div class="profile">   
                    <div class="profile-image">
                            <img src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces"
                            alt="">    
                    </div>    
                    <div class="profile-user-settings">    
                        <h1 id="mId" class="profile-user-name">janedoe_</h1>    
                        <button id="editBtn" class="btn profile-edit-btn">Edit Profile</button>    
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog"
                                aria-hidden="true"></i></button>
                        <button id="follow_btn" class="follow_btn">follow</button>    
                    </div>  
                    <div class="profile-stats">  
                        <ul id="profile-stat">
                        
                        </ul>   
                    </div>   
                    <div class="profile-bio">    
                        <p><span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor sit, amet consectetur
                            adipisicing elit 📷✈️🏕️</p>    
                    </div>    
                </div>
                <!-- End of profile section -->
            </div>
            <!-- End of container -->
        </header>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <div class="modal_img">
                    <div class="slider">
                        <div class="slide-viewer">
                        <div id="slide-group" class="slide-group">

                        </div>
                        </div>
                        <div class="slide-nav">
                            <div class="prev"></div>
                            <div class="next"></div>
                        </div>
                        <div class="slide-buttons"></div>
                    </div>
                </div>
                <div class="modal_box">
                    <div class="cmt_head">
                        <span id="close" class="close">&times;</span> 
                        <div class="user_container">
                            <div class="profile_img">
                                <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                            </div>
                            <div class="user_name">
                                <div class="nick_name head_text">KindTiger</div>                          
                            </div>
                        </div>
                        
                    </div>
                    <div class="cmt_sec1">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필이미지">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name head_text">KindTiger</div>                          
                                </div>
                            </div>
                            <div class="modal_con"></div>
                    </div>
                    <div class="cmt_sec2">
                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat">
                                              <input type="checkbox" id="checkbox">
                                              <label for="checkbox">
                                                <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                                                  <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                                                    <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" stroke="#000000" stroke-width="3"></path>
                                                    <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"></circle>
                                          
                                                    <g id="grp7" opacity="0" transform="translate(7 6)">
                                                      <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"></circle>
                                                      <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp6" opacity="0" transform="translate(0 28)">
                                                      <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"></circle>
                                                      <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp3" opacity="0" transform="translate(52 28)">
                                                      <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"></circle>
                                                      <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp2" opacity="0" transform="translate(44 6)">
                                                      <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"></circle>
                                                      <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp5" opacity="0" transform="translate(14 50)">
                                                      <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"></circle>
                                                      <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp4" opacity="0" transform="translate(35 50)">
                                                      <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"></circle>
                                                      <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"></circle>
                                                    </g>
                                          
                                                    <g id="grp1" opacity="0" transform="translate(24)">
                                                      <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"></circle>
                                                      <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"></circle>
                                                    </g>
                                                  </g>
                                                </svg>
                                              </label>
                                    </div>
                                </div>
                                <div class="sprite_bubble_icon">
                                    <i class="far fa-comment f_size"></i>
                                </div>
                                <div class="sprite_share_icon" data-name="share">
                                    <i class="far fa-paper-plane f_size"></i>
                                </div>
                            </div>
                            <div class="right_icon">                          
                                <div class="sprite_bookmark_outline" data-name="bookmark"></div>
                            </div>     
                        </div>
                        <div class="likes head_text">
                            좋아요
                            <span id="like-count-39">2,346</span>
                            <span id="bookmark-count-39"></span>
                            개
                        </div>
                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="head_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                        </div>
                        <div class="timer">1시간 전</div>
                        <div class="comment_container">
                            <div class="comment" id="comment-list-ajax-post37">
                                <div class="comment-detail">
                                    <div class="head_text">dongdong2</div>
                                    <div>강아지가 너무 귀여워요~!</div>
                                </div>
                            </div>
                        </div>
                        <div class="timer">1시간 전</div>
                    </div>
                    <div class="cmt_field" id="cmt_field">
                        <textarea class="cmt_con" placeholder="댓글 달기..."></textarea>
                        <div class="m_text head_text" id="add_cmt">게시</div>
                    </div>                
                </div>                                         
            </div>
        </div>
        
        <div class="container">
            <div id="gallery" class="gallery">

            </div>
            <!-- End of gallery -->
            
        </div>
        <!-- End of container -->
    </main>
    	   <form action="#" id="actionForm" method="post">
    	   	  <input type="hidden" name="writingNo" id="writingNo" />
    	   	  <input type="hidden" name="m_no" id="m_no" value="${sMNo}"/>
		   </form>
           <form action="#" id="editForm" method="post">
               <input type="hidden" name="m_no" id="m_no2" value="${sMNo}"/>  
           </form>
           <form action="#" id="addForm" method="post">
    	   	  <input type="hidden" name="writingNo" id="writingNo2"/>
    	   	  <input type="hidden" name="m_no" id="m_no3" value="${sMNo}"/>
		   </form>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>