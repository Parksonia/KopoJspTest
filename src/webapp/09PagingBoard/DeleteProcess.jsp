<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedin.jsp" %>
<%@ page import = "model1.BoardDTO,model1.BoardDAO" %>

<%

String num = request.getParameter("num");
BoardDTO dto =new BoardDTO();
BoardDAO dao = new BoardDAO(application);

dto=dao.selectView(num);

//String sessionId = session.getAttribute("UserId").toString();
String sessionId = (String)session.getAttribute("UserId");

int delResult = 0;

if (sessionId.equals(dto.getId())) {  // 작성자가 본인인지 확인 
    // 작성자가 본인이면...
    dto.setNum(num);
    delResult = dao.deletePost(dto);  // 삭제!!! 
    dao.close();
    // 성공/실패 처리
    if (delResult == 1) { 
        // 성공 시 목록 페이지로 이동
        JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out); 
    } else {
        // 실패 시 이전 페이지로 이동
        JSFunction.alertBack("삭제에 실패하였습니다.", out);
    } 
} 
else { 
    // 작성자 본인이 아니라면 이전 페이지로 이동
    JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
    return;
}
%>
