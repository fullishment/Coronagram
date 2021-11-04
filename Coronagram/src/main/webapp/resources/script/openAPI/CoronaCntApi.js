var listAvg = new Array();
var listWeek = new Array();

$(document).ready(function() {
	getList();
	getWeekList();
//	console.log(dataA[1].dc);
	
	let td_cnt = dataA[0].dc - dataA[1].dc;
	let tt_cnt = dataA[0].dc;
	let c_cnt = dataA[0].cc;
	let dt_cnt = dataA[0].dec - dataA[1].dec;
	
	let n_td_cnt = ((dataA[0].dc-dataA[1].dc)-(dataA[1].dc-dataA[2].dc))*1;
	let y_acc_cnt = dataA[1].dc;
	let n_cl_cnt = (dataA[0].cc-dataA[1].cc)*1;
	let y_dt_cnt = ((dataA[0].dec-dataA[1].dec)-(dataA[1].dec-dataA[2].dec))*1;
	
	document.getElementById('todayCnt').innerHTML = td_cnt;
	document.getElementById('totalCnt').innerHTML = tt_cnt;
	document.getElementById('careCnt').innerHTML = c_cnt;
	document.getElementById('deathCnt').innerHTML = dt_cnt;
	document.getElementById('tdCnt').innerHTML = n_td_cnt;
	document.getElementById('accCnt').innerHTML = "전일 : " + y_acc_cnt;
	document.getElementById('clCnt').innerHTML = '\+' + n_cl_cnt;
	document.getElementById('dtCnt').innerHTML = y_dt_cnt;
	
	if(document.getElementById('tdCnt').innerHTML.substr(0,1)!='-'){
		document.getElementById('tdCnt').innerHTML='+'+((dataA[0].dc-dataA[1].dc)-(dataA[1].dc-dataA[2].dc))*1;
	};
	if(document.getElementById('dtCnt').innerHTML.substr(0,1)!='-'){
		document.getElementById('dtCnt').innerHTML='+'+((dataA[0].dec-dataA[1].dec)-(dataA[1].dec-dataA[2].dec))*1;
	};
	
	
	//testtest();
	//console.log(data13);
});


var dataA =new Array();
var index=0;
var dataB = new Array();


function getList(){
	$.ajax({
		type: 'POST', //통신 방식을 지정합니다
		async :false,
		url: "chartApiAjax", //통신을 원하는 URL주소를 입력합니다
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
		type: 'POST', //통신 방식을 지정합니다
		async :false,
		url: "weekDataAjax", //통신을 원하는 URL주소를 입력합니다
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
		//listWeek.push(wDTmp.dc);

	}
	console.log(listWeek);
	return listWeek;
}