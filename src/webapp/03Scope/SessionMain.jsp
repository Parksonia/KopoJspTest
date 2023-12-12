<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String> lists = new ArrayList<String>();// 리스트 생성
lists.add("리스트"); // 리스트에 추가
lists.add("컬렉션");
session.setAttribute("lists", lists);  // session에 리스트에 저장한 데이터 저장
%>       
<html>
<!--Session 클라이언트가 닫을 때 까지 데이터 공유됨(웹을 닫을 때 까지)  -->
<head><title>session scope</title></head>
<body>

    <h2>페이지 이동 후 session 영역 확인</h2>
    <a href="SessionLocation.jsp">SessionLocation page로 이동</a>

</body>
</html>