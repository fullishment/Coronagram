var cnt=0;
    $(document).ready(function(){
    	$("#cancleBtn").click(function(){
    		if(confirm("수정내용을 취소하시겠습니까?")){
    			history.back();
    		}
    	});
    	$("#updateBtn").click(function(){
    		if(checkVal("#prodNm")){
    			alert("상품명이 입력되지않았습니다");
    			$("#prodNm").focus();
    		}else if(checkVal("#price")){
    			alert("가격이 입력되지않았습니다");
    			$("#price").focus();
    		}else if(checkVal("#text_field")){
    			alert("내용이 입력되지않았습니다");
    			$("#text_field").focus();
    		}else{
  				var opt = $("input[name=\"option\"]");
  				var optArray = new Array ();
  				for(var i=0;i<opt.length;i++){
  					optArray.push(opt[i].value);
  				}
  				
  				$("#optInp").val(optArray);
        		var srcArray = new Array();
        		var imgA = $("img[alt=\"thumbnail\"]"); 
        		for(var i=0;i<imgA.length;i++){
    				srcArray.push(imgA[i].src.substring(imgA[i].src.lastIndexOf("/")+1));
        		}
        		$("#bFile").val(srcArray);

        		
        		var params = $("#productForm").serialize();
        		console.log(params);
        		$.ajax({
    				url : "prodUs",
        			type : "post",
        			dataType : "json",
        			data :params,
        			success : function(res){
    					if(res.result == "success"){
    						location.href="adminShopList";
    					}
        				
        			},
        			error : function(request, status, error){
        				console.log(error);
        			}
    			});
    		}
    		
    	});
    	$("td").on("click","img",function(){
    		if($(this).is("#plusImg") ==false){
    			$("#aNo").val($(this).attr("no"));
    			if(confirm("선택한 이미지를 삭제하시겠습니까?")){
	    			$(this).remove();
    			}
    		}else {
    			if($("td img").length >5){
    				alert("이미지 등록 최대갯수를 초과하셨습니다.");
    			}else {
	    			$("#att").click();
    				
    			}
    		}
    	});
    	$("td").on("mouseover","img",function(){
    		if($(this).is("#plusImg") ==false){
    			var html = "<img src="+$(this).attr("src")+"  alt=\"preview\">";
    			$(".upload").html(html);
    		}
    	});
    	
    	$("#fileForm").on("change","input[type='file']",function(){
    		var fileForm = $("#fileForm");
    		fileForm.ajaxForm({
    			success : function(res){
    				if(res.result == "SUCCESS"){
    					//업로드 파일명 적용
    					if(res.fileName.length > 0){
    						$("#bFile").val(res.fileName[0]);
    						var html = " <img src=\"resources/upload/"+$("#bFile").val()+"\" class=\"thumbnailImg\" alt=\"thumbnail\" id=\"preview\" >";
    						$("#plusImg").before(html);
    					}
    				}else{
    					alert("파일 업로드에 실패했습니다.");
    				}
    			},
    			error : function(req, status, error){
    				console.log(error);
    				alert("파일 업로드중 문제가 발생했습니다.")
    			}
    		});
    		fileForm.submit();
    	});
    	$("#plus").on("click",function(){
    		var html = "<img alt=\"del\" src=\"resources/images/icon/plusNOBorder.png\"  class=\"del_icon\" id=\"delIcon\"><br/><label>옵션 값</label><input type=\"text\" id=\"op\" name=\"option\" class=\"pri_input\"/> ";
    		$(this).before(html);
    	});
    	$("#opt").on("click","#delIcon",function(){
    		$(this).prev().prev().prev().remove();
    		$(this).prev().prev().remove();
    		$(this).prev().remove();
    		$(this).remove();
    	});
    	
    });
    function checkVal(sel){
    	if($.trim($(sel).val())==""){
    		return true;
    	}else{
    		return false;
    	}
    };
    function attcAjax(srcArray,i){
    	console.log("aaa");
    	$("#bFile").val(srcArray[i]);
    	var params = $("#productForm").serialize();
		$.ajax({
			url : "prodAttcAdd",
			type : "post",
			dataType : "json",
			data : params,
			success : function(res){
				cnt++;
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
    }
    
   
    