<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>페이지 이동 후 session 처리 확인</h2>

<%
//session 영역은 웹에 저장이 된다.

ArrayList<String> list = new ArrayList<String>();
list = (ArrayList<String>)session.getAttribute("lists"); //리스트를 받아옴  object arraylist로 형 변환 하기 
String lists = session.getAttribute("lists").toString();

for(int i=0; i<list.size(); i++){  // 또는 for (String str :list)
	
	out.println(list.get(i)+"<br />");
}
out.println(lists);


%>


</body>
</html>