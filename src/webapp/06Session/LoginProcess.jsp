<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="membership.MemberDTO,membership.MemberDAO" %>    
<%
// 로그인 폼에서 입력된 아이디와 비밀번호 받아오기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

//web.xml  가져온 INIT_PARAM 으로 DB연결

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");


//회원 테이블 DAO 를 이용하여 DTO 정보를 리턴받기 

MemberDAO dao = new MemberDAO(oracleDriver,oracleURL,oracleId,oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId,userPwd);
dao.close();

//로그인 성공 유무 확인 후 처리

if(memberDTO.getId() != null) { // DB에 id,pw 있음- 로그인 성공 
	session.setAttribute("UserId",memberDTO.getId());
	session.setAttribute("UserName",memberDTO.getName());
	response.sendRedirect("LoginForm.jsp");	

}else{ // 값 없음 -로그인 실패
	request.setAttribute("LoginErrMsg", "로그인오류"); // value 로 텍스트를 보냄
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);	
}

%>