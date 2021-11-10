var listAvg = new Array();
var listWeek = new Array();

$(document).ready(function() {
	getDayList();
	getList();
	getWeekList();
	getWorldList();
	
	let td_cnt = dataD[0].dc - dataD[1].dc;
	const td_cnt2 = td_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let tt_cnt = dataD[0].dc;
	const tt_cnt2 = tt_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let c_cnt = dataD[0].cc;
	const c_cnt2 = c_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let dt_cnt = dataD[0].dec - dataD[1].dec;
	const dt_cnt2 = dt_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let n_td_cnt = ((dataD[0].dc-dataD[1].dc)-(dataD[1].dc-dataD[2].dc))*1;
	const n_td_cnt2 = n_td_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let y_acc_cnt = dataD[1].dc;
	const y_acc_cnt2 = y_acc_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let n_cl_cnt = (dataD[0].cc-dataD[1].cc)*1;
	const n_cl_cnt2 = n_cl_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	let y_dt_cnt = ((dataD[0].dec-dataD[1].dec)-(dataD[1].dec-dataD[2].dec))*1;
	const y_dt_cnt2 = y_dt_cnt.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	document.getElementById('todayCnt').innerHTML = td_cnt2;
	document.getElementById('totalCnt').innerHTML = tt_cnt2;
	document.getElementById('careCnt').innerHTML = c_cnt2;
	document.getElementById('deathCnt').innerHTML = dt_cnt2;
	document.getElementById('tdCnt').innerHTML = n_td_cnt2;
	document.getElementById('accCnt').innerHTML = "전일 : " + y_acc_cnt2;
	document.getElementById('clCnt').innerHTML = '\+' + n_cl_cnt2;
	document.getElementById('dtCnt').innerHTML = y_dt_cnt2;
	
	if(document.getElementById('tdCnt').innerHTML.substr(0,1)!='-'){
		document.getElementById('tdCnt').innerHTML='+'+((dataD[0].dc-dataD[1].dc)-(dataD[1].dc-dataD[2].dc))*1;
	};
	if(document.getElementById('dtCnt').innerHTML.substr(0,1)!='-'){
		document.getElementById('dtCnt').innerHTML='+'+((dataD[0].dec-dataD[1].dec)-(dataD[1].dec-dataD[2].dec))*1;
	};
	
});


var dataA = new Array();
var dataB = new Array();
var dataC = new Array();
var dataD = new Array();
var index = 0;

function getList(){
	$.ajax({
		type: 'get', //통신 방식을 지정합니다
		async: false,
		url: "chartApiAjax", //통신을 원하는 URL주소를 입력합니다
//		url: "resources/xml/getCovid19InfStateJsonAll.xml", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawList(res);
		console.log(res);
		}
	});
	
}

function drawList(z) {
	
	var mTmp = {};
	var cnt = 0;
	var bedc =0;
	var bedec =0;
	var becc =0;

	$(z).find('item').each(function(index, item){

				 var tmp =  {
					"dc" : parseInt($(this).find('decideCnt').text()),
					"dec" : parseInt($(this).find('deathCnt').text()),
					"cc" : parseInt($(this).find('clearCnt').text()),
					"date" : $(this).find('createDt').text()
				}; 
				
				
				dataA[index]=tmp;
				index++;
				if(index == 1) {
					mTmp.mm =  tmp["date"].substr(0, 7);
					mTmp.dc = tmp["dc"] * 1;
					mTmp.cc = tmp["cc"] * 1;
					mTmp.dec = tmp["dec"] * 1;
					cnt++;
				} else if(mTmp.mm != tmp["date"].substr(0, 7)) {
					mTmp.dc = Math.round(mTmp.dc/cnt);
					mTmp.cc = Math.round(mTmp.cc/cnt);
					mTmp.dec = Math.round(mTmp.dec/cnt);
					
					listAvg.push(mTmp);
					mTmp = {};
					mTmp.mm =  tmp["date"].substr(0, 7);
					mTmp.dc = tmp["dc"] * 1;
					mTmp.cc = tmp["cc"] * 1;
					mTmp.dec = tmp["dec"] * 1;
					cnt = 1;
				} else  {
					mTmp.dc += tmp["dc"] * 1;
					mTmp.cc += tmp["cc"] * 1;
					mTmp.dec += tmp["dec"] * 1;
					cnt++;
				}
		});
	
		if(cnt > 0) {
			mTmp.dc = Math.round(mTmp.dc/cnt);
			mTmp.cc = Math.round(mTmp.cc/cnt);
			mTmp.dec = Math.round(mTmp.dec/cnt);
			listAvg.push(mTmp);
		}
//		console.log(listAvg);
		return listAvg;
}

function getWeekList(){
	$.ajax({
		type: 'get', //통신 방식을 지정합니다
		async: false,
		url: "weekDataAjax", //통신을 원하는 URL주소를 입력합니다
//		url: "resources/xml/getCovid19InfStateJsonWeek.xml", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawWeekList(res);
		}
	});
	
}
//getWeekList();
function drawWeekList(a) {
	
	$(a).find('item').each(function(index, item) {

		var wTmp = {
			"dc" : parseInt($(this).find('decideCnt').text()),
			"dec" : parseInt($(this).find('deathCnt').text()),
			"cc" : parseInt($(this).find('clearCnt').text()),
			"date" : $(this).find('createDt').text()
		};

		dataB[index] = wTmp;
		index++;

	});
	for (var i = 0; i < 7; i++) {
		var wDTmp = {};
		
		var yDc = dataB[i + 1].dc * 1;
		var yDec = dataB[i + 1].dec * 1;
		var yCc = dataB[i + 1].cc * 1;
		
		wDTmp.dc = ((dataB[i].dc) * 1) - yDc;
		wDTmp.dec = ((dataB[i].dec) * 1) - yDec;
		wDTmp.cc = ((dataB[i].cc) * 1) - yCc;
		wDTmp.mm = dataB[i].date.substr(0, 10);

/*		wDTmp.dc = ((dataB[i].wDc) * 1);
		wDTmp.mm = dataB[i].wDate;
*/
		/*				if(a!=0){
		 }else{
		 }
		 */
		listWeek.push(wDTmp);

	}
	console.log(listWeek);
	return listWeek;
}
function getWorldList(){
	$.ajax({
		type: 'get', //통신 방식을 지정합니다
		async: false,
		url: "mapDataApiAjax", //통신을 원하는 URL주소를 입력합니다
//		url: "resources/xml/getCovid19NatInfStateJson.xml", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawWorldList(res);
		}
	});
	
}
function drawWorldList(z) {
	
	$(z).find('item').each(function(index, item){
				 var tmp =  {
					"dc" : parseInt($(this).find('natDefCnt').text()),
					"dec" : parseInt($(this).find('natDeathCnt').text()),
					"name" : $(this).find('nationNmEn').text(),
					"date" : $(this).find('stdDay').text(),
				}; 
				
				dataC[index]=tmp;
				index++;
		});
return dataC;
}


function getDayList(){
	$.ajax({
		type: 'get', //통신 방식을 지정합니다
		async: false,
		url: "dayCntAjax", //통신을 원하는 URL주소를 입력합니다
//		url: "resources/xml/getCovid19InfStateJsonToday.xml", //통신을 원하는 URL주소를 입력합니다
		dataType: 'xml',//서버로부터 받을 데이터 타입을 입력합니다.
		success: function (res) { // 통신 성공시 호출해야할 함수
		console.log($(res).find('totalCount').text());
		drawDayList(res);
		console.log(res);
		}
	});
}

function drawDayList(z) {

	$(z).find('item').each(function(index, item){

				 var tTmp =  {
					"dc" : parseInt($(this).find('decideCnt').text()),
					"dec" : parseInt($(this).find('deathCnt').text()),
					"cc" : parseInt($(this).find('clearCnt').text()),
					"date" : $(this).find('createDt').text()
				}; 
				
				dataD[index]=tTmp;
				index++;
	
		});
	return dataD;
}
