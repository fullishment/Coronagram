$(document).ready(function(){
    		reDraw();
    		
    		$("#addBtn").click(function(){
    			
	    			location.href="prodAdd";    				
    			
    		});
    		$("#findBtn").on("click",function(){
    			$("#searchGbn").val($("#searchGbnInp").val());
    			$("#searchTxt").val($("#searchInp").val());
    			reDraw();
    		});
    		$("tbody").on("click","#edit_btn",function(){
    			$("#no").val($(this).parent().parent().attr("no"));
    			$("#actionForm").attr("action","prodInfo");
    			$("#actionForm").submit();
    		});
    		$("tbody").on("click","#del_btn",function(){
    			if(confirm("삭제하시겠습니까?")){
	    			$("#no").val($(this).parent().parent().attr("no"));
	    			var params=$("#actionForm").serialize();
		    		$.ajax({
		    			url : "prodDel",
		    			type : "post",
		    			dataType : "json",
		    			data : params,
		    			success : function(res){
		    				reDraw();
		    			},
		    			error : function(request, status, error){
		    				console.log(error);
		    			}
		    		});
    			}
    		});
    		
    	});
    	function reDraw(){
    		var params=$("#actionForm").serialize();
    		$.ajax({
    			url : "adminShopLists",
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
    		var html ="";
    		for(var data of list){
    		html+="<tr no=\""+data.PROD_NO+"\">                     ";
            html+="<td>"+data.PROD_NO+"</td>        ";
            html+="<td>"+data.M_NM+"</td>        ";
            html+="<td>"+data.CAT_NM+"</td>        ";
            html+="<td>"+data.PROD_NM+"</td>        ";
            html+="<td>"+data.POINT+"P</td>        ";
            html+="<td>"+data.SALE_STAT+"</td>        ";
            html+="<td>"+data.PROD_DT+"</td>        ";
            html+="<td><input type=\"button\"  value=\"수정\" id=\"edit_btn\"> <input type=\"button\"  value=\"삭제\" id=\"del_btn\"> </td>        ";
            
            html+="</tr>                    ";
    		}
    		$("tbody").html(html);
    	}