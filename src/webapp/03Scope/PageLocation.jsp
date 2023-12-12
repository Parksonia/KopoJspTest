<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 영역</title>
</head>
<body>

<h2>페이지 이동 후 page 영역의 값 읽기</h2>

<%
//페이지가 넘어가는 순간 값이 없어짐!!!!!!!!!!!!!!!!!!!!!!
Object pPageInt = pageContext.getAttribute("pageInt") ; //auto Unboxing 됨
Object pPageString = pageContext.getAttribute("pageStr");
Object pPagePerson =(Person)pageContext.getAttribute("pagePerson");
%>

<ul>
		
	<li>Integer Obj = <%=(pPageInt ==null) ? "값 없음" : pPageInt %> </li>
	<li>String Obj = <%=(pPageString == null) ?  "값 없음" : pPageString %> </li>
	<li>Person Obj = <%=(pPagePerson == null) ? "값 없음" : ((Person)pPagePerson).getName() %></li>
</ul>
</body>
</html>