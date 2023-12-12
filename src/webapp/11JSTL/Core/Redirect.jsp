<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*
response.sendredirect 와 유사 
<c:redirect url="이동할 페이지 경로 or URL">
param ? -ok ( < c:param >)  redirect 에서도 param 으로 값 보낼 수 있음

*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect.jsp</title>
</head>
<body>

	<c:set var="requestVar" value="kopo" scope="request" /> 
	<!-- redirect는 request영역 공유 안됨 -->
	<c:redirect url="../Inc/OtherPage.jsp">

		<c:param name="user_param1" value="내 주 언어"></c:param>
		<c:param name="user_param2" value="java"></c:param>

	</c:redirect>
</body>
</html>