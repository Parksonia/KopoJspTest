<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session login</title>
</head>
<body>
<!-- 헤드라인에 include 하기(jsp:include=>액션태그) ->공통 링크 적용 -->
<jsp:include page="../Common/Link.jsp" />
<h2>로그인 페이지</h2>
	
	<span style="color : red; font-size:1.2em;">
	<%=request.getAttribute("LoginErrMsg") == null ? // null 이면 아무것도 안보여주고 null 아니면 에러메세지 보임  
			"" : request.getAttribute("LoginErrMsg")%>
	</span>
<%
//로그인 상태 확인
if(session.getAttribute("UserId") == null ){
%>	
	
<script>

function validateForm(form){
	if(!form.user_id.value) {
		alert("아이디를 입력하세요.");
		return false;
	}
	if(form.user_pw.value ==""){
		alert("패스워드를 입력해주세요");
		return false;
	}
}

</script>

<form action ="LoginProcess.jsp" method =post name ="loginForm"
		onsumit ="return validateForm(this);">
<table>
<tr>
	<td>아이디 : </td><td><input type ="text" name ="user_id" /></td></tr>
	<tr><td>패스워드 :</td><td><input type = "text" name ="user_pw" /></td>
</tr>
</table>
<input type ="submit" value ="로그인">

<%
}else{ %>	
<%=session.getAttribute("UserName")%> 회원님 로그인하셨습니다. <br />
<a href ="Logout.jsp">[로그아웃]</a>
<%
}
%>
</form>

</body>
</html>