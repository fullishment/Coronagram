<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/coinfo_infopage/coinfo_infopage.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</head>

<body>
    <!-- 주석 -->
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
   


    <!-- 메인 -->
    <!-- partial:index.partial.html -->
    <main>
        <div class="header">
            <div class="header-banner">
                <h1>한국 위드코로나 청사진 나왔다… ‘10월 말 11월 초’</h1>
                <div class="header-subtitle">
                    <h5>거리두기, 접종완료자 중심 단계적 완화.
                        중증환자 진료 중심으로 의료체계 전환.
                        거리두기, 접종완료자 중심 단계적 완화.
                        중증환자 진료 중심으로 의료체계 전환
                    </h5>
                </div>
            </div>
            <div class="clear"></div>
            <nav>
                <div class="site-title">Corona News</div>
                <ul>
                    <li><a href="/archive">Archive</a></li>
                    <li><a href="/events">Events</a></li>
                    <li><a href="/contact">Contact</a></li>
                    <ul>
            </nav>
        </div>

        <div class="main">
            <section class="content">
                <article>
                    <p>Wolf vinyl hella, jean shorts disrupt skateboard master cleanse hashtag iPhone. Pop-up bicycle
                        rights Brooklyn iPhone Helvetica kitsch Godard, XOXO blog aesthetic beard quinoa. Fixie kale
                        chips PBR&B twee, YOLO raw denim before they sold out photo booth bespoke seitan food truck.
                        Ethical chia before they sold out, trust fund viral ennui you probably haven't heard of them
                        cred bitters mixtape semiotics deep v jean shorts pork belly occupy shabby chic sriracha ethnic
                        normcore bicycle rights single-origin coffee slow-carb jean shorts. Twee ethnic mumblecore,
                        Carles banh mi slow-carb pour-over organic. Ethical tofu narwhal, hoodie viral ennui tousled
                        paleo. Butcher chia cray iPhone keytar, sustainable Cosby sweater literally try-hard put a bird
                        on it photo booth ethical street art literally semiotics.</p></br>
                    <p>Twee 8-bit Blue Bottle, wolf tattooed distillery retro dreamcatcher put a bird on it letterpress
                        asymmetrical actually Austin crucifix cred. Selfies ethical butcher vegan, umami bitters
                        literally wolf seitan +1 Intelligentsia Pitchfork. Godard mixtape pork belly Pitchfork, fap food
                        truck wolf banh mi post-ironic. Narwhal letterpress Etsy direct trade irony pour-over. Cosby
                        sweater literally Vice DIY butcher selvage shabby chic, XOXO hashtag letterpress single-origin
                        coffee. Artisan Portland disrupt swag small batch chambray, Neutra bespoke Wes Anderson tofu VHS
                        ennui. Cosby sweater letterpress 90's shabby chic cornhole, literally YOLO sartorial bitters
                        Blue Bottle cardigan chambray asymmetrical.</p></br>
                    <p>Fixie gluten-free sriracha flannel, selfies chambray direct trade. Authentic mixtape semiotics
                        deep v jean shorts pork belly occupy shabby chic sriracha. Tousled Williamsburg fanny pack High
                        Life shabby chic Cosby sweater, gastropub organic cornhole post-ironic hella drinking vinegar
                        cliche wolf pork belly. Wolf selvage cornhole church-key, ethnic raw denim chillwave authentic
                        asymmetrical Austin synth. Single-origin coffee iPhone Carles, Godard synth chia photo booth fap
                        mustache authentic pickled direct trade. Literally Vice Echo Park, trust fund viral ennui you
                        probably haven't heard of them cred biodiesel lomo scenester gastropub chia keffiyeh
                        Intelligentsia. Blue Bottle blog asymmetrical, pickled XOXO sustainable twee seitan cornhole
                        90's.</p></br>
                    <p>Flexitarian bitters cardigan tofu tattooed, Kickstarter Thundercats umami hella raw denim
                        mumblecore stumptown Godard trust fund. Pop-up organic iPhone, Godard actually vegan fanny pack
                        Intelligentsia sartorial. Chambray Echo Park you probably haven't heard of them, food truck Wes
                        Anderson Brooklyn brunch. Scenester Austin street art, sartorial sriracha letterpress hashtag.
                        Wayfarers vinyl single-origin coffee, fashion axe pork belly hoodie polaroid mumblecore street
                        art Truffaut. Readymade ethical Carles American Apparel fanny pack twee. Normcore Etsy squid,
                        farm-to-table XOXO forage selfies distillery photo booth Tonx.</p></br>
                    <p>Mlkshk flexitarian ethical, narwhal forage bespoke artisan hella plaid vinyl try-hard Tonx
                        actually keytar. McSweeney's chambray forage next level, mixtape Austin Portland Odd Future
                        ethical seitan. Gluten-free roof party locavore, pop-up cornhole chambray mlkshk bitters
                        McSweeney's Kickstarter bespoke. YOLO cred pop-up chambray PBR&B. Kitsch mixtape DIY skateboard
                        leggings, YOLO ennui chillwave dreamcatcher put a bird on it. Pug artisan PBR&B PBR
                        dreamcatcher, Marfa Etsy mixtape mustache messenger bag Vice. Plaid lomo pour-over post-ironic,
                        synth disrupt beard Truffaut church-key Tumblr narwhal Bushwick cred slow-carb tofu.</p></br>
                    <p>Pitchfork disrupt Vice fixie sriracha Blue Bottle. Carles gastropub skateboard Schlitz, Truffaut
                        semiotics PBR fanny pack. Truffaut biodiesel aesthetic, skateboard Etsy distillery blog. Craft
                        beer mumblecore bitters, Tonx fixie viral fingerstache Bushwick occupy. DIY tofu pug lo-fi,
                        street art flexitarian Truffaut. 90's banjo lo-fi master cleanse selvage Tonx, narwhal tote bag.
                        Helvetica before they sold out put a bird on it slow-carb normcore lo-fi.</p>
                </article>

            </section>
        </div>
    </main>
    <!-- partial -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="resources/script/coinfo_infopage/coinfo_infopage.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>

</body>

</html>