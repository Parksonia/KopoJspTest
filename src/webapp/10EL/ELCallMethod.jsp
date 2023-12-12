
<%@ page import = "el.MyElClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MyElClass myClass = new MyElClass();
pageContext.setAttribute("myClass", myClass);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELCallMethod.jsp</title>
</head>
<body>

<h2>내장객체에 저장된 함수 불러오기</h2>

651212-4874514 => ${myClass.getGender("651212-4874514")} <br />
651212-1874514 => ${myClass.getGender("651212-1874514")} <br />

651212-1874514 => ${MyElClass.showGugudan(3)} <br />

</body>
</html>