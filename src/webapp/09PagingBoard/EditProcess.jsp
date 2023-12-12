<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./isLoggedin.jsp" %>
<%@ page import = "model1.BoardDAO,model1.BoardDTO"%>

<%
// 값 넘겨받기 
String num =request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//홈 값 -> DTO 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DAO 객체를 통해 DB에DTO 저장
BoardDAO dao = new BoardDAO(application);  //db연결
int affected = dao.updateEdit(dto);
dao.close();


//화면 전환

if(affected == 1){
	response.sendRedirect("View.jsp?num="+dto.getNum());
}else{
	   JSFunction.alertBack("수정에 실패하였습니다.", out);
}
%>