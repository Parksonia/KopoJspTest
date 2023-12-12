<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL로 객체 전달받기</title>
</head>
<body>
<h2>영역을 통해서 전달된 객체</h2>
<ul>
	<li>Person 객체 => 이름 : ${personObj.name}, 나이 ${personObj.age}</li>
	<li>String 객체 => ${requestScope.stringObj }</li>
	<li>Integer 객체 => ${integerObj}</li>
</ul>

<h2>매개변수로 전달된 값 읽기</h2>
<ul>
	<li> ${param.firstNum}</li>
	<li> ${param.secondNum}</li>
	<li> ${param.secondNum + param.firstNum}</li>
	<li> ${param.secondNum} + ${param.firstNum}</li>  <!--문자열로 인식됨 -->
	<li> ${param['secondNum']} + ${param['firstNum']}</li>
	<li> ${param["secondNum"]} + ${param["firstNum"]}</li>
</ul>
</body>
</html>