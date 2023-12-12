<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "./isLoggedin.jsp" %>  <!-- 세션 20분 설정이 풀릴 수 있으니 다시 한번 확인 -->
<%@ page import = "model1.BoardDTO,model1.BoardDAO" %>

<%
// 홈 넘어온 값을 받기

String title =request.getParameter("title");
String content =request.getParameter("content");


//홈 값 -> DTO 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());


//DAO 객체를 통해 DB에DTO 저장
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWirte(dto);
dao.close();


//화면 전환

if(iResult == 1){
	response.sendRedirect("List.jsp");
}else{
	   JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}

%>