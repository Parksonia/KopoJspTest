<%@ page import ="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String loginId = CookieManager.readCookie(request, "loginId");  // 이미 쿠키에 loginId(name)의 기록이 있을 수 있으니까

String cookieCheck ="";

if(!loginId.equals("")){  // 이미 loginId name의  쿠키값이 존재함 
	cookieCheck ="checked";  // checkbox-> checked 됨 
}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키로 아이디 저장하기</title>
</head>
<body>

<h2>로그인 페이지</h2>
<form action ="IdSaveProcess.jsp" method ="post">


아이디 : <input type ='text' name ="user_id" value ="<%=loginId%>" />
아이디저장<input type ="checkbox" name ="save_check" value ="Y" <%=cookieCheck%> />
<br />
패스워드 : <input type ="text" name ="user_pw" />
<br />
<input type ="submit" value ="로그인">
</form>
</body>
</html>