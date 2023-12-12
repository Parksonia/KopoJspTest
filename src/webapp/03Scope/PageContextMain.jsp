<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>

<%
pageContext.setAttribute("pageInt", 10);  // 페이지 영역에 속성(attribute) 저장
pageContext.setAttribute("pageStr", "페이지저장");
pageContext.setAttribute("pagePerson", new Person("kopo",50));
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
<h2>page값 가져와 출력하기</h2>

<%
//Person p =new Person();
int pPageInt = (Integer)pageContext.getAttribute("pageInt"); //auto Unboxing 됨
String pPageString = pageContext.getAttribute("pageStr").toString();
Person pPagePerson =(Person)(pageContext.getAttribute("pagePerson"));
%>

<ul>
	<li>Integer Obj = <%=pPageInt %> </li>
	<li>String Obj = <%=pPageString %> </li>
	<li>Person Obj = <%=pPagePerson.getName() %>,<%=pPagePerson.getAge() %></li>
</ul>
<h2>include된 페이지에서 출력값 확인</h2>
<%@ include file = "PageInclude.jsp" %>

<h2>단순 페이지 이동 후 pageContext 데이터 확인</h2>

	<a href ="PageLocation.jsp">PageLocation.jsp바로가기 </a>

</body>
</html>