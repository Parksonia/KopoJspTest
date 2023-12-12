<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - request</title></head>
<body>
<%
request.setCharacterEncoding("UTF-8");  
String id = request.getParameter("id");  
String sex = request.getParameter("sex");  //radiobox는 중복 선택 불가 한 개만 선택 가능하기때문에 requestParmeter로 받아 올 수 있다.
String[] favo = request.getParameterValues("favo");  // checkbox 중복 선택 가능하기떄문에 requestValues로 받아 배열에저장   
String favoStr = "";
if (favo != null) {     
    for (int i = 0; i < favo.length; i++) {
        favoStr += favo[i] + " ";    // checkbox 아무것도 선택 안하면 "" 빈칸 출력 
    }
}

String intro = request.getParameter("intro").replace("\r\n", "<br/>");  //캐리지 리턴을 -><br>로 변경해줌 (한줄띄기를 인식해줌)
%>
<ul>
    <li>아이디 : <%= id %></li>
    <li>성별 : <%= sex %></li>
    <li>관심사항 : <%= favoStr %></li>
    <li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>
