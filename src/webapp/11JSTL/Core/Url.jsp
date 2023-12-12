<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/*

<c:url> 태그 : addr 을 생성해주는 태그 + 컨텍스트 루트를 포함한 URL주소를 생성해줌
<a> -> href, <form> -> <action> 에 활용 가능

<c:url value="path" scope="scope">

<c:url value="path" scope="scope" var="변수명">
${변수명}

*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Url.jsp</title>
</head>
<body>

<h4>url 태그로 링크를 생성</h4>
	<c:url value="../Inc/OtherPage.jsp" var="url">
		<c:param name="user_param1" value="분당융복합" />
		<c:param name="user_param2">유클릭반</c:param>
	
	</c:url>
	<a href="${url}">otherpage 바로가기</a>

</body>
</html>