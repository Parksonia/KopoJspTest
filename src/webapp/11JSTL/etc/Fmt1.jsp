<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/* 
Formatting tga -> 흔하게 사용 안함
해외 라이브러리 + 시간(timestamp)이 중요한 데이터를 수집 할 경우
증권 데이터 + 해외 선물 시장 주가 데이터 +FX 마진(환율데이터) 의 경우 

=>시간에만 국한된 것 아님

숫자포맷 = formatNumber(숫자포맷상태) , parseNumber(문자열을 숫자로 포맷팅)
날짜포맷 = formatDate(날짜,시간), parseDate (문자열 날짜 시간을 숫자형으로 )
타임존포맷 = setTimeZone(설정한 시간을 담기) ,timeZone(시간대 설정)
로케일 설정 = setLocale(기호,시간대 지역에 맞게 표시), requestEncoding
등
모든 형식들을 fmt를 사용하여 활용 가능
*/

/* 
<f:formatNumber value="출력할 숫자" type="문자열 양식 패턴 -퍼센티지,통화(currency)등" 
      var="변수명" groupingUsed="구분기호(,)-세자리마다 표시(True/False)" pattern="숫자패턴" scope="영역">

1,000,000 = groupingUsed -> 주의! 문자열임

<f:parseNumber value="파싱문자열(반환할문자열)" type="양식" var="변수명"
				integerOnly="정수만파싱(True/False)" pattern="패턴" scope="영역">
*/

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>etc > Fmt1.jsp</title>
</head>
<body>
<h4>숫자 포맷 설정</h4>

<c:set var="number1" value="12345"/>
콤마 o : <fmt:formatNumber value="${number1}" /> <br />
콤마 x : <fmt:formatNumber value="${number1}" groupingUsed="false" /> <br />


<fmt:formatNumber value="${number1}" type="currency" var="printNum1" />
통화기호 : ${printNum1}<br />

<fmt:formatNumber value="0.2" type="percent" var="printNum2" />
퍼센트 : ${printNum2}<br />

<h4>문자열을 숫자로 변경</h4>

<c:set var="number2" value="6,848.02"/>

<fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3" />
소수점까지 : ${printNum3} <br />
<fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4" />
소수점까지 : ${printNum4} <br />



</body>
</html>