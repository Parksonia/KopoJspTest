<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

pageContext.setAttribute("scopeVal","페이지영역");
request.setAttribute("scopeVal", "리퀘스트영역");
session.setAttribute("scopeVal", "세션영역");
application.setAttribute("scopeVal", "애플리케이션영역");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내장객체 EL 표현</h2>
<h3>영역별 저장값 읽기</h3>

<ul>
	<li>페이지영역 : ${pageScope.scopeVal}</li>
	<li>페이지영역 : ${requestScope.scopeVal}</li>
	<li>페이지영역 : ${sessionScope.scopeVal}</li>
	<li>페이지영역 : ${applicationScope.scopeVal}</li>
</ul>

<h3>영역의 우선권은 누구?</h3>
	<li> ${scopeVal }</li>	
	<!-- 주석처리해야 출력됨 포워드를 하는 순간 소멸되니까! -->
<jsp:foward page="ImplicitForwardResult.jsp" /> 
</body> 
</html>