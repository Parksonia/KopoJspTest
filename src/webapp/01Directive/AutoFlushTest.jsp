<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="ture"%>  <!--버퍼 설정-->

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - buffer, autoFlush 속성</title>
</head>
<body>
<%
for (int i = 1; i <= 100; i++) {  // 버퍼 채우기
    out.println("abcde12345"); 
}

/* 10byte 의 문자열을 100번 실행
:buffer 1kb는 에러남 버퍼늘려해결 또는 autoFlush 버퍼가 차면 알아서 늘리는 지시어  True로 전환하여 해결 */
%>
</body>
</html>