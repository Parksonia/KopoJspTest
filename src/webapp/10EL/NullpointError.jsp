<%@ page import ="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// int i =1;  이렇게 쓸 수 없다
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num1", 10);

pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());

%>

<html>
<head>
<meta charset="UTF-8">
<title>NullPointerError.jsp</title>
</head>
<body>
<h3>empty 연산자</h3>
empty nullStr : ${empty nullStr } <br/>
empty emptyStr : ${empty emptyStr } <br/>
empty lengthZero : ${empty lengthZero } <br/>
empty sizeZero : ${empty sizeZero } 



<h3>null 연산자</h3>

null + 10 : ${null + 10 } <br/>
nullStr + 10 : ${nullStr + 10 } <br/>
param.emptyVal > 10 : ${ param.emptyVal > 10}  <!-- 에러가 아닌 null로 인식 되어 연산됨 -->
</body>
</html>