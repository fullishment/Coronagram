<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>coronagram shop</title>
  <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
  <link rel="stylesheet" href="resources/css/shop_main/headercss.css">
  <link rel="stylesheet" href="resources/css/shop_main/maincss.css">
  <link rel="stylesheet" href="resources/css/shop_main/slide.css">
	<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

  <script src="resources/script/shop_main/header_script.js"></script>
  <script src="resources/script/shop_main/main_script.js"></script>
  <script src="resources/script/shop_main/slide.js"></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>
  <script type="text/javascript">
  
  $(document).ready(function(){
	  reloadList();
	  $("#main_cart").on("click","#detailBtn",function(){
		  $("#prodNo").val($(this).parent().parent().parent().parent().parent().attr("no"));
		  $("#actionForm").attr("action","prodDetail");
		  $("#actionForm").submit();
	  });
  });
  function drawList(list){
	  var html = "";
	  for(var data of list){
		html+= "<div class=\"card\" no=\""+data.PROD_NO+"\">                                                                                          ";
        html+= "<div class=\"top-bar\">                                                                                       ";
        html+= "  <i class=\"fab fa-apple\"></i>                                                                              ";
        html+= "  <em class=\"stocks\">"+data.CAT_NM+"</em>                                                                              ";
        html+= "</div>                                                                                                      ";
        html+= "<div class=\"img-container\">                                                                                 ";
        html+= "  <img class=\"product-img\" src=\"resources/upload/"+data.FILE_ADDR+"\" alt=\"\">       ";
        html+= "</div>                                                                                                      ";
        html+= "<div class=\"details\">                                                                                       ";
        html+= "  <div class=\"name-fav\">                                                                                    ";
        html+= "    <strong class=\"product-name\">"+data.PROD_NM+"</strong>                                                       ";
        html+= "    <button class=\"heart\">                                                                               ";
        html+= "        <i class=\"fas fa-heart\"></i>												";
        html+= "  </button>                                                                  ";
        html+= "  </div>                                                                                                    ";
        html+= "  <div class=\"wrapper\">                                                                                     ";
        html+= "    <p>"+data.CON+"</p>                                         ";
        html+= "  </div>                                                                                                    ";
        html+= "  <div class=\"purchase\">                                                                                    ";
        html+= "    <p class=\"product-price\">"+data.POINT+"포인트</p>                                                                    ";
        html+= "    <span class=\"btn-add\">                                                                                  ";
        html+= "<div>                                                                                                 ";
        html+= "<button class=\"add-btn\" id=\"detailBtn\">자세히보기 <i class=\"fas fa-chevron-right\"></i></button>                           ";
        html+= "</div>                                                                                                ";
        html+= "</span>                                                                                                 ";
        html+= "</div>                                                                                                    ";
        html+= "</div>                                                                                                  ";
        html+= "</div>                                                                                                       ";
	  }
	  $("#main_cart").html(html);
  }
  function reloadList(){
	  var params = $("#actionForm").serialize();
		$.ajax({ 
			url : "shops",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				drawList(res.list);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
  }
  </script>
</head>

<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="prodNo" id="prodNo" />
		<input type="hidden" name="sMNo" id="sMNo" value={param.sMNo} />
	</form>
  
    <header class="main-header">
      <div class="header-wrapper">
        <div class="main-logo">Coronagram<sup style="font-size: 1.1rem;">Shop</sup></div>
        <nav>
          <ul class="main-menu">
            <li><a href="">Main</a></li>
            <li><a href="">Corona Map</a></li>
            <li><a href="">Corona Info</a></li>
            <li><a href="#">Coronagram</a></li>
            <li><a href="#">Service Center</a></li>
            <li><a href="shopCart" ><span class="fa fa-shopping-cart"></span></a></li>
            <li><a href="#"><span class="fa fa-search"></span></a></li>
          </ul>
        </nav>
      </div>
    </header>
    <section id="section-1">
      <div class="content-slider">
        <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
        <input type="radio" id="banner2" class="sec-1-input" name="banner">
        <input type="radio" id="banner3" class="sec-1-input" name="banner">
        <input type="radio" id="banner4" class="sec-1-input" name="banner">
        <div class="slider">
          <div id="top-banner-1" class="banner">
            <div class="banner-inner-wrapper">
              <h2>Shop launching</h2>
              <h1>Time Sale</h1>
              <h2 id="clock"></h2>
              <div class="line"></div>
              <div class="learn-more-button"><a href="#section-2">Learn More</a></div>
            </div>
          </div>
          <div id="top-banner-2" class="banner">
            <div class="banner-inner-wrapper">
              <h2>What We Do</h2>
              <h1>Great<br>MoGo</h1>
              <div class="line"></div>
              <div class="learn-more-button"><a href="#section-4">Learn More</a></div>
            </div>
          </div>
          <div id="top-banner-3" class="banner">
            <div class="banner-inner-wrapper">
              <h2>Here We Are</h2>
              <h1>We Are<br>MoGo</h1>
              <div class="line"></div>
              <div class="learn-more-button"><a href="#section-6">Learn More</a></div>
            </div>
          </div>
          <div id="top-banner-4" class="banner">
            <div class="banner-inner-wrapper">
              <h2>Our Contacts</h2>
              <h1>Welcome<br>to MoGo</h1>
              <div class="line"></div>
              <div class="learn-more-button"><a href="#main-footer">Learn More</a></div>
            </div>
          </div>
        </div>
        <nav>
          <div class="controls">
            <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><span>01</span>
              Intro</label>
            <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><span>02</span>
              Work</label>
            <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><span>03</span>
              About</label>
            <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><span>04</span>
              Contacts</label>
          </div>
        </nav>
      </div>
    </section>
    
    <section>
        <div class="shop_menu_logo">
          <p>Coronagram Shop</p>
        </div>
        <div class="shop_menu">
          <div class="shop_menu_list">
            <div class="shop_menu_left">
              <div class="shop_box1">
                <img id="img_box1" src="resources/images/shop/shop_boximg1.jpg">
              </div>
              <div class="shop_box2">
                <img id="img_box2" src="resources/images/shop/shop_boximg2.jpg">
              </div>
            </div>
            <div class="shop_box3 shop_menu_center">
              <img id="img_box3" src="resources/images/shop/shop_boximg3.jpg">
            </div>
            <div class="shop_menu_right">
              <div class="shop_box4">
                <img id="img_box4" src="resources/images/shop/shop_boximg4.jpg">
              </div>
              <div class="shop_box5">
                <img id="img_box1" src="resources/images/shop/shop_boximg5.jpg">
              </div>
            </div>
          </div>
        </div>
        <div class="shop_menu_logo">
          <p>Story</p>
        </div>
        <div class="story_menu">
          <div class="story_menu_list">
            <div class="story_w">
              <p class="story_w_title">스토리</p>
              <p class="story_w_sub">당신의 삶을 특별하게 해줄 새로운<br> 아이디어<br>
                스마트하게 사는 새로운 방법을<br> 알아보세요</p>
            </div>
            <div  class="story_box">
              <img id="story_img" src="resources/images/shop/shop1.jpg">
            </div>
            <div class="story_w_right">
              <div id="img_ch1" class="story_img_change1">
                <span>01 #코로나시국 #마스크</span>
              </div>
              <div id="img_ch2" class="story_img_change2">
                <span>02 #우리가 집에서 일하는 새로운 방법</span>
              </div>
              <div id="img_ch3" class="story_img_change3">
                <span>03 #승리를 향한 완벽한 준비</span>
              </div>
            </div>
          </div>
        </div>
        <div class="shop_menu_logo">
          <p>Top 4</p>
        </div>
    </section>
    <section class="slideshow">
        <div class="slideshow-inner">
        
          <div class="slides">
            <div class="slide is-active ">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">Slide title 1</div>
                  <div class="text">
                    <p>Slide description 1</p>
                  </div> 
                  <a href="#" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container"> 
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2015/07/Indispensable-1.jpg" alt="" class="image" />
              </div>
            </div>
            <c:forEach var="data" items="${list}" begin="1"> 
	        	<div class="slide">
	              <div class="slide-content">
	                <div class="caption">
	                  <div class="title">Slide title 2</div>
	                  <div class="text">
	                    <p>Slide description 2</p>
	                  </div> 
	                  <a href="#" class="btn">
	                    <span class="btn-inner">Learn More</span>
	                  </a>
	                </div>
	              </div>
	              <div class="image-container">
	                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2015/07/Indispensable-4-1.jpg" alt="" class="image" />
	              </div>
	            </div>
	        
	        </c:forEach>
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">Slide title 2</div>
                  <div class="text">
                    <p>Slide description 2</p>
                  </div> 
                  <a href="#" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2015/07/Indispensable-4-1.jpg" alt="" class="image" />
              </div>
            </div>
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">Slide title 3</div>
                  <div class="text">
                    <p>Slide description 3</p>
                  </div> 
                  <a href="#" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2016/11/11.jpg" alt="" class="image" />
              </div>
            </div>
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">Slide title 4</div>
                  <div class="text">
                    <p>Slide description 4</p>
                  </div> 
                  <a href="#" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container"> 
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2016/11/20mars17-sans-typo.jpg" alt="" class="image" />
              </div>
            </div>
          </div>
          <div class="pagination">
            <div class="item is-active"> 
              <span class="icon">1</span>
            </div>
            <div class="item">
              <span class="icon">2</span>
            </div>
            <div class="item">
              <span class="icon">3</span>
            </div>
            <div class="item">
              <span class="icon">4</span>
            </div>
          </div>
          <div class="arrows">
            <div class="arrow prev">
              <span class="svg svg-arrow-left">
                <svg version="1.1" id="svg4-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M13,26c-0.256,0-0.512-0.098-0.707-0.293l-12-12c-0.391-0.391-0.391-1.023,0-1.414l12-12c0.391-0.391,1.023-0.391,1.414,0s0.391,1.023,0,1.414L2.414,13l11.293,11.293c0.391,0.391,0.391,1.023,0,1.414C13.512,25.902,13.256,26,13,26z"/> </svg>
                <span class="alt sr-only"></span>
              </span>
            </div>
            <div class="arrow next">
              <span class="svg svg-arrow-right">
                <svg version="1.1" id="svg5-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M1,0c0.256,0,0.512,0.098,0.707,0.293l12,12c0.391,0.391,0.391,1.023,0,1.414l-12,12c-0.391,0.391-1.023,0.391-1.414,0s-0.391-1.023,0-1.414L11.586,13L0.293,1.707c-0.391-0.391-0.391-1.023,0-1.414C0.488,0.098,0.744,0,1,0z"/> </svg>
                <span class="alt sr-only"></span>
              </span>
            </div>
          </div>
        </div> 
 
    </section>
    <div class="shop_menu_logo">
      <p>Shop</p>
    </div>
    <section class="selmain">
      <div class="banner">
        <div class="main-cart" id="main_cart">
        </div>
      </div>
    </section>
    <article class="category">
      <div>
        <section>
          <img src="https://i.postimg.cc/Z5w9NYCh/1.jpg">
          <h4>신규 회원 <br> 포인트 샵<br>할인 쿠폰 </h4>
        </section>

        <section>
          <img src="https://i.postimg.cc/fyQksJgY/4.jpg">
          <h4>무료 배송</h4>
        </section>

        <section>
          <img src="https://i.postimg.cc/Fsm1nkS4/5.jpg">
          <h4>회원 등급 별<br>
            사은품 </h4>
        </section>

        <section>
          <img src="https://i.postimg.cc/xTRqrjGb/6.jpg">
          <h4>출석 체크 시 <br>포인트 적립 </h4>
        </section>
      </div>
    </article>
    <footer>
      <div>
        <section>
          <b>구디아카데미</b> <br><br>
          서울특별시 금천구 <br>
          가산동 가산디지털2로 115 <br>
          대륭테크노타운3차 1109-1호<br><br>
          TEL 02-2108-5900 <br>
          
        </section>

        <section>
          <ul>
            <li>이용 안내</li>
            <li>이용 약관</li>
            <li>개인 정보 처리 방침</li>
            <li>구매 안전 서비스</li>
          </ul>
        </section>

        <section>
          <ul>
            <li>1:1문의</li>
            <li>FAQ</li>
            <li>쇼핑 가이드</li>
            <li>이벤트</li>
          </ul>
        </section>

        <section>
          <br>
          <img class="sns"
            src="http://www.myiconfinder.com/uploads/iconsets/256-256-fdb5c7de7e8cf55afcbe34def52a7f84.png">
          <img class="sns"
            src="http://www.myiconfinder.com/uploads/iconsets/256-256-732359f7dc388ab9720011bca82aee1b.png">
          <img class="sns"
            src="http://www.myiconfinder.com/uploads/iconsets/256-256-7799b777880e17be4bebb9837c11a342.png">
          <section>
      </div>
    </footer>
 
  <!-- partial -->
 
 
</body>

</html>