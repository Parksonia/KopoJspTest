<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naver import</title>
</head>
<body>

	<c:set var="requestVar" value="kopo" scope="request" />
	<c:import url="../Inc/OtherPage.jsp" var="contents">
		<c:param name="user_param1" value="jstl_import" />
		<c:param name="user_param2" value="모두의 취업" />

	</c:import>

	<h4>문서삽입</h4>
	${contents}  <!-- 해당 페이지가 삽입되어 출력되게 됨 -->

	<h4>외부 경로 삽입</h4>

	<iframe src="../Inc/GoldPage.jsp" style="width:100%; height: 600px;">
	</iframe>
</body>
</html>