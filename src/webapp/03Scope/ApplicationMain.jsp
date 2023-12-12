<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.Map" %>          
<%@ page import ="common.Person" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application scope</title>
</head>
<body>

<h2>application 영역 확인</h2>

<%
Map<String, Person> maps = new HashMap<>();
maps.put("Aclass",new Person ("이수일",20));
maps.put("Bclass",new Person ("김희애",30));

application.setAttribute("maps", maps);  // 어플리 케이션 영역에 저장
//application 영역에 저장하기 ->name :"maps"
//applicationResult.jsp 생성 후 출력하기 

%>
    <h2>application 저장 확인</h2>
  

</body>
</html>