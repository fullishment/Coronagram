/////Last modified 02/06/2016
getList();
getWeekList();
let cr_dt = dataA[0].date;
	document.getElementById('createDt').firstChild.nodeValue ="기준 시간 :" + cr_dt;


$(function () {

	function setFlatTheme() {
		$("body").toggleClass("flat-theme");
		$("#rad-color-opts").toggleClass("hide");
		$(".rad-chk-pin input[type=checkbox]").prop("checked", true);
	}

	setFlatTheme();

	$(window).on("scroll", function (e) {
		if ($(window).scrollTop() > 50) {
			$("body").addClass("sticky");
		} else {
			$("body").removeClass("sticky");
		}
	});

	$(document).on("click", function (e) {
		e.preventDefault();
		var $item = $(".rad-dropmenu-item");
		if ($item.hasClass("active")) {
			$item.removeClass("active");
		}
	});


	$(".rad-toggle-btn").on("click", function () {
		$(".rad-logo-container").toggleClass("rad-nav-min");
		$(".rad-sidebar").toggleClass("rad-nav-min");
		$(".rad-body-wrapper").toggleClass("rad-nav-min");
		setTimeout(function () {
			initializeCharts();
		}, 200);
	});

	$("li.rad-dropdown > a.rad-menu-item").on("click", function (e) {
		e.preventDefault();
		e.stopPropagation();
		$(".rad-dropmenu-item").removeClass("active");
		$(this).next(".rad-dropmenu-item").toggleClass("active");
	});

	$(".fa-chevron-down").on("click", function () {
		var $ele = $(this).parents(".panel-heading");
		$ele.siblings(".panel-footer").toggleClass("rad-collapse");
		$ele.siblings(".panel-body").toggleClass("rad-collapse", function () {
			setTimeout(function () {
				initializeCharts();
			}, 200);
		});
	});

	$(".fa-close").on("click", function () {
		var $ele = $(this).parents(".panel");
		$ele.addClass("panel-close");
		setTimeout(function () {
			$ele.parent().remove();
		}, 210);
	});

	$(".fa-rotate-right").on("click", function () {
		var $ele = $(this).parents(".panel-heading").siblings(".panel-body");
		$ele.append(
			'<div class="overlay"><div class="overlay-content"><i class="fa fa-refresh fa-2x fa-spin"></i></div></div>'
		);
		setTimeout(function () {
			$ele.find(".overlay").remove();
		}, 2000);
	});

		$(".rad-chk-pin input[type=checkbox]").change(function (e) {
		$("body").toggleClass("flat-theme");
		$("#rad-color-opts").toggleClass("hide");
		var selectedTheme = $(".rad-color-swatch input[type=radio]:checked");
		var fillColor = '#C6C6C6';
		var scale = ["#C8EEFF", "#0071A4"];

		if (this.checked) {
			scale = ["#A8ECFF", "#FA71D4"];
			fillColor = colorMap[selectedTheme.val()];
		}
		
		changeMapColors(fillColor, scale);
	});
	


	$(".rad-color-swatch input[type=radio]").change(function (e) {
		if ($(".rad-chk-pin input[type=checkbox]").is(":checked")) {
			$("body").removeClass().addClass("flat-theme").addClass(this.value);
			$(".rad-color-swatch label").removeClass("rad-option-selected");
			$(this).parent().addClass("rad-option-selected");
			$(window).scrollTop(0);

			changeMapColors(colorMap[this.value], ["#A8ECFF", "#FA71D4"]);
		}
	});

	$(".rad-notification-item").on("click", function (e) {
		e.stopPropagation();
	});

	$(window).resize(function () {
		setTimeout(function () {
			initializeCharts();
		}, 200);
	});

	
	var colors = ["#E94B3B", "#39C7AA", "#1C7EBB", "#F98E33"];


	let ageData = getDataList().ageData;
		
	var data3 = [
		{
			age: '10대',
			person: ageData.AGE10
		},
		{
			age: '20대',
			person: ageData.AGE20
		},
		{
			age: '30대',
			person: ageData.AGE30
		},
		{
			age: '40대',
			person: ageData.AGE40
		},
		{
			age: '50대',
			person: ageData.AGE50
		},
		{
			age: '60대 이상',
			person: ageData.OAGE60
		}
	];
	var data4 = [
		{
			item: "iphone",
			quantity: 200
		},
		{
			item: "ipad",
			quantity: 200
		},
		{
			item: "mask",
			quantity: 200
		}
	];

	function initializeCharts() {
		$(".rad-chart").empty();
		$(".d3-*").empty();

		 Morris.Line({
		 	lineColors: ["#D9DD81", "#E67A77", "#79D1CF"],
		 	element: "lineChart",
		 	data: listWeek,
		 	xkey: "mm",
		 	ykeys: ["dc", "dec", "cc"],
		 	labels: ["확진자", "사망자", "완치자"],
		 	pointSize: 0,
		 	hideHover: "auto"
		 });
		Morris.Donut({
			element: "donutChart",
			data: 			[
				{
					label:"아스트로제네카" ,value: 25
				},
				{
					label:"화이자" ,value: 25
				},
				{
					label:"모더나" ,value: 25
				},
				{
					label:"얀센" ,value: 25
				}
			],
			labelColor: "#23AE89",
			colors: ["#E67A77", "#D9DD81", "#79D1CF", "#95D7BB"]
		});

		
		var ad = document.getElementById('admin').innerHTML;
		adC= ad*1;
		var di = document.getElementById('diamond').innerHTML;
		diC= di*1;
		var pl = document.getElementById('platinum').innerHTML;
		plC= pl*1;
		var go = document.getElementById('gold').innerHTML;
		goC= go*1;
		var si = document.getElementById('silver').innerHTML;
		siC= si*1;
		var br = document.getElementById('bronze').innerHTML;
		brC= br*1;
	
		Morris.Donut({
			element: "donutChart6",
			data: [
				{
					label:"diamond" ,value: diC
				},
				{
					label:"platinum" ,value: plC
				},
				{
					label:"gold" ,value: goC
				},
				{
					label:"silver" ,value: siC
				},
				{
					label:"bronze" ,value: brC
				},
				{
					label:"manager" ,value: adC
				}
			],
			labelColor: "#23AE89",
			colors: ["#f75353", "#f87d43", "#cafa1e", "#12e23f","#092ee6","#a859f1"]
		});
		
		
		Morris.Bar({
			element: "barChart",
			data: data3,
			xkey: "age",
			ykeys: ["person"],
			barColors: ["#95D7BB", "#79D1CF"],
			labels: ["인원"]
		});

		let today = new Date();
		let todate = today.getDate();
		let tomonth = today.getMonth() + 1;
		let todate6 = today.getDate(today.setDate(today.getDate()-6));
		let month6 = today.getMonth(today.setDate(today.getDate())) + 1;
		let todate5 = today.getDate(today.setDate(today.getDate()+1));
		let month5 = today.getMonth(today.setDate(today.getDate())) + 1;
		let todate4 = today.getDate(today.setDate(today.getDate()+1));
		let month4 = today.getMonth(today.setDate(today.getDate())) + 1;
		let todate3 = today.getDate(today.setDate(today.getDate()+1));
		let month3 = today.getMonth(today.setDate(today.getDate())) + 1;
		let todate2 = today.getDate(today.setDate(today.getDate()+1));
		let month2 = today.getMonth(today.setDate(today.getDate())) + 1;
		let todate1 = today.getDate(today.setDate(today.getDate()+1));
		let month1 = today.getMonth(today.setDate(today.getDate())) + 1;
		
		let weekdata = getDataList().weekData;
		console.log(getDataList().joinData)
		var data2 = [
			
			{
				day: month6 + '월' + todate6 + "일",
				join: weekdata['6DAYS_AGO']
			},
			{
				day: month5 + '월' + todate5 + "일",
				join: weekdata['5DAYS_AGO']
			},
			{
				day: month4 + '월' +  todate4 + "일",
				join: weekdata['4DAYS_AGO']
			},
			{
				day: month3 + '월' +  todate3 + "일",
				join: weekdata['3DAYS_AGO']
			},
			{
				day: month2 + '월' +  todate2 + "일",
				join: weekdata['2DAYS_AGO']
			},
			{
				day: month1 + '월' +  todate1 + "일",
				join: weekdata['1DAYS_AGO']
			},	
			{
				day: tomonth + '월' +  todate + "일", 
				join: weekdata.TODAY
			}
		];
		Morris.Bar({
			element: "barChart2",
			data: data2,
			xkey: "day",
			ykeys: ["join"],
			barColors: ["#D9DD81", "#79D1CF"],
			labels: ["가입자"]
		});
		Morris.Bar({
			element: "barChart3",
			data: getDataList().joinData,
			xkey: "DT",
			ykeys: ["CNT","AVGCNT"],
			barColors: ["#E67A77", "#79D1CF"],
			labels: ["총 가입자", "평균 가입자"]
		});
		Morris.Bar({
			element: "barChart4",
			data: getDataList().bestSellData,
			xkey: "PROD_NM",
			ykeys: ["CNT"],
			barColors: ["#E67A77", "#79D1CF"],
			labels: ["수량"]
		});

		// Morris.Area({
		// 	element: 'areaChart',
		// 	data:[
		// 		{
		// 		y:"2020-1",
		// 		확진자:1000,
		// 		사망자:2000,
		// 		완치자:3000
		// 	},
		// 	{
		// 		y:"2020-2",
		// 		확진자:1000,
		// 		사망자:2000,
		// 		완치자:3000
		// 	},
		// 	{
		// 		y:"2020-3",
		// 		확진자:1000,
		// 		사망자:2000,
		// 		완치자:3000
		// 	},
		// 	{
		// 		y:"2020-4",
		// 		확진자:1000,
		// 		사망자:2000,
		// 		완치자:3000
		// 	},
		// 	{
		// 		y:"2020-5",
		// 		확진자:1000,
		// 		사망자:2000,
		// 		완치자:3000
		// 	},
		// ],
		// xkey: 'y',
		// ykeys:['확진자','사망자','완치자'],
		// labels:['확진자','사망자','완치자']
		// });
		Morris.Area({
			element: "areaChart",
			padding: 10,
			behaveLikeLine: true,
			gridEnabled: false,
			gridLineColor: "#dddddd",
			axes: true,
			fillOpacity: 0.7,
			data:listAvg,
			lineColors: ["#D6D23A", "#ED5D5D", "#32D2C9"],
			xkey: "mm",
			ykeys: ["dc", "dec", "cc"],
			labels: ["누적 확진자", "누적 사망자", "누적 완치자"],
			pointSize: 0,
			lineWidth: 0,
			hideHover: "auto"
		});
	}

	initializeCharts();

});

var monthNames = [
		"Jan",
		"Feb",
		"Mar",
		"Apr",
		"May",
		"Jun",
		"Jul",
		"Aug",
		"Sep",
		"Oct",
		"Nov",
		"Dec"
	];

var data = [
		{
			label: "Technology",
			value: 20
		},
		{
			label: "Financial",
			value: 45
		},
		{
			label: "Industrial Goods",
			value: 30
		},
		{
			label: "Consumer Goods",
			value: 10
		},
		{
			label: "Basic Materials",
			value: 5
		}
	];


function getDataList(){
	let day6;
	
	$.ajax({
		url : "adminChartAjax",
		type : "post",
		async : false,
		data : {},
		success : function(res){
			day6 = res;
		},
		error : function(request, status, error){
			console.log(error);	
		}
	});
	
	return day6;
}

function getDonutData(group, column) {
	function sum(numbers) {
		return _.reduce(
			numbers,
			function (result, current) {
				return result + 1;
			},
			0
		);
	}
	var result = _.chain(getChartData())
		.groupBy(group)
		.map(function (value, key) {
			return {
				label: key,
				value: sum(_.pluck(value, column))
			};
		})
		.value();

	return result;
}
function getDonutData2(group, column) {
	function sum(numbers) {
		return _.reduce(
			numbers,
			function (result, current) {
				return result + 1;
			},
			0
		);
	}
	var result = _.chain(getChartData2())
		.groupBy(group)
		.map(function (value, key) {
			return {
				label: key,
				value: sum(_.pluck(value, column))
			};
		})
		.value();

	return result;
}

var dataA =new Array();
var index=0;

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