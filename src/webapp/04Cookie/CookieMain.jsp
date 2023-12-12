<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 설정</title>
</head>
<body>
<h2>-쿠키 설정하기</h2>
<%
//쿠기 만들기
Cookie cookie = new Cookie("myCookie","엄마손쿠키");
//쿠키 경로 설정
cookie.setPath(request.getContextPath()); //경로를 컨테스트 루트로 설정함
//쿠키 유지 기간 설정
cookie.setMaxAge(3600); //초단위임 ->3600초=1시간 
//응답헤더에 쿠키 추가하기 -> 쿠키를 담아 보내야 클라이언트가 받을 수 있음
response.addCookie(cookie); // 헤더 수정은 response다
%>

<h2>-쿠키 확인하기</h2>

<%
//헤더의 모든 쿠키값 받기 -> 한 개가 아닐 수 있기때문에 배열로 받아야 함
Cookie[] cookies =request.getCookies();
if(cookies != null){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		//JSESSIONID 라는 
		out.print(String.format("%s : %s <br />",cookieName,cookieVal));
	}
}
%>

<h2>-페이지 이동 후 쿠키 값 확인</h2>
<a href ="CookieResult.jsp">쿠키 값 확인하기</a>

</body>
</html>