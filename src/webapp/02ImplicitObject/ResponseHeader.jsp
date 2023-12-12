<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime(); 
java.sql.Date date2 = new java.sql.Date(add_date); 
System.out.println(date2);
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");
// 응답 헤더에 값 추가
response.addDateHeader("myBirthday", add_date); // 받는쪽에서 responese 내장객체를 이용해서 추가 시킴 (보낸곳에서 보내지 않았다)
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004); // 추가
response.addHeader("myName", add_str); // myname =value: 홍길동을
response.setHeader("myName", "안중근");  // set으로 수정 홍길동 ->안중근
%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>응답 헤더 정보 출력하기</h2>
    <%
    Collection<String> headerNames = response.getHeaderNames();
    for (String hName : headerNames) {              //헤더의 특징 add로 추가 되어도 첫번째 값만 출력되게 됨(set으로 변경은 가능) 
        String hValue = response.getHeader(hName); 
    %>
        <li><%= hName %> : <%= hValue %></li> <!-- <li>리스트 형식으로 출력되게 됨 -->
    <%
    }   
    %>

    <h2>myNumber만 출력하기</h2>
    <%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li>myNumber : <%= myNum %></li>  <!-- <li>리스트 형식으로 출력되게 됨 -->
	<%
	}
	%>
</body>
</html>