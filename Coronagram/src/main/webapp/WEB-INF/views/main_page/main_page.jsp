<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>Coronagram</title>

  <!-- font -->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css'>
  <link rel="stylesheet" href="resources/css/main_page/main_page.css">
  <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react-dom.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/classnames/2.2.5/index.min.js'></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/js/swiper.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


</head>

<body onload="InitializeStaticMenu();">

  <div id="STATICMENU">
    <aside>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-53e157058ac55ba046aa84778fca5e7e-user.png">
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-5eea0c1930aab7916cc960e027d032db.png">
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-b8bd8c49060ab11be6d0ec4067506019.png">
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-1946ae1aa4487a7b9fa115d13220714c-talk.png">
    </aside>
  </div>
  <!-- 기본 틀 -->
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
  <!-- 메인화면 -->
  <main>
    <div class="slider-wrap con" data-slick-autoplay-status="Y">
      <div class="slider main-slider con">
        <div class="slide-item slide-item-1" data-dot-title="Coronagram">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt" style="color:black;">
              <h2 class="txt-tt">Coronagram</h2>
              <p class="txt-desc" style="font-weight: 500;">너만의 사진을 올리고 공유하자</p>
              <div class="txt-btn">
                <a href="#" class="txt-btn-1" style="color:black;">개인 페이지</a>
                <a href="#" class="txt-btn-2" style="color:black;">출석 체크 바로가기</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="../../resources/images/insta_bg.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-2" data-dot-title="Corona Info">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">Corona Infomation</h2>
              <p class="txt-desc" style="font-weight: 500;">코로나에 관한 모든것 다 여기에</p>
              <div class="txt-btn">
                <a href="#" class="txt-btn-1">더 알아보기</a>
                <a href="#" class="txt-btn-2">방역지침 보기</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="../../resources/images/infomation.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-3" data-dot-title="Corona Map">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">Corona Map</h2>
              <p class="txt-desc" style="font-weight: 500;">코로나 확진자 경로를 지도로 만나보세요</p>
              <div class="txt-btn">
                <a href="#" class="txt-btn-2">지도로 이동하기</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="../../resources/images/worldmap.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-4" data-dot-title="My Page">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">My Page</h2>
              <p class="txt-desc" style="font-weight: 500;">내 정보를 수정하고 싶다면 여기</p>
              <div class="txt-btn">
                <a href="#" class="txt-btn-1">개인 페이지</a>
                <a href="#" class="txt-btn-2">출석 체크 바로가기</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="../../resources/images/mypage.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-5" data-dot-title="Q & A">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt" >
              <h2 class="txt-tt" style="color:black;">Ser</h2><h2 class="txt-tt" style="color:white;">vice&nbsp;center</h2><br>
              <p class="txt-desc" style="display:inline-block; color:black; font-weight: 500;">궁금한건 여기에&nbsp;</p><p class="txt-desc" style="display:inline-block; color:white; font-weight: 500;">물어봐</p>
              <div class="txt-btn">
                <a href="#" class="txt-btn-1" style="color:black;">자주하는 질문 보기</a>
                <a href="#" class="txt-btn-2">내가 한 질문 보기</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="../../resources/images/qna.jpg" alt="">
            </picture>
          </div>
        </div>
      </div>
      <button class="s-autoplay-btn"></button>
    </div>

  </main>

  <article>
    <div class="wrapper">
      <div class="news-slider">
        <div class="news-slider__wrp swiper-wrapper">
          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">24</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-2.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">25</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-3.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">26</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-4.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">27</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-2.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">28</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-5.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="#" class="news__item">
              <div class="news-date">
                <span class="news-date__title">29</span>
                <span class="news-date__txt">May</span>
              </div>
              <div class="news__title">
                Lorem Ipsum Dolor Sit Amed
              </div>

              <p class="news__txt">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s...
              </p>

              <div class="news__img">
                <img src="https://res.cloudinary.com/muhammederdem/image/upload/v1537132205/news-slider/item-4.jpg"
                  alt="news">
              </div>
            </a>
          </div>
        </div>

        <div class="news-slider__ctr">
          <div class="news-slider__arrows">
            <button class="news-slider__arrow news-slider-prev">
              <span class="icon-font">
                <svg class="icon_arrow icon-arrow-left">
                  <use xlink:href="#icon-arrow-left"></use>
                </svg>
              </span>
            </button>
            <button class="news-slider__arrow news-slider-next">
              <span class="icon-font">
                <svg class="icon_arrow icon-arrow-right">
                  <use xlink:href="#icon-arrow-right"></use>
                </svg>
              </span>
            </button>
          </div>
        </div>
      </div>
    </div>

    <svg hidden="hidden">
      <defs>
        <symbol id="icon-arrow-left" viewBox="0 0 32 32">
          <title>arrow-left</title>
          <path
            d="M0.704 17.696l9.856 9.856c0.896 0.896 2.432 0.896 3.328 0s0.896-2.432 0-3.328l-5.792-5.856h21.568c1.312 0 2.368-1.056 2.368-2.368s-1.056-2.368-2.368-2.368h-21.568l5.824-5.824c0.896-0.896 0.896-2.432 0-3.328-0.48-0.48-1.088-0.704-1.696-0.704s-1.216 0.224-1.696 0.704l-9.824 9.824c-0.448 0.448-0.704 1.056-0.704 1.696s0.224 1.248 0.704 1.696z">
          </path>
        </symbol>
        <symbol id="icon-arrow-right" viewBox="0 0 32 32">
          <title>arrow-right</title>
          <path
            d="M31.296 14.336l-9.888-9.888c-0.896-0.896-2.432-0.896-3.328 0s-0.896 2.432 0 3.328l5.824 5.856h-21.536c-1.312 0-2.368 1.056-2.368 2.368s1.056 2.368 2.368 2.368h21.568l-5.856 5.824c-0.896 0.896-0.896 2.432 0 3.328 0.48 0.48 1.088 0.704 1.696 0.704s1.216-0.224 1.696-0.704l9.824-9.824c0.448-0.448 0.704-1.056 0.704-1.696s-0.224-1.248-0.704-1.664z">
          </path>
        </symbol>
      </defs>
    </svg>
  </article>

  <article>
    <div id="app"></div>
  </article>

  <article class="chartbox">
    <div class="container">
      <div class="dashboard-container">
        <div class="card-1">
          <div class="single-chart">
            <div class="chart chart1" data-percent="70"></div>
          </div>
          <div class="card_con">
            <span class="heading">오늘 확진자</span>
            <span class="value"><span>1032K</span></span>
          </div>
        </div>
        <div class="card-2">
          <div class="single-chart">
            <div class="chart chart1" data-percent="55"></div>
          </div>
          <div class="card_con">
            <span class="heading">누적 총 확진자</span>
            <span class="value"><span>1032K</span></span>
          </div>
        </div>
        <div class="card-3">
          <div class="single-chart">
            <div class="chart chart1" data-percent="90"></div>
          </div>
          <div class="card_con">
            <span class="heading">완치자</span>
            <span class="value"><span>1032K</span></span>
          </div>
        </div>
        <div class="card-4">
          <div class="single-chart">
            <div class="chart chart1" data-percent="75"></div>
          </div>
          <div class="card_con">
            <span class="heading">사망자</span>
            <span class="value"><span>1032K</span></span>
          </div>
        </div>
        <div class="card-5">
          <h4 class="chart-lbl">
            Doughnut Chart
          </h4>
          <div class="divider">
          </div>
          <div class="content-center">
            <div class="doughnut-chart-container">
              <canvas class="doughnut-chart" id="doughnut">
              </canvas>
            </div>
          </div>
        </div>

        <div class="card-6">
          <h4 class="chart-lbl">
            line Chart
          </h4>
          <div class="divider">
          </div>
          <div class="line-chart-container">
            <canvas class="line-chart" id="line">
            </canvas>
          </div>
        </div>
      </div>
    </div>
  </article>

  <article class="midbg">
    <div class="midtext">
      <h1>POINT SHOP</h1>
      <h4 style="color: white;">the healthy new collection</h4>
      <button><b class="btn_now">SHOP NOW</b></button>
    </div>
  </article>

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
  <script src="resources/script/main_page/main_page.js"></script>
  <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>
</html>