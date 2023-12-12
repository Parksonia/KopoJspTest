<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/*
fmt:setLocale - 국가별로 다른 통화기호,날짜 표현할 때 사용
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fmt3.jsp</title>
</head>
<body>
<h4>로케일 설정</h4>

	<c:set var="today" value="<%=new java.util.Date()%>" />
	
	
	한글로 설정 :<f:setLocale value="ko_kr"/>
	<f:formatNumber value="10000" type="currency" /><br />
	<f:formatDate value="${today}"/><br />
	
	일어로 설정 :<f:setLocale value="ja_JP"/>
	<f:formatNumber value="10000" type="currency" /><br />
	<f:formatDate value="${today}"/><br />
	
	영어로 설정 :<f:setLocale value="en_US"/>
	<f:formatNumber value="10000" type="currency" /><br />
	<f:formatDate value="${today}"/><br />


</body>
</html>