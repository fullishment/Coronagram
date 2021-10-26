<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		
<!-- API불러오기 -->
<script src="resources/script/openAPI/MapAPI.js"></script>

<!-- map -->
<script src="resources/script/highcharts_map/highmaps.js"></script>
<script src="resources/script/highcharts_map/modules/data.js"></script>
<script src="resources/script/highcharts_map/modules/exporting.js"></script>
<script src="resources/script/highcharts_map/modules/offline-exporting.js"></script>
<script src="resources/script/highcharts_map/mapdata/world.js"></script>
<script>
/* var data = [{},{}]; */
/* var data = [{
	
	"z": 'natDefCnt',
	"d": 'natDeathCnt',
	"c": 'stdDay',	    //  "z" 하고 "code"는 있어야함
	"code": "JP"
}];  */ 

/*  var nation = {};
var data = [{},{}]; */
var data = [{
	"z": 100,
"d": 3,
"c": 2,
	"code": "KR"
},
{
	"z": 10000,
"d": 300,
"c": 2,
	"code": "JP"
}];

var allCountry = [
    {
        "name": "Afghanistan",
        "code": "AF"
},
    {
        "name": "Åland Islands",
        "code": "AX"
},
    {
        "name": "Albania",
        "code": "AL"
},
    {
        "name": "Algeria",
        "code": "DZ"
},
    {
        "name": "American Samoa",
        "code": "AS"
},
    {
        "name": "Andorra",
        "code": "AD"
},
    {
        "name": "Angola",
        "code": "AO"
},
    {
        "name": "Anguilla",
        "code": "AI"
},
    {
        "name": "Antarctica",
        "code": "AQ"
},
    {
        "name": "Antigua and Barbuda",
        "code": "AG"
},
    {
        "name": "Argentina",
        "code": "AR"
},
    {
        "name": "Armenia",
        "code": "AM"
},
    {
        "name": "Aruba",
        "code": "AW"
},
    {
        "name": "Australia",
        "code": "AU"
},
    {
        "name": "Austria",
        "code": "AT"
},
    {
        "name": "Azerbaijan",
        "code": "AZ"
},
    {
        "name": "Bahamas",
        "code": "BS"
},
    {
        "name": "Bahrain",
        "code": "BH"
},
    {
        "name": "Bangladesh",
        "code": "BD"
},
    {
        "name": "Barbados",
        "code": "BB"
},
    {
        "name": "Belarus",
        "code": "BY"
},
    {
        "name": "Belgium",
        "code": "BE"
},
    {
        "name": "Belize",
        "code": "BZ"
},
    {
        "name": "Benin",
        "code": "BJ"
},
    {
        "name": "Bermuda",
        "code": "BM"
},
    {
        "name": "Bhutan",
        "code": "BT"
},
    {
        "name": "Bolivia",
        "code": "BO"
},
    {
        "name": "Bosnia and Herzegovina",
        "code": "BA"
},
    {
        "name": "Botswana",
        "code": "BW"
},
    {
        "name": "Bouvet Island",
        "code": "BV"
},
    {
        "name": "Brazil",
        "code": "BR"
},
    {
        "name": "British Indian Ocean Territory",
        "code": "IO"
},
    {
        "name": "Brunei Darussalam",
        "code": "BN"
},
    {
        "name": "Bulgaria",
        "code": "BG"
},
    {
        "name": "Burkina Faso",
        "code": "BF"
},
    {
        "name": "Burundi",
        "code": "BI"
},
    {
        "name": "Cambodia",
        "code": "KH"
},
    {
        "name": "Cameroon",
        "code": "CM"
},
    {
        "name": "Canada",
        "code": "CA"
},
    {
        "name": "Cape Verde",
        "code": "CV"
},
    {
        "name": "Cayman Islands",
        "code": "KY"
},
    {
        "name": "Central African Republic",
        "code": "CF"
},
    {
        "name": "Chad",
        "code": "TD"
},
    {
        "name": "Chile",
        "code": "CL"
},
    {
        "name": "China",
        "code": "CN"
},
    {
        "name": "Christmas Island",
        "code": "CX"
},
    {
        "name": "Cocos (Keeling) Islands",
        "code": "CC"
},
    {
        "name": "Colombia",
        "code": "CO"
},
    {
        "name": "Comoros",
        "code": "KM"
},
    {
        "name": "Congo",
        "code": "CG"
},
    {
        "name": "Congo, The Democratic Republic of the",
        "code": "CD"
},
    {
        "name": "Cook Islands",
        "code": "CK"
},
    {
        "name": "Costa Rica",
        "code": "CR"
},
    {
        "name": "Cote D\"Ivoire",
        "code": "CI"
},
    {
        "name": "Croatia",
        "code": "HR"
},
    {
        "name": "Cuba",
        "code": "CU"
},
    {
        "name": "Cyprus",
        "code": "CY"
},
    {
        "name": "Czech Republic",
        "code": "CZ"
},
    {
        "name": "Denmark",
        "code": "DK"
},
    {
        "name": "Djibouti",
        "code": "DJ"
},
    {
        "name": "Dominica",
        "code": "DM"
},
    {
        "name": "Dominican Republic",
        "code": "DO"
},
    {
        "name": "Ecuador",
        "code": "EC"
},
    {
        "name": "Egypt",
        "code": "EG"
},
    {
        "name": "El Salvador",
        "code": "SV"
},
    {
        "name": "Equatorial Guinea",
        "code": "GQ"
},
    {
        "name": "Eritrea",
        "code": "ER"
},
    {
        "name": "Estonia",
        "code": "EE"
},
    {
        "name": "Ethiopia",
        "code": "ET"
},
    {
        "name": "Falkland Islands (Malvinas)",
        "code": "FK"
},
    {
        "name": "Faroe Islands",
        "code": "FO"
},
    {
        "name": "Fiji",
        "code": "FJ"
},
    {
        "name": "Finland",
        "code": "FI"
},
    {
        "name": "France",
        "code": "FR"
},
    {
        "name": "French Guiana",
        "code": "GF"
},
    {
        "name": "French Polynesia",
        "code": "PF"
},
    {
        "name": "French Southern Territories",
        "code": "TF"
},
    {
        "name": "Gabon",
        "code": "GA"
},
    {
        "name": "Gambia",
        "code": "GM"
},
    {
        "name": "Georgia",
        "code": "GE"
},
    {
        "name": "Germany",
        "code": "DE"
},
    {
        "name": "Ghana",
        "code": "GH"
},
    {
        "name": "Gibraltar",
        "code": "GI"
},
    {
        "name": "Greece",
        "code": "GR"
},
    {
        "name": "Greenland",
        "code": "GL"
},
    {
        "name": "Grenada",
        "code": "GD"
},
    {
        "name": "Guadeloupe",
        "code": "GP"
},
    {
        "name": "Guam",
        "code": "GU"
},
    {
        "name": "Guatemala",
        "code": "GT"
},
    {
        "name": "Guernsey",
        "code": "GG"
},
    {
        "name": "Guinea",
        "code": "GN"
},
    {
        "name": "Guinea-Bissau",
        "code": "GW"
},
    {
        "name": "Guyana",
        "code": "GY"
},
    {
        "name": "Haiti",
        "code": "HT"
},
    {
        "name": "Heard Island and Mcdonald Islands",
        "code": "HM"
},
    {
        "name": "Holy See (Vatican City State)",
        "code": "VA"
},
    {
        "name": "Honduras",
        "code": "HN"
},
    {
        "name": "Hong Kong",
        "code": "HK"
},
    {
        "name": "Hungary",
        "code": "HU"
},
    {
        "name": "Iceland",
        "code": "IS"
},
    {
        "name": "India",
        "code": "IN"
},
    {
        "name": "Indonesia",
        "code": "ID"
},
    {
        "name": "Iran, Islamic Republic Of",
        "code": "IR"
},
    {
        "name": "Iraq",
        "code": "IQ"
},
    {
        "name": "Ireland",
        "code": "IE"
},
    {
        "name": "Isle of Man",
        "code": "IM"
},
    {
        "name": "Israel",
        "code": "IL"
},
    {
        "name": "Italy",
        "code": "IT"
},
    {
        "name": "Jamaica",
        "code": "JM"
},
    {
        "name": "Japan",
        "code": "JP"
},
    {
        "name": "Jersey",
        "code": "JE"
},
    {
        "name": "Jordan",
        "code": "JO"
},
    {
        "name": "Kazakhstan",
        "code": "KZ"
},
    {
        "name": "Kenya",
        "code": "KE"
},
    {
        "name": "Kiribati",
        "code": "KI"
},
    {
        "name": "Korea, Democratic People\"S Republic of",
        "code": "KP"
},
    {
        "name": "Korea, Republic of",
        "code": "KR"
},
    {
        "name": "Kuwait",
        "code": "KW"
},
    {
        "name": "Kyrgyzstan",
        "code": "KG"
},
    {
        "name": "Lao People\"S Democratic Republic",
        "code": "LA"
},
    {
        "name": "Latvia",
        "code": "LV"
},
    {
        "name": "Lebanon",
        "code": "LB"
},
    {
        "name": "Lesotho",
        "code": "LS"
},
    {
        "name": "Liberia",
        "code": "LR"
},
    {
        "name": "Libyan Arab Jamahiriya",
        "code": "LY"
},
    {
        "name": "Liechtenstein",
        "code": "LI"
},
    {
        "name": "Lithuania",
        "code": "LT"
},
    {
        "name": "Luxembourg",
        "code": "LU"
},
    {
        "name": "Macao",
        "code": "MO"
},
    {
        "name": "Macedonia, The Former Yugoslav Republic of",
        "code": "MK"
},
    {
        "name": "Madagascar",
        "code": "MG"
},
    {
        "name": "Malawi",
        "code": "MW"
},
    {
        "name": "Malaysia",
        "code": "MY"
},
    {
        "name": "Maldives",
        "code": "MV"
},
    {
        "name": "Mali",
        "code": "ML"
},
    {
        "name": "Malta",
        "code": "MT"
},
    {
        "name": "Marshall Islands",
        "code": "MH"
},
    {
        "name": "Martinique",
        "code": "MQ"
},
    {
        "name": "Mauritania",
        "code": "MR"
},
    {
        "name": "Mauritius",
        "code": "MU"
},
    {
        "name": "Mayotte",
        "code": "YT"
},
    {
        "name": "Mexico",
        "code": "MX"
},
    {
        "name": "Micronesia, Federated States of",
        "code": "FM"
},
    {
        "name": "Moldova, Republic of",
        "code": "MD"
},
    {
        "name": "Monaco",
        "code": "MC"
},
    {
        "name": "Mongolia",
        "code": "MN"
},
    {
        "name": "Montserrat",
        "code": "MS"
},
    {
        "name": "Morocco",
        "code": "MA"
},
    {
        "name": "Mozambique",
        "code": "MZ"
},
    {
        "name": "Myanmar",
        "code": "MM"
},
    {
        "name": "Namibia",
        "code": "NA"
},
    {
        "name": "Nauru",
        "code": "NR"
},
    {
        "name": "Nepal",
        "code": "NP"
},
    {
        "name": "Netherlands",
        "code": "NL"
},
    {
        "name": "Netherlands Antilles",
        "code": "AN"
},
    {
        "name": "New Caledonia",
        "code": "NC"
},
    {
        "name": "New Zealand",
        "code": "NZ"
},
    {
        "name": "Nicaragua",
        "code": "NI"
},
    {
        "name": "Niger",
        "code": "NE"
},
    {
        "name": "Nigeria",
        "code": "NG"
},
    {
        "name": "Niue",
        "code": "NU"
},
    {
        "name": "Norfolk Island",
        "code": "NF"
},
    {
        "name": "Northern Mariana Islands",
        "code": "MP"
},
    {
        "name": "Norway",
        "code": "NO"
},
    {
        "name": "Oman",
        "code": "OM"
},
    {
        "name": "Pakistan",
        "code": "PK"
},
    {
        "name": "Palau",
        "code": "PW"
},
    {
        "name": "Palestinian Territory, Occupied",
        "code": "PS"
},
    {
        "name": "Panama",
        "code": "PA"
},
    {
        "name": "Papua New Guinea",
        "code": "PG"
},
    {
        "name": "Paraguay",
        "code": "PY"
},
    {
        "name": "Peru",
        "code": "PE"
},
    {
        "name": "Philippines",
        "code": "PH"
},
    {
        "name": "Pitcairn",
        "code": "PN"
},
    {
        "name": "Poland",
        "code": "PL"
},
    {
        "name": "Portugal",
        "code": "PT"
},
    {
        "name": "Puerto Rico",
        "code": "PR"
},
    {
        "name": "Qatar",
        "code": "QA"
},
    {
        "name": "Reunion",
        "code": "RE"
},
    {
        "name": "Romania",
        "code": "RO"
},
    {
        "name": "Russian Federation",
        "code": "RU"
},
    {
        "name": "RWANDA",
        "code": "RW"
},
    {
        "name": "Saint Helena",
        "code": "SH"
},
    {
        "name": "Saint Kitts and Nevis",
        "code": "KN"
},
    {
        "name": "Saint Lucia",
        "code": "LC"
},
    {
        "name": "Saint Pierre and Miquelon",
        "code": "PM"
},
    {
        "name": "Saint Vincent and the Grenadines",
        "code": "VC"
},
    {
        "name": "Samoa",
        "code": "WS"
},
    {
        "name": "San Marino",
        "code": "SM"
},
    {
        "name": "Sao Tome and Principe",
        "code": "ST"
},
    {
        "name": "Saudi Arabia",
        "code": "SA"
},
    {
        "name": "Senegal",
        "code": "SN"
},
    {
        "name": "Serbia",
        "code": "RS"
},
    {
        "name": "Montenegro",
        "code": "ME"
},
    {
        "name": "Seychelles",
        "code": "SC"
},
    {
        "name": "Sierra Leone",
        "code": "SL"
},
    {
        "name": "Singapore",
        "code": "SG"
},
    {
        "name": "Slovakia",
        "code": "SK"
},
    {
        "name": "Slovenia",
        "code": "SI"
},
    {
        "name": "Solomon Islands",
        "code": "SB"
},
    {
        "name": "Somalia",
        "code": "SO"
},
    {
        "name": "South Africa",
        "code": "ZA"
},
    {
        "name": "South Georgia and the South Sandwich Islands",
        "code": "GS"
},
    {
        "name": "Spain",
        "code": "ES"
},
    {
        "name": "Sri Lanka",
        "code": "LK"
},
    {
        "name": "Sudan",
        "code": "SD"
},
    {
        "name": "Suriname",
        "code": "SR"
},
    {
        "name": "Svalbard and Jan Mayen",
        "code": "SJ"
},
    {
        "name": "Swaziland",
        "code": "SZ"
},
    {
        "name": "Sweden",
        "code": "SE"
},
    {
        "name": "Switzerland",
        "code": "CH"
},
    {
        "name": "Syrian Arab Republic",
        "code": "SY"
},
    {
        "name": "Taiwan, Province of China",
        "code": "TW"
},
    {
        "name": "Tajikistan",
        "code": "TJ"
},
    {
        "name": "Tanzania, United Republic of",
        "code": "TZ"
},
    {
        "name": "Thailand",
        "code": "TH"
},
    {
        "name": "Timor-Leste",
        "code": "TL"
},
    {
        "name": "Togo",
        "code": "TG"
},
    {
        "name": "Tokelau",
        "code": "TK"
},
    {
        "name": "Tonga",
        "code": "TO"
},
    {
        "name": "Trinidad and Tobago",
        "code": "TT"
},
    {
        "name": "Tunisia",
        "code": "TN"
},
    {
        "name": "Turkey",
        "code": "TR"
},
    {
        "name": "Turkmenistan",
        "code": "TM"
},
    {
        "name": "Turks and Caicos Islands",
        "code": "TC"
},
    {
        "name": "Tuvalu",
        "code": "TV"
},
    {
        "name": "Uganda",
        "code": "UG"
},
    {
        "name": "Ukraine",
        "code": "UA"
},
    {
        "name": "United Arab Emirates",
        "code": "AE"
},
    {
        "name": "United Kingdom",
        "code": "GB"
},
    {
        "name": "United States",
        "code": "US"
},
    {
        "name": "United States Minor Outlying Islands",
        "code": "UM"
},
    {
        "name": "Uruguay",
        "code": "UY"
},
    {
        "name": "Uzbekistan",
        "code": "UZ"
},
    {
        "name": "Vanuatu",
        "code": "VU"
},
    {
        "name": "Venezuela",
        "code": "VE"
},
    {
        "name": "Viet Nam",
        "code": "VN"
},
    {
        "name": "Virgin Islands, British",
        "code": "VG"
},
    {
        "name": "Virgin Islands, U.S.",
        "code": "VI"
},
    {
        "name": "Wallis and Futuna",
        "code": "WF"
},
    {
        "name": "Western Sahara",
        "code": "EH"
},
    {
        "name": "Yemen",
        "code": "YE"
},
    {
        "name": "Zambia",
        "code": "ZM"
},
    {
        "name": "Zimbabwe",
        "code": "ZW"
}
]

 var dataArray =new Array();


$(document).ready(function() {
	console.log(allCountry);
	getList();
	/* Highcharts.mapChart('container', {
	    chart: {
	        borderWidth: 1,
	        map: 'custom/world'
	    },
	
	    title: {
	        text: 'Coronamap'
	    },
	
	    subtitle: {
	        text: 'in world'
	    },
	
	    legend: {
	        enabled: false
	    },
	
	    mapNavigation: {
	        enabled: true,
	        buttonOptions: {
	            verticalAlign: 'bottom'
	        }
	    },
	
	    series: [{
	        name: 'Countries',
	        color: '#E0E0E0',
	        enableMouseTracking: false
	    }, {
	        type: 'mapbubble',
	        name: 'COVID-19',
	        joinBy: ['iso-a2', 'code'],
	        color: "#E00000",
	        data: dataArray,
	        minSize: 4,
	        maxSize: '4%',
	        tooltip: {
	            pointFormat: '{point.properties.name}: {point.z} people<br/> death : {point.d} people <br/> {point.사망자수}'
	        }
	    }]
	    
	   
	}); */
});

function getList(){
	$.ajax({
		type: 'POST', //통신 방식을 지정합니다
		url: "mapDataApiAjax", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawList(res);
		}
	});
	
}
function findCode(name){
	for(var i=0; i<allCountry.length;i++){
		if(allCountry[i].name == name){
			return allCountry[i].code;
		}
	}
}
function drawList(data) {
	//var html = "";
	
	$(data).find('item').each(function(index, item){
			//html += "<div>"
				//html += "<item>" + $(this).find('areaNm').text() + "</item>       "; //지역명        
				//html += "<item>" + $(this).find('areaNmEn').text() + "</item>     "; //지역명(영문)
				var index = findCode($(this).find('nationNmEn').text());
				 var data =  ({
					"z" : $(this).find('natDefCnt').text(),
					"d" : $(this).find('natDeathCnt').text(),
					"c" : $(this).find('stdDay').text(),
					"code" : index
				});
				
				dataArray.push(data);
				console.log(data);
				//html += "<item>" + $(this).find('stdDay').text() + "</item>       "; //기준일시
				//html += "<item>" + $(this).find('nationNmEn').text() + "</item>   "; //국가명(영문)
				//html += "<item>" + $(this).find('natDefCnt').text() + "</item>    "; //국가별 확진자 수
				//html += "<item>" + $(this).find('natDeathCnt').text() + "</item>  "; //국가별 사망자 수
				
				//html += "<item>" + $(this).find('createDt').text() + "</item>     "; //등록일시분초
				//html += "<item>" + $(this).find('UPDATE_DT').text() + "</item>    "; //수정일시분초
			
				//html += "<item>" + $(this).find('resultCode').text() + "</item>     "; //결과코드
				//html += "<item>" + $(this).find('resultMsg').text() + "</item>     "; //결과메시지
				
				//html += "<item>" + $(this).find('natDeathRate').text() + "</item> "; //확진률 대비 사망률
				//html += "<item>" + $(this).find('nationNm').text() + "</item>     "; //국가명			
				//html += "<item>" + $(this).find('seq').text() + "</item>          "; //게시글번호(국외발생현황고유값)				
				html+="</div>"
			
			
		});
		
		
		
		
	}
</script>

<style>
	#container{
		height: 90vh;  width: 90vw; /* min-width: 310px; max-width: 800px; */ margin: 0 auto;
	}
</style>
</head>
<body>	
<!-- api목록 -->
<div class="con1"></div>
 <!-- 세계지도 -->
<!--   <div id="container" ></div>  -->
</body>
</html>