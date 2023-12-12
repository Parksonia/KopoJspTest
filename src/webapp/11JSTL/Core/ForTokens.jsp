<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*
<c:forTokens> java에서 StringTokenizer 클래스 처럼 활용

ex)"안녕, 나는, 김하온이야, 내 취미는,그림그리기" ->forTokens로 split하고 배열처럼 활용 가능

'-'기호는 제외하고 작성해주세요 <- 자동 하이픈 제거 event 
ex)"010-1111-2222", "01011112222" 

<c:forTokens items = "문자열" delims="구분자" var="변수명"  />
*/

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForTokens.jsp</title>
</head>
<body>
<%
String rgba = "Red,Green,Blue,Black";
%>

<h4>forTokens 활용</h4>

<c:forTokens items="<%=rgba%>" delims="," var="color"> <!-- 구분자로 Split-->
	<span style="color:${color};">${color}</span><br />
</c:forTokens>

</body>
</html>