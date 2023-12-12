<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObejectParams.jsp</title>
</head>
<body>
<%
request.setAttribute("personObj", new Person("심사임당",22));
request.setAttribute("stringObj", "문자열");
request.setAttribute("integerObj", new Integer(11));
%>


<jsp:forward page ="ObjectResult.jsp">
	<jsp:param value="10" name="firstNum" />
	<jsp:param value="20" name="secondNum" />
</jsp:forward>>
</body>
</html>