<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>web.xml 에서 매핑한 값 출력</h2>

<p>
	<string><%=request.getAttribute("message") %></string>
	<br/>
	<a href="./HelloServlet.do">바로가기</a>
</body>
</html>