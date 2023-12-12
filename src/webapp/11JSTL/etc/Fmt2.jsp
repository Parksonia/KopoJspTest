<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/*  
<f:formatDate>,<f:timeZone>
<f:formatDate value="출력날짜" type="양식" var="변수"
				dateStyle="날짜스타일" timeStyle="시간스타일" pattern="날짜패턴" scope="영역">

*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fmt2.jsp</title>
</head>
<body>

<c:set var="today" value= "<%=new java.util.Date()%>" />

<h4>날짜포맷</h4>
full: <f:formatDate value="${today}" type="date" dateStyle="full"/> <br/>
short: <f:formatDate value="${today}" type="date" dateStyle="short"/> <br/>
medium:<f:formatDate value="${today}" type="date" dateStyle="medium"/> <br/>
long: <f:formatDate value="${today}" type="date" dateStyle="long"/> <br/>
default: <f:formatDate value="${today}" type="date" dateStyle="default"/> <br/>


<h4>시간포맷</h4>
full: <f:formatDate value="${today}" type="time" timeStyle="full"/> <br/>
short: <f:formatDate value="${today}" type="time" timeStyle="short"/> <br/>
medium: <f:formatDate value="${today}" type="time" timeStyle="medium"/> <br/>
long: <f:formatDate value="${today}" type="time" timeStyle="long"/> <br/>
default: <f:formatDate value="${today}" type="time" timeStyle="default"/> <br/>

<h4>시간,날짜 동시 출력</h4>
<f:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
<br/>
<f:formatDate value="${today}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>


<h4>타임존</h4>
<f:timeZone value="GMT" > <!--그리니치표준(세계 협정 시간),한국보다 9시간 빠름 -->
	<f:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br/>

</f:timeZone>

<f:timeZone value="America/Chicago" > <!--특정지역의 시간으로도 설정가능 -->
	<f:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br/>
	</f:timeZone>
</body>
</html>