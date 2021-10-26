<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/admin_coinfo/admin_coinfo.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src = "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});

	$("#cancelBtn").on("click",function(){
		$("#backForm").submit();
	});
	
	$("#updateForm").on("keypress","input",function(event){
		if(event.keyCode==13){
			return false;
		}
	});
	
/* 	$("#imgBtn").on("click",function(){
		$("#imgAtt").click();
	});
 */
	$("#imgAtt").on("change",function(){
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+1));
		var imgForm = $("#imgForm");
		imgForm.ajaxForm({
				success:function(res){
				if(res.result=="SUCCESS"){
					if(res.fileName.length > 0){
						$("#imgFile").val(res.fileName[0]);
						var imgRep = res.fileName[0].replace('[', '%5B').replace(']', '%5D');
						//$("#preView").attr("src", "resources/upload/"+imgRep);
						$("#image").html("<img src=\"resources/upload/"+imgRep+"\" id=\"prevImg"+"\">");
					}
				}else{
					alert("파일 업로드에 실패하였습니다.");
				}
			},
			error:function(req,status,error){
				console.log(error);
				alert("파일 업로드중 문제가 발생하였습니다.");
			}
		});					
		imgForm.submit();
	});
	
	//첨부 파일 버튼
	   $("#fileBtn").on("click",function(){
		      $("#imgAtt").click();
	});
	
	//첨부파일 삭제 버튼
	$("#imgDelBtn").on("click", function(){
	   $("#fileName").html(""); 
	   $("#imgFile").html("");
	   $("#imgFile").val("");
	   $("#fileBtn").attr("class","");
	   $("#image").html("");
	   $("#images").val("");
	   $(this).remove();
	});
	
	
	
	$("#updateBtn").on("click",function(){	
		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if(checkVal("#info_title")){
			alert("제목을 입력해 주세요");
			$("#info_title").focus();
		}
		else if(checkVal("#info_subhd")){
			alert("소제목을 입력해 주세요");
			$("#info_subhd").focus();
		}
		else if(checkVal("#con")){
			alert("내용을 입력해 주세요");
			$("#con").focus();
		}
		else{
			updateAjax();
		}
	});
});


function updateAjax(){
	//Ajax
	var params = $("#updateForm").serialize();

	$.ajax({
		url : "adminCoinfoUpdAjax",
		type : "post",
		dataType : "json",
		data : params,
		success : function(res){
			if(res.result == "success"){
				$("#updateForm").attr("action","admin_coinfo_list");
				$("#updateForm").submit();
			} else if(res.result == "failed"){
				alert("수정에 실패하였습니다.");
			} else {
				alert("수정중 문제가 발생했습니다.");
			}
		},
		error : function(request, status, error){
			console.log(error);
		}
	});
}



function checkVal(sel){
	if($.trim($(sel).val())==""){
		return true;
	}
	else{
		return false;
	}
}
	
	</script>
</head>

<body>
	<header>
		 <div class="cm_menuBar" id="cm_menuBar">
                <div class="cm_menu__toggler"><span></span></div>
                <a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
                <a href="#" class="cm_home" id="cm_home">Home</a>
                <a href="#" class="cm_msg" id="cm_msg">Message</a>
                <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
                <div class="cm_dropdown">
                    <a class="cm_dropbtn cm_dot" id="cm_dot"></a>
                    <ul class="cm_dropdown-content">
                        <li>
                            <a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
                        </li>
                        <li>
                            <a href="edit_profile" class="cm_userinfo">개인정보수정</a>
                        </li>
                    </div>
                    <div class="cm_user_name">
						<c:if test="${!empty sMNo}">
							${sMNm}님 어서오세요.
						</c:if>
					</div>
                </div>
        <div class="cm_menu" id="cm_menu">
            <a href="#" class="cm_mLogo">Coronagram</a>
            <a href="#" class="cm_mTitle" id="cm_mTitle">
                <div class="cm_map"></div> Corona Map
                <ul class="cm_mcon" id="cm_mcon">
                    <a href="#">국내</a> <br>
                    <a href="#">해외</a>
                </ul>
            </a>
            <a href="#" class="cm_mTitle" id="cm_mTitle">
                <div class="cm_info"></div>Corona Info
                <ul class="cm_mcon" id="cm_mcon">
                    <a href="#">관련 정보</a> <br>
                    <a href="#">거리두기</a> <br>
                    <a href="#">News</a>
                </ul>
            </a>
            <a href="#" class="cm_sTitle">
                <div class="cm_cam"></div>Coronagram
            </a>
            <a href="#" class="cm_mTitle" id="cm_mTitle">
                <div class="cm_user"></div>My Page
                <ul class="cm_mcon" id="cm_mcon">
                    <a href="#">개인 페이지</a> <br>
                    <a href="#">출석 체크</a> <br>
                    <a href="#">Message</a>
                </ul>
            </a>
            <a href="#" class="cm_mTitle" id="cm_mTitle">
                <div class="cm_qna"></div>Service Center
                <ul class="cm_mcon" id="cm_mcon">
                    <a href="#">FAQ</a> <br>
                    <a href="#">Q&A</a>
                </ul>
            </a>
        </div>
	</header>




	<main>
        <div class="sc">
            <div class="scHead">
                <div>
                    <h4>관리자 페이지</h4>
                </div>
                <div>
                    <h2><p>코로나 정보 게시판</p></h2>
                </div>
            </div>
            <div>
                <div class="sc-html">
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked>
                    <label for="tab-1" class="tab">코로나 정보 관리</label>
                    <input id="tab-2" type="radio" name="tab" class="scm2">
                    <label for="tab-2" class="tab">단계 변경</label>
                    <div class="sc-form">
                        <div class="scm1-htm">
                            <label for="user" class="sclabel">
                                <p>코로나 관련 정보 관리</p>
                            </label>
                            <div class="group">
                            	<form id="imgForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
								<input type="file" name="imgAtt" id="imgAtt" accept="image/*" >
							</form>
							<form action="admin_coinfo_dtl" id="backForm" method="post">
								<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
								<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" value="${param.page}" />
								<input type="hidden" name="no" value="${param.INFO_NO}" />
							</form>
							
                            	<form action="#" id="updateForm" method="post">
                            	<input type="hidden" name="imgFile" id="imgFile" value="${data.REP_IMG}">
                            	<input type="hidden" name="m_no" value="${sMNo}">
                            	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
								<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" value="${param.page}" />
                            		<input type="hidden" name="no" value="${param.no}" />
	                                <div class="qnaTitle">
	                                    <div class="qnaTitle1">
	                                        <span>제목</span><input type="text" class="border" id="info_title" name="info_title" value="${data.INFO_TITLE}">
	                                    </div>
	                                    <div class="qnaTitle2">
	                                        <span>소제목</span><input type="text" class="border" id="info_subhd" name="info_subhd" value="${data.INFO_SUBHD}">
	                                    </div>
	                               	 </div>
	                              	 <div class="qnaMain">
	                                    <div class="qnaCon">
	                                        <p>내용</p><textarea class="QCI" type="text" id="con" name="con">${data.CON}</textarea>
	                                    </div>
	                                    		<c:choose>
													<c:when test="${!empty data.REP_IMG}">
														<!-- 첨부파일이 있는경우 버튼을 숨긴다. -->
														<input type="button" value="이미지파일선택" id="fileBtn" class="hide_Btn" />
													</c:when>
													<c:otherwise>
														<input type="button" value="이미지파일선택" id="fileBtn" />
													</c:otherwise>
												</c:choose>
												
												<c:set var="len" value="${fn:length(data.REP_IMG)}"></c:set>
												
												<span id="fileName">${fn:substring(data.REP_IMG, 20, len)}</span>
												
												<c:choose>
													<c:when test="${empty data.REP_IMG}">
														<input type="button" value="이미지파일삭제" id="imgDelBtn"
															class="hide_Btn" />
													</c:when>
													<c:otherwise>
														<input type="button" value="이미지파일삭제" id="imgDelBtn" />
													</c:otherwise>
												</c:choose>
												
												
												
												<div id="image">
													<img name="images" id="images"
														src="resources/upload/${fn:replace(fn:replace(data.REP_IMG, '[', '%5B'), ']', '%5D')}"
														onerror="this.style.display='none'" />
												</div>
	                                    
	                                    
	                                    
	                                    
	<%--                                     <div class="qnaImg">
											<span>이미지</span><input type="button" value="file" class="fileBtn" id="imgBtn" />
											<span id="fileName"></span>		
											<input type="hidden" name="imgFile" id="imgFile">							
										   <div id="preView">
										      <img src="resources/upload/${fn:replace(fn:replace(data.REP_IMG, '[', '%5B'), ']', '%5D')}" onerror="this.style.display='none'" />
										   </div>
										</div> --%>
										
										
	                              	  </div>
	                               </form>
                                <div class="qnaBtn">
                                 	<input type="button" id="updateBtn" class="qnaBtn1" value="수정" />
                                 	<input type="button" id="cancelBtn" class="qnaBtn2" value="취소" />
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="scm2-htm">
                            <label for="user" class="sclabel">
                                <p>거리두기 정보 단계 관리</p>
                            </label>
                            <div class="group">
                                <div class="qnaMain">
                                    <div class="QnaTitle" id="">
                                        <div>
                                            <span>지역</span>
                                            <select  name="dropbox" class="dbox">
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                                <option value="서울">서울</option>
                                            </select>
                                        </div>
                                        <div>
                                            <span>단계 &nbsp;</span><input class="border" type="text" placeholder="내용을 입력하세요">
                                        </div>
                                    </div>
                                    <div class="qnaMain">
                                        <div>
                                            <p>내용</p><textarea class="QCI" class="border" type="text" placeholder="내용을 입력하세요"></textarea>
                                        </div>
	                                    <div class="qnaBtn">
                                    		<input type="button" id="updateBtnStep" class="qnaBtn1" value="저장" />
                                    		<input type="button" id="cancelBtnStep" class="qnaBtn2" value="취소" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- sc-form -->
                    </div><!-- sc-html -->
                </div> <!-- sc-form -->
            </div>
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>