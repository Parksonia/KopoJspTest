<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var ="number" value ="99"/>

<h5>choose 태그로 값을 체크</h5>
<c:choose>
	<c:when test="${number mod 2 eq 0 }">  <!-- 조건식 if문과 유사하게 사용 -->
	
		${number} 는 짝수입니다.
	</c:when>
	
	<c:when test="${number mod 2 eq 1 }">  <!-- 조건식 elseif문과 유사하게 사용 -->
	
		${number} 는 홀수입니다.
	</c:when>

	<c:otherwise>   <!-- else와 같다 -->
		${number} 는 자연수가 아닙니다.
	</c:otherwise>

</c:choose>


<h5>평균값 출력</h5>
<form>
	국어 : <input type="text" name="kor" /><br/>
	영어 : <input type="text" name="eng" /><br/>
	수학 : <input type="text" name="mat" /><br/>
	<input type="submit" value="평균 점수 구하기" />
</form>

<c:if test=" ${ not (empty param.kor or empty param.eng or empty param.mat)}">
	<!-- 평균값계산 -->
	<c:set var="avg" value=" ${(param.kor + param.eng+ param.mat) /3 }" />
	평균점수 =${avg} 이므로,	
	<c:choose>
	
	<c:when test="${avg >= 90}"> A학점 </c:when>
	<c:when test="${avg >= 80}"> B학점 </c:when>
	<c:when test="${avg >= 70}"> C학점 </c:when>
	<c:when test="${avg >= 60}"> D학점 </c:when>
	<c:otherwise> F학점 </c:otherwise>	
	</c:choose>
	입니다.
</c:if>
</body>
</html>