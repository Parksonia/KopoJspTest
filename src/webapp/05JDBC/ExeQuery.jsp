<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.JDBConnect" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>jdbc update</title>
</head>
<body>

  <h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>

<%


//DB연결
JDBConnect jdbc =new JDBConnect();
//입력 데이터 준비

//쿼리 생성

//String sql  ="select * from member"; 
String sql= "select  id,pass,name,regidate from member";
Statement stmt = jdbc.con.createStatement();
ResultSet rset =stmt.executeQuery(sql);
 
// 결과 확인(웹 페이지에 출력)
while (rset.next()) { 
    String id = rset.getString(1);
    String pw = rset.getString(2);
    String name = rset.getString("name"); // 컬럼 번호 써도 됨
    java.sql.Date regidate = rset.getDate("regidate");
    
    out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>"); 
}
 
/* //쿼리 작업 실시
ArrayList<String>list = new ArrayList<>();
ResultSet rset =stmt.executeQuery(sql);
while(rset.next()){
	list.add(rset.getString(1));
	list.add(rset.getString(2));
	list.add(rset.getString(3));
	list.add(rset.getString(4));
} */
//연결 닫기
jdbc.close();

/* for(int i=0; i<list.size(); i++){
	out.println(list.get(i)+"<br />");
} */

%>

</body>
</html>