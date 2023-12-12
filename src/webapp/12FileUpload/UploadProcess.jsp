<%@page import ="java.util.Date" %>
<%@page import ="java.io.File" %>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1. MultipartRequest 객체 생성
2. 새로운 파일 생성
3. 파일명 변경
4. 다른 폼 처리
*/
String saveDirectory = application.getRealPath("/Uploads");
int maxPostSize = 1024*1000; //파일 최대 크기(1mb)
String encoding = "UTF-8";

try{
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
								maxPostSize, encoding);
	
	String fileName = mr.getFilesystemName("attachedFile"); //현재 파일 이름
	String ext = fileName.substring(fileName.lastIndexOf("."));
	//ex) 나는야.프로그래머.입니다.txt ->파일명 :나는야.프로그래머.입니다 확장자:.txt
	//name.IndexOf(".") =>1번 점이 나옴
	//name.lastIndexOf(".") =>마지막 .이 나오기 때문에 3번 점이 나옴
	
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now+ext; //파일명 = 업로드시간.확장자

	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if (cateArray == null){
		cateBuf.append("선택 없음");
	}else{
		for (String s: cateArray){
			cateBuf.append(s + ", ");
		}
	}
	
	/*
	5. DTO 생성
	6. DAO 로 DB 반영
	7. 파일 목록으로 redirection
	*/
	
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();	
	response.sendRedirect("FileList.jsp");
}
catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 실패");
	request.getRequestDispatcher("FileUploadMain.jsp").
	forward(request, response);
}
%>