<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   
    %>

     <!--  errorPage = "isErrorPage.jsp" 위에 추가해줘야함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<%

/* 블럭선택 crtl shift / -> 한번에 주석 처리
request =내장객체 변수값을 받아와서 활용할 수 있음 
에러페이지처리
1.try-catch ->catch에 에러 발생 시 노출 될 것 표현
2.에러페이지 지시어 활용
*/

/* try{
int myAge = Integer.parseInt(request.getParameter("age")) + 10;  // 에러 발생(소스파일이 그대로 노출됨->에러페이지 처리 해야함)
out.println("10년 후 당신의 나이는 " + myAge + "입니다.");  // 실행되지 않음
}catch(Exception e){
	out.println("예외가 발생했습니다.");
} */


int myAge = Integer.parseInt(request.getParameter("age")) + 10;  // 에러 발생(소스파일이 그대로 노출됨->에러페이지 처리 해야함)
out.println("10년 후 당신의 나이는 " + myAge + "입니다.");  // 실행되지 않음
%>

</body>
</html>