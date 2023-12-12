<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%Person pPerson = (Person)request.getAttribute("requestPerson");%>

<ul>
	<li>String requestStr : <%=request.getAttribute("requestStr")%></li> 
	<li>Person requestPerson  :<%=pPerson.getName()%>,<%=pPerson.getAge()%> </li>
</ul>

<% 
//get 방식으로 데이터 보낸 것 받아서 출력

request.setCharacterEncoding("UTF-8");
out.println(request.getParameter("param1"));
out.println(request.getParameter("param2"));
%>

</body>
</html>