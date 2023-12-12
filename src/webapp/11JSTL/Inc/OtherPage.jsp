<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
<c:import>태그 == <jsp:include> 액션태그, 외부파일을 현재위치에 삽입할 때 사용
같은 애플리케이션 안에 없어도 삽입 가능함.

<c:import url ="페이지 경로 or URL" var="변수명" scope="영역" />

${변수명} ->출력

<c:import url="경로?param1=value1"> ->get방식처럼 param값 보내거나
	<c:param name="param2" value="value2" /> ->param태그 활용
</c:import>
*/
%>    
<h4>OtherPage.jsp</h4>
<ul>
	<li>저장값 : ${requestVar}</li>
	<li>매개변수1 : ${param.user_param1}</li>
	<li>매개변수2 : ${param.user_param2}</li>
</ul>