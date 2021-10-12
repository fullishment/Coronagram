<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">

    <link rel="stylesheet" href="../../resources/css/admin_chart/admin_chart.css">
    <link rel="stylesheet" href="../../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="../../resources/css/admin_chart/3.3.4bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.4/jquery-jvectormap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.3/jquery.slimscroll.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.8.0/lodash.min.js"></script>
    <script src="https://jvectormap.com/js/jquery-jvectormap-2.0.5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.3/jquery-jvectormap.js"></script>
    <script src="https://jvectormap.com/js/jquery-jvectormap-world-mill.js"></script>
</head>
<body>
    <section>
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
    </section>
    <aside>

    </aside>
    <main>
        <div class="main_title">
            <h1>코로나 통계 자료</h1>
        </div>

        <section>
            <div class="rad-body-wrapper rad-nav-min">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <div class="rad-info-box rad-txt-today_cornic">
                                <i class="fa chart1" data-percent="70"></i>
                                <span class="heading">오늘 확진자</span>
                                <span class="value"><span>4949</span></span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="rad-info-box rad-txt-accum_cornic">
                                <i class="fa chart1" data-percent="30"></i>
                                <span class="heading">누적 총 확진자</span>
                                <span class="value"><span>23K</span></span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="rad-info-box rad-txt-fl_rec">
                                <i class="fa chart1" data-percent="50"></i>
                                <span class="heading">완치자</span>
                                <span class="value"><span>49M</span></span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="rad-info-box rad-txt-dead">
                                <i class="fa chart1" data-percent="40"></i>
                                <span class="heading">사망자</span>
                                <span class="value"><span>10.9K</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">전세계 현황<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body rad-map-container">
                                    <div id="world-map" class="rad-map"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">월별 코로나 현황<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="areaChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="corona_condition">

                            <div class="condition">
                                <div class="coronic">
                                    <div class="coronics"></div>
                                    <span>확진자</span>
                                </div>
                                <div class="dead">
                                    <div class="deads"></div>
                                    <span>사망자</span>
                                </div>
                                <div class="fl_rec">
                                    <div class="fl_recs"></div>
                                    <span>완치자</span>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="col-lg-6 col-md-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">연령대별 코로나 접종 백신 비율%<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="lineChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>백신 종류별 접종 현황</h1>
                        </div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">10대<ul class="rad-panel-action">

                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">20대<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart2" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">30대<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart3" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">40대<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart4" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">50대 이후<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart5" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="vaccine">

                            <div class="vaccine_name">
                                <!-- <p>백신종류</p> -->
                                <div class="az">
                                    <div class="azs"></div>
                                    <span>아스트로제네카</span>
                                </div>
                                <div class="pfizer">
                                    <div class="pfizers"></div>
                                    <span>화이자</span>
                                </div>
                                <div class="moderna">
                                    <div class="modernas"></div>
                                    <span>모더나</span>
                                </div>
                                <div class="jansen">
                                    <div class="jansens"></div>
                                    <span>얀센</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>방문자 통계 자료</h1>
                        </div>
                        <div class="col-md-6 col-lg-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">월별 방문 가입자<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart3" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">일주일간 방문, 가입자 수<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart2" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">가입자 백신 접종률 정보<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>회원 등급</h1>
                        </div>
                        <div class="col-md-6 member_grade">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">회원 등급<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart6" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 member_grade">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">회원 등급 표<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="members">
                                        <table class="members_level">
                                            <th>등급</th>
                                            <th>인원</th>
                                            <tr>
                                                <td>
                                                    <div>
                                                        매니저
                                                        <div class="level_color man"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        다이아몬드
                                                        <div class="level_color dia"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        플레티넘
                                                        <div class="level_color pla"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        골드
                                                        <div class="level_color gol"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        실버
                                                        <div class="level_color sil"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        브론즈
                                                        <div class="level_color bron"></div>
                                                    </div>
                                                </td>
                                                <td>2</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>상품 판매 현황</h1>
                        </div>
                        <div class="col-md-6 col-lg-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">상품별 판매 횟수<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart4" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- <script src="../../resources/script/admin_chart/doughnutchart2.js"></script> -->
    <script src="../../resources/script/admin_chart/admin_chart.js"></script>
    <script src="../../resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>