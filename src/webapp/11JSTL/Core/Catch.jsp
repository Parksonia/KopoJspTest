<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*  
에러 발생 시,  에러 내용이 변수명에 저장되게됨
<c:catch var="변수명">
 process code
</c:catch>

*/


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catch.jsp</title>
</head>
<body>

<h4>예외 코드 생성</h4>
<%
int num = 100;

%>
<c:catch var="eMsg">

<%
int res = num/ 0;
%>
</c:catch>
예외내용 : ${eMsg}

<h4>EL에서 예외</h4>

<c:set var="hum" value = "200" />
<c:catch var="eMsg">
${"일" + hum}
</c:catch>

예외내용 : ${eMsg}

</body>
</html>