<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>    
<%@ page import="common.Person" %>
<%@ page import="java.util.LinkedList" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEachExtend2.jsp</title>
</head>
<body>
<h4>컬렉션 - list</h4>

	<%
	LinkedList<Person> lists = new LinkedList<Person>();
	lists.add(new Person("장영실",51));
	lists.add(new Person("신사임당",67));
	lists.add(new Person("이순신",29));
	%>
	<c:set var ="lists" value="<%=lists %>" />
	<c:forEach items="${lists}" var="list">
	<li>
		이름 : ${list.name} , 나이 : ${list.age }
	</li>
	</c:forEach>
	
<h4>컬렉션 - map</h4>	
	<%
	Map<String,Person> maps = new HashMap<String,Person>();
	maps.put("1",new Person("홍길동",28));
	maps.put("2",new Person("장금이",35));
	maps.put("3",new Person("혜원",11));
	%>
	
	<c:set var="maps" value="<%=maps %>" />	
		<c:forEach items="${maps}" var="maps">
		<li>
		 Key=> ${maps.key} <br />
		 value=> 이름 :${maps.value.name}, 나이:${maps.value.age}
		 </li>
		 </c:forEach>
</body>
</html>