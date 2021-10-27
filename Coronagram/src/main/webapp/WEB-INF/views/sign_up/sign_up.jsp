<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/sign_up/sign_up.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
  	$("#cancel_btn").on("click",function(){
  		history.back(); 
  	});
//id체크
  	$("#m_id").on("change", function(){
		//Ajax
		var params = $("#addForm").serialize();
		
		$.ajax({
			url: "MIdCheckAjax",
			type : "post",
			dataType:"json",
			data: params,
			success: function(res) {
				if(res.cnt > 0) {  
					$("#check").html("중복된 아이디가 있습니다.");
					$("#check").css("color", "red");
					$("#checkId").val("false");
				} else {
					$("#check").html("사용 가능한 아이디 입니다.");
					$("#check").css("color", "green");
					$("#checkId").val("true");
				}
			},
			error:function(request, status, error) {
				console.log(error);
			}
		});
	});
//닉네임 체크
  	$("#nick_nm").on("change", function(){
		//Ajax
		var params = $("#addForm").serialize();
		
		$.ajax({
			url: "MNickCheckAjax",
			type : "post",
			dataType:"json",
			data: params,
			success: function(res) {
				if(res.cnt > 0) {  
					$("#checkNc").html("중복된 닉네임이 있습니다.");
					$("#checkNc").css("color", "red");
					$("#checknick").val("false");
				} else {
					$("#checkNc").html("사용 가능한 닉네임 입니다.");
					$("#checkNc").css("color", "green");
					$("#checknick").val("true");
				}
			},
			error:function(request, status, error) {
				console.log(error);
			}
		});
	});
//add버튼 
  	$("#add_btn").on("click", function(){
  		if(checkVal("#m_id")){
  			alert("아이디를 입력해 주세요.");
  			$("#m_id").focus();
  		
  		} else if (checkVal("#m_nm")){
  			alert("이름을 입력해 주세요.");
  			$("#m_nm").focus();
  			
  		}else if (checkVal("#nick_nm")){
  			alert("닉네임을 입력해 주세요.");
  			$("#nick_nm").focus();

  		}else if (checkVal("#m_pw")){
  			alert("비밀번호를 입력해 주세요.");
  			$("#m_pw").focus();
  		}else if (checkVal("#m_repw")){
  			alert("비밀번호 확인을 입력해 주세요.");
  			$("#m_repw").focus();
  		} else if($("#m_pw").val() != $("#m_repw").val()){
  			alert("비밀번호 확인이 일치하지 않습니다.");
  			$("#m_pw").val("");
  			$("#m_repw").val("");
  			$("#m_repw").focus();
  		} else if (checkVal("#phone")){
  			alert("휴대폰번호를 입력해 주세요.");
  			$("#phone").focus();
  		}  else if (checkVal("#email")){
  			alert("이메일을 입력해 주세요.");
  			$("#email").focus();
  		}  else if (checkVal("#cm_postcode")){
  			alert("우편번호를 입력해 주세요.");
  			$("#cm_postcode").focus();
  		}  else if (checkVal("#cm_address")){
  			alert("주소를 입력해 주세요.");
  			$("#cm_address").focus();
  		}  else if (checkVal("#cm_detailAddress")){
  			alert("상세주소를 입력해 주세요.");
  			$("#cm_detailAddress").focus();
  		}else if($("#checkId").val() == "false") {
			alert("아이디 중복 체크를 해주세요.");
			$("#m_id").focus();
  		}else if($("#checknick").val() == "false") {
			alert("닉네임 중복 체크를 해주세요.");
			$("#nick_nm").focus();
  		}else {
  			console.log("aaa");
			$("#addForm").submit();
		}
  	});
});
  function checkVal(sel){
  	if($.trim($(sel).val()) == ""){
  		return true;
  	} else {
  		return false;
  	}
  }
    
  $("input:radio[name='vec']:radio[value='y']").attr("checked",true); 
  $("input:radio[name='vec']").removeAttr("checked");
	  
  </script>
</head>

<body>
  <!-- partial:index.partial.html -->
  <div class="box-form">
    <div class="left">
      <div class="overlay">
        <h1>Coronagram</h1>
        <p>이곳은 회원가입 페이지 입니다.<br> 정보를 입력하시고 가입버튼을 눌러주세요.</p>
      </div>
    </div>
    <div class="right">
      
        <div class="inputs">
        <form action="mAdds" id="addForm" method="post">
	      <input type="hidden" id="checkId" value="false" />
	      <input type="hidden" id="checknick" value="false" />
	      <input type="hidden" id="crngSet" name="crngSet" value="${last.LAST_NUMBER}">
	      
          <p class="r_title"><b>Sign Up</b></p>
          
          <span class="title_Name">아이디</span><br>
          <input type="text" id="m_id" name="m_id" placeholder="아이디를 입력하세요">
          	<p id="check" class="checkSpan"></p><br/>
          
          <span class="title_Name">이름</span><br>
          <input type="text" id="m_nm" name="m_nm" placeholder="이름을 입력하세요"><br>
          
          <span class="title_Name">닉네임</span><br>
          <input type="text" id="nick_nm" name="nick_nm" placeholder="닉네임을 입력하세요"><br>
          	<p id="checkNc" class="checkSpan"></p><br/>
          
          <span class="title_Name">패스워드</span><br>
          <input type="password" id="m_pw" name="m_pw" placeholder="패스워드를 입력하세요"><br>
          
          <span class="title_Name">패스워드 확인</span><br>
          <input type="password" id="m_repw" name="m_repw" placeholder="패스워드를 확인하세요"><br>
          
          <span class="title_Name">휴대폰 번호</span><br>
          <input type="text" id="phone" name="phone" placeholder="번호를 입력하세요"><br>
          
          <span class="title_Name">이메일</span><br>
          <input type="email" id="email" name="email" placeholder="이메일을 입력하세요"><br>
          
          백신 접종 여부 <input type="radio" id="vac_y" name="vec" value="y" checked> 예
      	  <input type="radio" id="vac_n" name="vec" value="n"> 아니오<br>

          <div class="birth">
            <span>생년월일</span><br>   
            <div id="m_bdt" >
	            <select name="yy" id="year"></select> 년
	            <select name="mm" id="month"></select>월
	            <select name="dd" id="day"></select>일<br>
	        </div>
            <span class="title_Name">주소</span><br>
            
            <input type="text" id="cm_postcode" name="cm_postcode" class="post_num" placeholder="우편번호">
            <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
            <input type="text" id="cm_address" name="adr" placeholder="주소"><br>
            <input type="text" id="cm_detailAddress" name="dtl_adr"  placeholder="상세주소"><br>  
          </div>
          </form>
          
          <button id="add_btn" class="add_btn">가입</button>
          <button id="cancel_btn" class="cancel_btn">취소</button>
        </div>
        
      
      <br>
    </div>
  </div>
  <!-- partial -->
  <script src="resources/script/sign_up/sign_up.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>
function cm_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("cm_detailAddress").value = extraAddr;
            
            } else {
                document.getElementById("cm_detailAddress").value = '';
            }

            document.getElementById('cm_postcode').value = data.zonecode;
            document.getElementById("cm_address").value = addr;
            document.getElementById("cm_detailAddress").focus();
        } 
    }).open();
}
</script>  
</body>


</html>