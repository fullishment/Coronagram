$(document).ready(function(){
    	redraw();  
	   
    	$("#cartBtn").click(function(){
    		if($("#sMNo").val() != null && $("#sMNo").val() != ""){
	    		$("#priceInp").val($("#color").val());
	    		$("#unitInp").val($(".color_L p").html());
	    		//$("#qtInp").val($("#qt").html());
	    		var params = $("#addForm").serialize();
				$.ajax({ 
					url : "cartAdd", 
					type : "post", 
					dataType : "json", 
					data : params, 
					success : function(res){ 
						if(res.result == "success"){
							location.href="shopCart";
						}else if(res.result == "failed"){
							alert("장바구니 담기 에 실패했습니다");
						}else {
							alert("장바구니 담기 중 문제가 발생했습니다");
							console.log(result);
						}
					},
					error : function(request, status, error){ 
						console.log(error);
					}
				});
    		}else{
    			alert("로그인 이후 이용가능합니다");
    			location.href("login");
    		}
   		});
    	
    	$("#imgBox").on("mouseover","img",function(){
    		$("#mainImage").attr("src",$(this).attr("src"));
    	});
    	
    	
    });

    function redraw(){
    	var params = $("#addForm").serialize();
		$.ajax({ 
			url : "prodDetails",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				drawOpt(res.opt);
				imgDraw(res.attc);
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
   	function imgDraw(list){
    	var html = "";
    	for(var data of list){
	    	html+="<li>                                                      ";
	    	html+="	<a href=\"#abc\" >             ";
	        html+="		<img src=\"resources/upload/"+data.FILE_ADDR+"\" alt=\"\" />  ";
	        html+="	</a>                                                    ";
	        html+="</li>                                                     ";
    	}
		$("#imgBox").html(html);
    }
	
    function drawOpt(list){
    	var html = "";
    	var same= new Array();
    	var i = 0;
    	for(var data of list){   
    		var key = data.UNIT;
    		if(same.indexOf(data.UNIT) < 0){
    			html+= "<div class=\"opt_box\">";
		    	html +="	<div class=\"color_L\"><p>"+data.UNIT+"</p></div>                ";
		        html +="	<div class=\"color_R\">                                    ";
		        html +="		<select name=\"color\" id=\"color\" class=\"select_color\">";
		        html += 			drawSelectOpt(key ,list);
		        html +="		</select>                                            ";
		        html +="	</div>                                                   ";
		        html +="	</div>                                                   ";
    		}
    		same[i] = data.UNIT;
    		i++;

    	}
    	$(".dtl_color").html(html);
    }
    function drawSelectOpt(key,list){
    	var html = "";
    	for(var data of list){
    		if(data.UNIT == key){
    			html += "<option value=\""+data.PRICE+"\" selected>"+data.PRICE+"</option>" ;
    		}
    	}
    	return html;
    }