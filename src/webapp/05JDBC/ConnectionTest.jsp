<%@ page import ="common.DBConnPool" %>
<%@ page import ="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결 테스트</title>
</head>
<body>


<h2> JDBC TEST1 </h2>

<%

JDBConnect jdbc1 = new JDBConnect();  // 접속시도

jdbc1.close();  // 해제 시도 
%>


<h2> JDBC TEST2 </h2>

<%
String driver = application.getInitParameter("OracleDriver");  // 내장객체 이용하여 접근 
String url = application.getInitParameter("OracleURL");
String id = application.getInitParameter("OracleId");
String pwd = application.getInitParameter("OraclePwd");

JDBConnect jdbc2 = new JDBConnect(driver,url,id,pwd);  //접속 시도 
jdbc2.close();   // 해제시도

%>


<h2> JDBC TEST3 </h2>

<%

JDBConnect jdbc3 = new JDBConnect(application);  //접속 시도(어플리케이션에 권한을 넘겨준 방식) 
jdbc3.close();   // 해제시도

%>

<h2> JDBC TEST4 </h2>

<%
// 커넥션 풀 사용한 연결 방법 
DBConnPool jdbc4 = new DBConnPool();  //접속 시도 
jdbc4.close();   // 해제시도

%>
</body>
</html>