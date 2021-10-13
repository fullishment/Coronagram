<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="resources/css/user_page/userpage.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>Document</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#menu").load("D:/html/coronagram/Coronagram/menu_bar/menu_bar.html");
        });
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
    
                        <h1 class="profile-user-name">janedoe_</h1>
    
                        <button class="btn profile-edit-btn">Edit Profile</button>
    
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog"
                                aria-hidden="true"></i></button>
    
                    </div>
    
                    <div class="profile-stats">
    
                        <ul>
                            <li><span class="profile-stat-count">164</span> posts</li>
                            <li><span class="profile-stat-count">188</span> followers</li>
                            <li><span class="profile-stat-count">206</span> following</li>
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

            <div class="gallery">

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 2</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1497445462247-4330a224fdb1?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 89</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 5</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Gallery</span><i class="fas fa-clone" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 42</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 1</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1502630859934-b3b41d18206c?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Video</span><i class="fas fa-video" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 38</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 0</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1498471731312-b6d2b8280c61?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Gallery</span><i class="fas fa-clone" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 47</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 1</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1515023115689-589c33041d3c?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 94</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 3</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Gallery</span><i class="fas fa-clone" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 52</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 4</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1515814472071-4d632dbc5d4a?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 66</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 2</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1511407397940-d57f68e81203?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Gallery</span><i class="fas fa-clone" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 45</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 0</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1518481612222-68bbe828ecd1?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 34</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 1</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1505058707965-09a4469a87e4?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 41</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 0</li>
                        </ul>

                    </div>

                </div>

                <div class="gallery-item" tabindex="0">

                    <img src="https://images.unsplash.com/photo-1423012373122-fff0a5d28cc9?w=500&h=500&fit=crop"
                        class="gallery-image" alt="">

                    <div class="gallery-item-type">

                        <span class="visually-hidden">Video</span><i class="fas fa-video" aria-hidden="true"></i>

                    </div>

                    <div class="gallery-item-info">

                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
                                    class="fas fa-heart" aria-hidden="true"></i> 30</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i
                                    class="fas fa-comment" aria-hidden="true"></i> 2</li>
                        </ul>

                    </div>

                </div>

            </div>
            <!-- End of gallery -->

            <div class="loader"></div>

        </div>
        <!-- End of container -->

    </main>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>