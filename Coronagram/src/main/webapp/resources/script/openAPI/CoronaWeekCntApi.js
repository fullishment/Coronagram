var listWeek = new Array();

getWeekList();

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
var dataB = new Array();
var index=0;

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