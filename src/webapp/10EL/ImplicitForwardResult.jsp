<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImplicitFowardResult.jsp</title>
</head>
<body>
<h2>영역별로 저장된 속성 읽기</h2>
<ul>

	<li>페이지 영역 : ${pageScope.scopeVal}</li>
	<li>리퀘스트 영역 :${requestScope.scopeVal}</li>
	<li>세션 영역 : ${sessionScope.scopeVal }</li>
	<li>애플리케이션 영역 : ${applicationScope.scopeVal }</li>

</ul>

<h3>포워드된 페이지의 영역 우선권은 누구?</h3>
	<li> ${scopeVal}</li>
</body>
</html>