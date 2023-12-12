<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*  
<c:out value="출력변수" defalut="기본값" excapeXml="True" /> ->만약 value가 null인 경우 지정해둔 디폴트값 출력됨 

excapeXml 기본값->True 인데 특수문자를 변활 할 지 여부를 결정함 
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out.jsp</title>
</head>
<body>

	<c:set var="iTag">
	i태그는 <i>기울임</i>을 표현합니다.  <!-- 태그가 텍스트로 인식되게됨  -->
	</c:set>


	<h4>기본 표현식 사용(excapeXml="True" 상태임)</h4>
	<c:out value="${iTag}" />

	<h4>escapeXml 속성을 활용하여 사용</h4>
	<c:out value="${iTag}" escapeXml="false" />

	<h4>defalut 활용</h4>
	<c:out value="${param.name}" default="null입니다." />
	<c:out value="" default="빈 문자열 입니다." />
	<!-- 빈 문자열도 하나의 값이다. 따라서 디폴트값 출력이 안됨 -->
</body>
</html>