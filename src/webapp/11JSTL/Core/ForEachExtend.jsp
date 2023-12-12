<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachExtend.jsp</title>
</head>
<body>
	<h4>향상된 for문을 ForEach로 구현하기</h4>

	<%
	String[] rgba = { "Red", "Green", "Blue", "Black" };

	/*
	<c:forEach begin="1" end="3" step="1" var="i">
	varStatus 사용 가능 ->rgba를 향상된 for문 형식으로 varStatus를 출력해보세용

	*/
	%>


	<c:forEach items="<%=rgba%>" var="c">
		<span style="color:${c};">${c}</span>
	</c:forEach>

	<h4>varStatus 속성</h4>
	<!-- 반복문의 형태값을 알 수 있음 -->
	<table border="1">
		<c:forEach items="<%=rgba%>" var="c" varStatus="loop">
			<tr>
				<td>count : ${loop.count }</td>
				<td>index : ${loop.index }</td>
				<td>current : ${loop.current }</td>
				<td>first : ${loop.first }</td>
				<td>last : ${loop.last }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>