<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//팝업창 컨트롤 변수
String popupMode = "on"; 
//들어온 쿠키 확인 
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie c: cookies){
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		if(cookieName.equals("PopupMode")){
			popupMode = cookieVal;  //off로 바뀌게 됨 
		}
	}
}
//쿠키 만들어서 보내기 (이미 쿠키가 있다면 무시)

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키로 팝업창 관리하기</title>
<style>
div#popup {
	position: absolute;
	top: 100px;
	left: 50px;
	color: yellow;
	width: 270px;
	height: 100px;
	background-color: gray;
}

div#popup>div {
	position: relative;
	background-color: #ffffff;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">


$(function() {
    $('#closeBtn').click(function() { // #-> id
        $('#popup').hide();
    
    //체크박스에 체크가 됐는지 확인
    var chkVal = $("input : checkbox [id=inactiveToday]: checked").val();
    
    //ajax() 함수 비동기 처리
    $.ajax({
    	url : './PopupCookie.jsp',
    	type : 'get',
    	data : {inactiveToday : chkVal},
    	dataType : "text",
    	success : function(resData){
    		if(resData != '') location.reload();
    		
    	}
    });
       
    });
});
</script>

</head>

<body>
	<h2>팝업 메인 페이지(ver 0.1)</h2>
	<%
    for (int i = 1 ; i <= 10 ; i++) { 
        out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    }
    if (popupMode.equals("on")) { // 팝업창 컨트롤 변수 
%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1" /> 하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
	<%
    }//off인경우 팝업창 뜨지 않음 
%>
	<%


%>

</body>
</html>