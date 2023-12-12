<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "utils.JSFunction"%>

<%
if(session.getAttribute("UserId") == null) {
	JSFunction.alertLocation("로그인 후 이용해주세요", "../06Session/LoginForm.jsp",out);

	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IsLoggedIn.jsp</title>
</head>
<body>
</body>
</html>