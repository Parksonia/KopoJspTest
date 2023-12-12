<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.FileNotFoundException" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.OutputStream" %>
<%@ page import = "java.io.InputStream" %>
<%@ page import = "utils.JSFunction" %>
<%
String saveDirectory = application.getRealPath("/Uploads");
String saveFileName = request.getParameter("sName");
String originalFileName = request.getParameter("oName");

try{
	//파일을 찾아서 입력 스트림 만들기
	File file = new File(saveDirectory,saveFileName);
	InputStream inStream = new FileInputStream(file);
	
	//한글 파일명 깨지면 처리
	String client = request.getHeader("User-Agent"); // 나의 경우는 Crome
	
	if(client.indexOf("WOW64") == -1){  // 인터넷 익스플로어 일 경우
		originalFileName = new String (originalFileName.getBytes("UTF-8"),"ISO-8859-1");
			
	}else{
		originalFileName = new String (originalFileName.getBytes("KSC5601"),"ISO-8859-1");
	}
	
	//파일 다운로드 할 응답 전용 헤더 만들기
	
	response.reset(); // 응답헤더 초기화
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename=\""+originalFileName+ "\"");
	response.setHeader("Content-Length", ""+ file.length());

	
	//출력 스트림 초기화
	out.clear();
	
	//출력 스트림 생성
	OutputStream outStream = response.getOutputStream();
	
	//출력 스트림에 파일내용 out
	
	byte b[] = new byte[(int)file.length()];
	int readBuffer = 0;
	while((readBuffer = inStream.read(b)) >0){
		outStream.write(b,0,readBuffer);
	}
	
	//입출력 종료(다운로드 완료 시)
	inStream.close();
	outStream.close();


}catch(FileNotFoundException f){
	JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
	f.printStackTrace();
	
}catch(Exception e){
	e.printStackTrace();
}

%>
