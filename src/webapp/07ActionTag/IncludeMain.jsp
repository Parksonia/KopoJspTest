<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String outPath1 ="./Inc/OuterPage1.jsp";
String outPath2 ="./Inc/OuterPage2.jsp";

pageContext.setAttribute("pAttr","동명왕");
request.setAttribute("rAttr","온조왕");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부 파일 읽기</title>
</head>
<body>

<h2>지시어 VS 액션태그 방식 비교하기</h2>
<!-- 
	 1.지시어로 include
	 2.newVal1 출력 
	 3.지시어로 include 하되,표현식으로 include 페이지 지정
	 4.액션태그로 include
	 5.액션태그로 include 하되, 표현식으로 경로지정\
	 6.newVal2 출력 
	 
	 -->
<!-- 1 -->
<h3>지시어로 페이지 포함</h3>
<%@ include file ="./Inc/OuterPage1.jsp" %>
<%-- <%@ include file = <%=outPath1 %> %>  include에서는 표현식으로 사용 불가--%>
<p>외부파일 변수 : <%=newVar1 %> </p>

<!-- 2 -->
<h3>액션태그로 페이지 포함</h3>
<jsp:include page= "./Inc/OuterPage2.jsp" />
<jsp:include page ="<%=outPath2%>" />
<%-- <p>외부파일 변수 : <%=newVar2 %></p>  액션태그에서는 outpage변수 호환 불가 --%>
</body>
</html>