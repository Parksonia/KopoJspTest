<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>
</head>
<body>
	<h2>등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일등록하기</a>
	<%
	/*  
	테이블
	No/작성자/제목/카테고리/원본파일명/저장된파일명/작성일
	*/

	MyfileDAO dao = new MyfileDAO();
	List<MyfileDTO> lists = dao.myFileList(); //게시물 리스트 반환받기 
	dao.close();
	%>
	<table border="1">
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본파일명</th>
			<th>저장된파일명</th>
			<th>작성일</th>
			<th></th>
		</tr>				
		<%
		for (MyfileDTO list : lists) {
		%>
		<tr>
			<td><%=list.getIdx()%></td>
			<td><%=list.getName()%></td>
			<td><%=list.getTitle()%></td>
			<td><%=list.getCate()%></td>
			<td><%=list.getOfile()%></td>
			<td><%=list.getSfile()%></td>
			<td><%=list.getPostdate()%></td>
			<td><a href="Download.jsp?oName=<%= URLEncoder.encode(list.getOfile(),"UTF-8") %>&sName=<%=URLEncoder.encode(list.getSfile(),"UTF-8")%>">[다운로드]</a></td>
			
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>