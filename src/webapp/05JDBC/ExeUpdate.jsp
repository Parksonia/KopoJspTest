<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.JDBConnect" %>
<%@ page import ="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>jdbc update</title>
</head>
<body>

<h2>회원 추가 executeUpdate() 함수 사용</h2>

<%
//DB에 영향을 주는 것(insert,delete,update) ->update 함수를 사용 

//DB연결
JDBConnect jdbc =new JDBConnect();
//입력 데이터 준비
String id ="test1";
String pass ="1111";
String name ="테스트1";
//쿼리 생성
String sql  ="INSERT INTO member VALUES(?,?,?,sysdate)";  //?->In parameter가 있는 쿼리문
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1,id);
psmt.setString(2,pass);
psmt.setString(3, name);

//쿼리 작업 실시

int inResult =psmt.executeUpdate();
out.println(inResult + "row 행 입력 완료");

//연결 닫기
jdbc.close();
%>

</body>
</html>