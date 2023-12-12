<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*

<c:forEach var="변수명" begin="시작값" end="마지막" step="증감" />
		== for(int number :numbers) ->변형for문
		== for(int i ; i<100; i++)	 ->기본형	for문	
		varStatus =루프의 현재 상태를 알려주는 변수를 지정		
	current,index,count,first,last =>속성들		
		
*/
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachNormal.jsp</title>
</head>
<body>
	<h4>일반적인 for문 형태의 forEach</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${i}입니다.
	</c:forEach>


	<h4>varStatus 속성</h4>
	<table border="1">
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<tr>
				<td>count : ${loop.count }</td>
				<td>index : ${loop.index }</td>
				<td>current : ${loop.current }</td>
				<td>first : ${loop.first }</td>
				<td>last : ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>

	<h4>1~100까지 홀수의 합 구하기</h4>


	
 	<c:forEach begin="1" end="100" step="2" var="i">
		<c:set var="sum" value="${sum + i}" />		
	</c:forEach>

  	sum = ${sum } 
	
<% 
/* 	<c:forEach begin="1" end="100" var="j">
	
	<c:if test="${j mod 2 ne 0 }">
		<c:set var="sum" value="${sum+j }" />
	</c:if>
	</c:forEach>
	
	  sum = ${sum } */
	 
	  %> 

</body>
</html>