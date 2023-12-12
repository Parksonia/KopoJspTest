<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>  
<%@ page import ="java.util.* " %>   
<%
// 날짜 표시 형식
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
// 최초 세션 요청 시각 생성
long createTime = session.getCreationTime();
String creationTimeStr =dateFormat.format(new Date(createTime));

//마지막 요청 시간
long lastTime =session.getLastAccessedTime();
String lastTimeStr =dateFormat.format(new Date(lastTime));

//jsp에서 세션 시간 설정(단위:초)
//session.setMaxInactiveInterval(1800); 

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 시간 확인</title>
</head>
<body>


<h2>설정값 확인</h2>
<ul>
	<li>세션 유지 시간 : <%=session.getMaxInactiveInterval()%> </li>
	<li>세션 아이디 : <%=session.getId() %> </li>
	<li>세션 요청 시각 : <%=creationTimeStr%> </li>
	<li>마지막 요청 시각 : <%=lastTimeStr%> </li>
</ul>

</body>
</html>