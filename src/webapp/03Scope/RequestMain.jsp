<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>    
    
<%
//값 저장
request.setAttribute("requestStr","request");
request.setAttribute("requestPerson",new Person("소연",20));
%>
<!--1.문자열 저장("request라는 문자열을 name requsetStr 로 저장)
	2.Person 객체 저장(본인이름,나이 20살)  -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request scope</title>
</head>
<body>

<h2>request영역 확인</h2>

<%
// 저장된 데이터 불러와서 출력하기
request.removeAttribute("requestStr"); //저장된 변수를 삭제 시도
request.removeAttribute("requestInt");  // 없는 변수를 삭제 시도
String requesStr = (String)request.getAttribute("requestStr"); // request.getAttribute("requestStr")=>object 니까 형변환 해줘야함 
Person requestPerson = (Person)request.getAttribute("requestPerson");

%>
<ul>
	<li>String requestStr : <%=request.getAttribute("requestStr")%></li> 
	<li>Person requestPerson  : <%=requestPerson.getName()%>,<%=requestPerson.getAge()%> </li>
</ul>


<h2>request 영역 속성 전달 - 포워드 활용</h2>
<%
//getRequestDispatcher()가 실행되는 순간 지정된 페이지를 읽어들여서 리다이렉트 시킨다. 서버단에서 모든 작업이 이루어진다.(주소 변경 없음)
request.getRequestDispatcher("RequestForward.jsp?param1=한글&param2=eng").forward(request,response);
%>

</body>
</html>