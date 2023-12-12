<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./isLoggedin.jsp" %>
<%@ page import ="model1.BoardDAO,model1.BoardDTO" %>    
<%@ page import ="utils.JSFunction" %>
<%

String num = request.getParameter("num");
//DAO
BoardDAO dao = new BoardDAO(application);
//게시물 값 가져오기
BoardDTO dto = dao.selectView(num);
//로그인 아이디 받아와서 작성자만 수정이 가능하도록 함
String sessionId = session.getAttribute("UserId").toString();

if(!sessionId.equals(dto.getId())) {
	//본인이 아니라면
	JSFunction.alertBack("작성자만 수정이 가능합니다.", out);
	return;
}
//db연결 해제
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script type ="text/javascript">
function validateForm(form){
	if(form.title.value == ""){
		alert("제목을 입력해주세요.");
		form.title.focus();
		return false;
		
	}
	if(form.content.value == ""){
		alert("내용을 입력해주세요.");
		form.content.focus();
		return false;
}
</script>
</head>
<body>
<jsp:include page ="../Common/Link.jsp" /> <!-- 최상단 로그인,게시판 링크  삽입-->

<form name="writeFrm" method ="post" action="EditProcess.jsp" onsubmit="return validateForm(this);">

<input type ="hidden" name ="num" value= "<%=dto.getNum() %>" />
<table border="1" width ="90%">
		<tr>
			<td>제목
				<input type="text" name="title" style="width:90%;" value="<%=dto.getTitle()%>" />
			</td>
		</tr>
			<tr>
			<td>내용
				<textarea name="content" style="width:90%; height: 100px ;" value="<%=dto.getContent()%>" >
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">수정완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='List.jsp';">목록보기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>