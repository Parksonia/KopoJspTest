<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces = "true"   
    %>   <!--trimDirectiveWhitespaces 공백제거   -->
<%@ page import="java.text.SimpleDateFormat"%>  <!--필요한 외부 클래스 임포트 :날짜 가져오기-->
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - import 속성</title>
</head>
<body>
<%

Date today = new Date();  // 외부 클래스 생성 객체생성 (외부클래스 import 필수)
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //포맷정해주기
String todayStr = dateFormat.format(today);
out.println("오늘 날짜 : " + todayStr);  // 오늘 날짜를 웹 브라우저에 출력
%>
</body>
</html>