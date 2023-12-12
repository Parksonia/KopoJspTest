<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/*
XML(Xtensible markup language) 문서를 처리하기 위한 목적,XML파싱,출력,control 등....

xml = 확장이 가능한 마크업 언어
데이터를 작성할 수도 있고
저장할 수 있고
전달할 수 있음


out(출력), parse(파싱,가져오기), forEach(반복), if(단일 조건), choose(다중 조건)  =>XML tags

XML 문서에 접근하기 위해서 Xpath 를 사용 
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xml.jsp</title>
</head>
<body>
	<c:import url="../Inc/BookList.xml" var="booklist" charEncoding="UTF-8" />

	<x:parse xml="${booklist}" var="blist"/>
	
		<%
	//EL =>${} 중괄호 사용하나, Xpath= $ 중괄호 사용 안함
	%>
	<h4>파싱</h4>
	제목1 :
	<x:out select="$blist/booklist/book[1]/name" />
	<br /> 저자1 :
	<x:out select="$blist/booklist/book[1]/author" />
	<br /> 가격1 :
	<x:out select="$blist/booklist/book[1]/price" />
	<br />
	<hr>
	제목2 :
	<x:out select="$blist/booklist/book[2]/name" />
	<br /> 저자2 :
	<x:out select="$blist/booklist/book[2]/author" />
	<br /> 가격2 :
	<x:out select="$blist/booklist/book[2]/price" />
	<br />


	<h4>파싱2</h4>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
		</tr>
		<x:forEach select="$blist/booklist/book" var="item">
	
			<tr>
				<td><x:out select="$item/name" /></td>
				<td><x:out select="$item/author" /></td>
				<td><x:choose>
						<x:when select="$item/price >= 20000">
				2만원 이상 <br />
						</x:when>
						<x:otherwise>
				2만원 미만 <br />
						</x:otherwise>
					</x:choose></td>
			</tr>
		</x:forEach>
	</table>

</body>
</html>