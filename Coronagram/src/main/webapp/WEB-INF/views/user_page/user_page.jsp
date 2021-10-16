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
        <script>
        $(document).ready(function(){
        	reloadList();
        	$("tbody").on("click","tr",function(){
  			  $("#no").val($(this).attr("no"));
  			  
  			  $("#actionForm").attr("action","testM");
  			  $("#actionForm").submit();
  			  
  		   });
        	$("#editBtn").on("click",function(){	   
  			  $("#editForm").attr("action","edit_profile");
  			  $("#editForm").submit(); 
  		   });
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
				html+= "<div class=\"gallery-item\" tabindex=\"0\" no=\""+data.M_NO+"\">                                     "; 
				
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
        </script>
    </header>
    </div>
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
		   <form action="#" id="dtlForm">
              <input type="hidden" name="writingNo" id="writingNo" value="${data.WRITING_NO}">             
           </form>
           <form action="#" id="editForm" method="post">
               <input type="hidden" name="m_no" id="m_no" value="${sMNo}"/>  
           </form>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>