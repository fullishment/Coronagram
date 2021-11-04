document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	var fulldate = year+ '-' + month + '-' + day;
		
	
	calendar = new FullCalendar.Calendar(calendarEl, {
		height : '700px',
		expandRows : true,
		slotMinTime : '08:00',
		slotMaxTime : '24:00',
		headerToolbar : {
			left : '',
			center : 'title',
			right : 'checkAtt prev,today,next'
		},
		customButtons : {
			checkAtt : {
				text : '출석체크',
				id : 'check',

				click : function() {
					var params = $("#calForm").serialize();
					$.ajax({
						url : "calendarDataCheck",
						type : "POST",
						dataType : "json",
						data : params,
						success : function(res){
							if(res.attCnt > 0){
								
								alert("이미 출석체크를 완료 하였습니다")
								$(".fc-checkAtt-button").prop('disabled',true);
								calendar.render();
								
							}else{
								$.ajax({
									url : 'getSysdate',
									type : 'POST',
									dataType : 'json',
									data : params,
									success : function(res) {
										console.log(res.result);
										
										calendar.addEvent({
											start : res.ATT_DT,
											title : res.TITLE,													
										});

										alert("출석완료");
										location.reload(true);
//										$(".fc-checkAtt-button").prop('disabled', true);
										calendar.render();
									},
									error : function(data) {
										alert('데이터 불러오기 실패');
									}
								});
								
							}
							
						},
						error : function(request, status, error){
							console.log(error);
						}
					});
				}
			},

		},

		eventSources : [ {

			events : function(info, successCallback, failureCallback) {
				var params = $("#calForm").serialize();

				$.ajax({
					url : 'attendances',
					type : 'POST',
					dataType : 'json',
					data : params
					,
					success : function(data) {
						successCallback(data.data);
						
						calendar.render();
					}
				});
			},
			color : 'transparent',
			textColor : 'black',

		} ],
	/*	select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
			var title = prompt('할일 입력:');
			if (title) {
			calendar.addEvent({
			title: title,
			start: arg.start,
			end: arg.end,
			allDay: arg.allDay
			})
			}
			calendar.unselect()
			},*/




		initialView : 'dayGridMonth',
		navLinks : false,
		editable : false,
		selectable : true,
		nowIndicator : true,
		dayMaxEvents : true,
		locale : 'ko',
		eventAdd : function(obj) {
			console.log(obj);
		},
		eventChange : function(obj) {
			console.log(obj);
		},
		eventRemove : function(obj) {
			console.log(obj);
		}
	});

	calendar.render();

});
