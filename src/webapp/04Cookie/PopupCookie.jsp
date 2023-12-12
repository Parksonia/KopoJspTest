<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String chkVal =request.getParameter("inactiveToday");//checkbox 의 값을 받아옴  

if (chkVal != null && chkVal.equals("1")){ // 
	
	Cookie cookie = new Cookie("PopupMode","off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(60*60*24); // 하루 동안 60*60*24 
	response.addCookie(cookie); //헤드에 담아 보냄
	out.print("24시간 동안 팝업 열리지 않음");
}
%>