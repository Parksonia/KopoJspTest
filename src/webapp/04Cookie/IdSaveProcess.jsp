<%@ page import="utils.CookieManager"%>
<%@ page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String user_id = request.getParameter("user_id"); 
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");  


if ("kopo".equals(user_id) && "1234".equals(user_pw)) {  // loginId의 value=> kopo
    // 로그인 성공
    if (save_check != null && save_check.equals("Y")) { 
        CookieManager.makeCookie(response, "loginId", user_id, 86400); // loginId 라는 이름으로 쿠키를 생성하여 보냄 
    } 
    else {
        CookieManager.deleteCookie(response, "loginId");  // 자동 로그인체크가 안되어 있다면 쿠키 삭제 
    }
    
    JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out); 
}
else {
    // 로그인 실패->로그인 화면으로 돌아감
    JSFunction.alertBack("로그인에 실패했습니다.", out);  
}
%>