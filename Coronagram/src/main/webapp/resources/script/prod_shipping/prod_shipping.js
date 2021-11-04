$(document).ready(function(){
			if($("#sMNo").val() != null && $("#sMNo").val() != ""){
				$(".notlogin").remove();
				redrawList();
			}
			$("#dataBtn").on("click",function(){
				var endDate = $("#order_list2").val();
				$("#startDate").val($("#order_list1").val());
				
				$("#endDate").val($("#order_list2").val());
				console.log($("#startDate").val());
				console.log($("#endDate").val());
				redrawList();
			});
		});
	function redrawList(){
		var params = $("#actionForm").serialize();
		$.ajax({
			url : "prodSpList",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				drawList(res.list);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
	}
	function drawList(list){
		var stat = new Array('주문접수','상품 준비중','배송 준비중','배송중','배송 완료');
		
		var html="";
		for(var data of list){
		html+="<tr>                  ";
        html+="<td>"+data.CAT_NO+"</td>      ";
        html+="<td>"+data.PROD_NO+"</td>      ";
        html+="<td>"+data.PROD_NM+"</td>  ";
        html+="<td>"+data.M_NM+"</td>      ";
        html+="<td>"+data.POST_NO+"</br>      ";
        html+=""+data.ADR+"</br>      ";
        html+=""+data.DTL_ADR+"</td>      ";
        html+="<td>"+data.ORD_DT+"</td>      ";
        html+="<td>"+stat[data.ORD_STAT-1]+"</td>      ";
        
        html+="</tr>                 ";
		}
		$("tbody").html(html);
	}
	
	