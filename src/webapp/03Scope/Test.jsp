<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


String name1="a";   //String ->자료형 
String name2= new String("a");   // new String ->클래스 String(object).메서드 사용 가능 
String name3="a";  

out.println(name1 == name2 +"<br>");  //false (주소값 비교)
out.println(name1.equals(name2) +"<br>");  //true (value 값 비교)
out.println(name1 == name3 +"<br>");  //true (name1 의 주소값 참고 했으니까 트루)


out.println(System.identityHashCode(name1) +"<br>");
out.println(System.identityHashCode(name2) +"<br>");
out.println(System.identityHashCode(name3) +"<br>");

int num1=1;
Integer num2= new Integer(1);  //Integer(obj) 생성하여 새로운 참조형 변수로 만든거임 
int num3=1;

out.println((num1 == num2) +"<br>");   //auto unBoxing 으로 true로 나옴 
out.println(num2.equals(num1) +"<br>");  //equals 저장된 값이 같냐고 물어보는거임
out.println((num1 == num3) +"<br>");

out.println(System.identityHashCode(num1) +"<br>");
out.println(System.identityHashCode(num2) +"<br>");
out.println(System.identityHashCode(num3) +"<br>");


HashMap<Integer,String> map = new HashMap<>();
map.put(1,"사과");
map.put(2,"바나나");
map.put(3,"포도");

HashMap<Integer,String> map2 = map;
out.println("map =" +map +"<br>");
out.println("map =" +map2 +"<br>");

map2.put(1,"파인애플");

out.println("map =" +map +"<br>");
out.println("map =" +map2 +"<br>");



%>



</body>
</html>