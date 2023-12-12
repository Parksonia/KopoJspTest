<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int num1 =3;
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");
pageContext.setAttribute("num4", "7");

 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL로 연산자 활용하기</title>
</head>
<body>
<h2> 변수 선언 및 할당</h2>
스크립틀릿에서 선언한 변수 : ${num1} <br />
page 영역에서 선언한 변수 : ${num2} <br />
변수 선언 및 할당, 출력 :${num1 = 6 } <br />
변수 선언 및 할당, 미출력 :${num2 =8;''} => ${num2} <br />
num1= ${num1 }, num2 =${num2 }, num3=${num3 }, num4=${num4}


<h3>산술 연산자 활용</h3>
num1 + num2 =${num1 + num2} <br />
num1 - num2 =${num1 - num2} <br />
num1 * num2 =${num1 * num2} <br />
num1 / num2 =${num1 / num2} <br />
num1 div num2 =${num1 div num2} <br />
num1 mod num2 =${num1 mod num2} <br />
num1 % num2 =${num1 % num2} <br />


<h3>비교 연산자 활용</h3>
num1 gt num2 =${num1 > num2} <br />
num1 lt num2 =${num1 < num2} <br />
num1 ge num2 =${num1 >= num2} <br />
num1 eq num2 =${num1 == num2} <br />

<h3>논리 연산자 활용</h3>
num1 <= num2 && num3 == num4 : ${num1 le num2 and num3 eq num4} <br />
num1 >= num2 || num3 != num4 : ${num1 ge num2 or num3 ne num4} <br />

<!-- 삼항연산자 ${조건 ? 참 :거짓} -->


</body>
</html>