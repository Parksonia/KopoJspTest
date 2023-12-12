<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>web.xml 설정 값 읽어오기</h2>
		초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
						<!-- application으로 접근하여 변수들 불러올 수 있었음 -->

	
	<h2>서버 물리적 경로 읽기</h2>
		<!-- 컨텍스트 루트 경로 제외한 경로 -->
		경로주소 : <%=application.getRealPath("/02ImplicitObject")%>
	
	<h2>선언부 application 객체 사용</h2>
	<%!
	public String useImplicitObject(){
		return this.getServletContext().getRealPath("/02ImplicitObject");
		
	}
	//선언부에서는 application 내장객체 사용 불가해서 내장객체를 Parameter로 받아와야 함 
	public String useImplicitObject(ServletContext app){ //ServletContext 타입
		return app.getRealPath("/02ImplicitObject");
		
	}
	
	%>
	<ul>
		<li>this 사용 :  <%=useImplicitObject()%></li>
		<li>내장객체 전달  :  <%=useImplicitObject(application)%></li>	
	</ul>


</body>
</html>