
<%@ page import ="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
CookieManager.makeCookie(response,"ELCookie","ELTEST",10);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OtherImplicitObj.jsp</title>
</head>
<body>
<h2>쿠키값 읽기</h2>
<li>ELCookie 값 : ${cookie.ELCookie.value}</li>

<h2>헤더 읽기</h2>
<ul>
	<li>host : ${header.host}</li>
	<li>user-agent: ${header.user-agent}</li> <!-- 하이픈(-)때문에 제대로 출력 안됨 -->
	<li>user-agent: ${header['user-agent']}</li> 
	<li>cookie : ${header.cookie}</li> <br />

</ul>
</body>
</html>