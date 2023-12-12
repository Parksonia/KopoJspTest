<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include Page</title>
</head>
<body>


<%
//Person p =new Person();
int pPageInt2 = (Integer)pageContext.getAttribute("pageInt"); //auto Unboxing 됨
String pPageString2 = pageContext.getAttribute("pageStr").toString();
Person pPagePerson2 =(Person)(pageContext.getAttribute("pagePerson"));
%>

<ul>
	<li>Integer Obj = <%=pPageInt2 %> </li>
	<li>String Obj = <%=pPageString2 %> </li>
	<li>Person Obj = <%=pPagePerson2.getName() %>,<%=pPagePerson2.getAge() %></li>
</ul>
</body>
</html>