// 상단 메인 배너 slick
$('.main-slider').slick({
    dots: true,
    fade: true,
    customPaging: function (slider, i) {
        //console.log($(slider.$slides[i]).html());
        return '<button class="tab"><div class="s-indicator only-pc"><span class="inner-txt">' + $(slider.$slides[i]).find('.slide-item').attr('data-dot-title') + '</span></div><span class="s-line-fill"></span></button>';
    },
});

// 마우스 더미에 올렸을 때 멈추도록
$('.slide-dummy, .slide-txt').mouseenter(function () {
    $(this).closest('.slider-wrap').attr('data-slick-autoplay-status', 'N');
});

$('.slide-dummy').mouseleave(function () {
    $(this).closest('.slider-wrap').attr('data-slick-autoplay-status', 'Y');
});

// 재생 및 정지 버튼 클릭
$('.s-autoplay-btn').click(function () {
    var $sliderWrap = $(this).parent();

    if ($sliderWrap.attr('data-slick-autoplay-status') == 'Y') {
        $sliderWrap.attr('data-slick-autoplay-status', 'N');
    }
    else if ($sliderWrap.attr('data-slick-autoplay-status') == 'N') {
        $sliderWrap.attr('data-slick-autoplay-status', 'Y');
    }
})

// progressbar 다 차면 슬라이드 시키기
setInterval(function () {
    $('.slider-wrap > .main-slider').each(function (index, node) {
        var $slider = $(node);

        if ($slider.parent().attr('data-slick-autoplay-status') !== 'N') {
            var width = $slider.find('.slick-dots .slick-active > button > .s-line-fill').css('width');
            var buttonWidth = $slider.find('.slick-dots .slick-active > button').css('width');

            //console.log(width);
            if (width == buttonWidth) {
                $slider.slick('slickNext');
            }
        }
    });
}, 500);
/* Demo purposes only */
$(".hover").mouseleave(
    function () {
        $(this).removeClass("hover");
    }
);
var stmnLEFT = 50; // 오른쪽 여백
var stmnGAP1 = 0; // 위쪽 여백
var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리
var stmnBASE = 150; // 스크롤 시작위치
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer;

function RefreshStaticMenu() {
    var stmnStartPoint, stmnEndPoint;
    stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10);
    stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2;
    if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1;
    if (stmnStartPoint != stmnEndPoint) {
        stmnScrollAmount = Math.ceil(Math.abs(stmnEndPoint - stmnStartPoint) / 15);
        document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ((stmnEndPoint < stmnStartPoint) ? -stmnScrollAmount : stmnScrollAmount) + 'px';
        stmnRefreshTimer = stmnScrollSpeed;
    }
    stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed);
}
function InitializeStaticMenu() {
    document.getElementById('STATICMENU').style.right = stmnLEFT + 'px'; //처음에 오른쪽에 위치. left로 바꿔도.
    document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px';
    RefreshStaticMenu();
}


var items = document.querySelectorAll('.news__item');
var item = document.querySelector('.news__item');

if ($(window).width() > 800) {
    $(document).on("mouseover", ".news__item", function (_event, _element) {
        var newsItem = document.querySelectorAll('.news__item');
        newsItem.forEach(function (element, index) {
            element.addEventListener('mouseover', function () {
                $('.news__item').removeClass('active');
            });
            element.addEventListener('mouseleave', function () {
                $('.news__item').removeClass('active');
            });
        });
    });
}

var swiper = new Swiper('.news-slider', {
    effect: 'coverflow',
    grabCursor: true,
    loop: true,
    centeredSlides: true,
    keyboard: true,
    spaceBetween: 0,
    slidesPerView: 'auto',
    speed: 500,
    coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 0,
        modifier: 3,
        slideShadows: false
    },
    breakpoints: {
        480: {
            spaceBetween: 0,
            centeredSlides: true
        }
    },
    simulateTouch: true,
    navigation: {
        nextEl: '.news-slider-next',
        prevEl: '.news-slider-prev'
    },
    on: {
        init: function () {
            var activeItem = document.querySelector('.swiper-slide-active');

            var sliderItem = activeItem.querySelector('.news__item');

            $('.swiper-slide-active .news__item').addClass('active');
        }
    }
});

class CitiesSlider extends React.Component {
    constructor(props) {
        super(props);

        this.IMAGE_PARTS = 4;

        this.changeTO = null;
        this.AUTOCHANGE_TIME = 4000;

        this.state = { activeSlide: -1, prevSlide: -1, sliderReady: false };
    }

    componentWillUnmount() {
        window.clearTimeout(this.changeTO);
    }

    componentDidMount() {
        this.runAutochangeTO();
        setTimeout(() => {
            this.setState({ activeSlide: 0, sliderReady: true });
        }, 0);
    }

    runAutochangeTO() {
        this.changeTO = setTimeout(() => {
            this.changeSlides(1);
            this.runAutochangeTO();
        }, this.AUTOCHANGE_TIME);
    }

    changeSlides(change) {
        window.clearTimeout(this.changeTO);
        const { length } = this.props.slides;
        const prevSlide = this.state.activeSlide;
        let activeSlide = prevSlide + change;
        if (activeSlide < 0) activeSlide = length - 1;
        if (activeSlide >= length) activeSlide = 0;
        this.setState({ activeSlide, prevSlide });
    }

    render() {
        const { activeSlide, prevSlide, sliderReady } = this.state;
        return (
            React.createElement("div", { className: classNames('slider', { 's--ready': sliderReady }) },
                React.createElement("p", { className: "slider__top-heading" }, "Corona cases by country"),
                React.createElement("div", { className: "slider__slides" },
                    this.props.slides.map((slide, index) =>
                        React.createElement("div", {
                            className: classNames('slider__slide', { 's--active': activeSlide === index, 's--prev': prevSlide === index }),
                            key: slide.city
                        },

                            React.createElement("div", { className: "slider__slide-content" },
                                React.createElement("h3", { className: "slider__slide-subheading" }, slide.country || slide.city || slide.people),
                                React.createElement("h2", { className: "slider__slide-heading" },
                                    slide.city.split('').map(l => React.createElement("span", null, l))),
                                React.createElement("h2", { className: "slider__slide-subheading" },
                                    slide.people.split('').map(l => React.createElement("span", null, l))),

                                React.createElement("a", { className: "slider__slide-readmore", href: "#" }, "Move to WorldMap")),

                            React.createElement("div", { className: "slider__slide-parts" },
                                [...Array(this.IMAGE_PARTS).fill()].map((x, i) =>
                                    React.createElement("div", { className: "slider__slide-part", key: i },
                                        React.createElement("div", { className: "slider__slide-part-inner", style: { backgroundImage: `url(${slide.img})` } }))))))),

                React.createElement("div", { className: "slider__control", onClick: () => this.changeSlides(-1) }),
                React.createElement("div", { className: "slider__control slider__control--right", onClick: () => this.changeSlides(1) })));
    }
}
const slides = [
    {
        city: 'Paris',
        country: 'France',
        people: '6,782,789명',
        img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/paris.jpg'
    },

    {
        city: 'Singapore',
        people: '89,539명',
        img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/singapore.jpg'
    },

    {
        city: 'Prague',
        country: 'Czech Republic',
        people: '1,690,288명',
        img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/prague.jpg'
    },

    {
        city: 'Amsterdam',
        country: 'Netherlands',
        people: '99,032명',
        img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/amsterdam.jpg'
    },

    {
        city: 'Moscow',
        country: 'Russia',
        people: '7,464,708명',
        img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/moscow.jpg'
    }];
ReactDOM.render(React.createElement(CitiesSlider, { slides: slides }), document.querySelector('#app'));

//doughnut chart
var doughnut = document.getElementById('doughnut');
doughnut.height = 200;
var doughnutConfig = new Chart(doughnut, {
    type: 'doughnut',
    data: {
        labels: ['data-1', 'data-2', 'data-3', 'data-4', 'data-5', 'data-6'],
        datasets: [{
            label: '# of data',
            data: [1100, 3000, 2000, 1000, 2000, 5000],
            backgroundColor: ['rgba(0, 230, 118, 1)', 'rgba(255, 206, 86, 1)', 'rgba(255,99,132,1)', 'rgba(255,0,255,1)', 'rgba(255,0,0,1)', 'rgba(0,0,255,1)'],
            borderWidth: 1,
            fill: false
        }]
    },
    options: {
        responsive: true, // Instruct chart js to respond nicely.
        maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
    }
});
//line chart
var line = document.getElementById('line');
line.height = 200
var lineConfig = new Chart(line, {
    type: 'line',
    data: {
        labels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        datasets: [{
            label: '# of data', // Name the series
            data: [10, 15, 20, 10, 25, 5, 10, 30], // Specify the data values array
            fill: false,
            borderColor: '#2196f3', // Add custom color border (Line)
            backgroundColor: '#2196f3', // Add custom color background (Points and Fill)
            borderWidth: 1 // Specify bar border width
        }]
    },
    options: {
        responsive: true, // Instruct chart js to respond nicely.
        maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
    }
})
// circle
$('.chart1').easyPieChart({
    barColor: '#f16529',  //차트가 그려질 색
    trackColor: '#ccc',  // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
    scaleColor: '#fff', // 차트 테두리에 그려지는 기준선 (chart2	의 테두리 선)
    lineCap: 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
    lineWidth: 10, // 차트 선의 두께
    size: 100, // 차트크기
    animate: 1000, // 그려지는 시간 
    onStart: $.noop,
    onStop: $.noop
});