<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - Response</title></head>
<body>
<%

String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd"); 
if (id.equalsIgnoreCase("psy") && pwd.equalsIgnoreCase("1234")) { // IgnoreCase 대소문자 구분 안함 그냥 equals 대소문자 구분함
    response.sendRedirect("ResponseWelcome.jsp");  // 로그인 성공 시 화면 이동시킴 sendRedirect
}
else {
    request.getRequestDispatcher("ResponseMain.jsp?loginErr=1") //로그인 실패 시  쿼리스트링=> 변수명 loginErr value =1를 넘겨줌 
       .forward(request, response);   //forward ->화면 전환 시 흐름만 전달,담아서 전달,,,? ???????
}
%>
</body>
</html>