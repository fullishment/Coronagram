
var totCnt = 0;

var page = 1;
var maxP = 0;


	





function drawPaging(){
	
	var startPcount = 0;
	
	if(page % 10 == 0 ) {
		startPcount = page - 10 + 1;
	} else {
		startPcount = (Math.floor(page / 10) * 10) + 1;
	}

	var endPcount = 0;
	
	
	endPcount = startPcount + 10 - 1;
	
	if(endPcount >= maxP){
		endPcount = maxP;
	}
	
	var html = "";
	
	html += "<span page=\"1\">처음</span>     ";
	
	if($("#page").val() == "1"){
		html += "<span page=\"1\">이전</span>     ";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>   ";
	}
	// *1을 하면 자동 숫자변환
	
	for(var i = startPcount ; i <= endPcount ; i++){
		if($("#page").val() == i){
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span> ";
		} else {
			html += "<span page=\"" + i + "\">" + i + "</span>		  ";
		}
	}
	
	if($("#page").val() == maxP){
		html += "<span page=\"" + maxP + "\">다음</span>     ";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>     ";
	}
	
	html += "<span page=\"" + maxP + "\">마지막</span>   ";
	
	$(".paging_wrap").html(html);
}

	

