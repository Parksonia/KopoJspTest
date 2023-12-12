<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
/* 
1. 화면준비(method:post, enctype:multipart/form-data)
    - enctype : 인코딩 방식 지정
        - application/x-www-from-urlencoded : 문자를 서버로 전송전에 인코딩
        - multipard/form-data : 모든 문자를 인코딩하지는 않음, form 태그로 파일을 서버로 전송할때 사용
        - text/plain : 공백을 + 기호로 변환
2. DB table 준비
SQL> create table myfile(
		  2  idx number primary key,
		  3  name varchar2(50) not null,
		  4  title varchar2(200) not null,
		  5  cate varchar2(30),
		  6  ofile varchar2(100) not null,
		  7  sfile varchar2(30) not null,
		  8  postdate date default sysdate not null);
3. DTO, DAO
4. 연동 → 업로드

<form method="post" enctype="multipart/form-data"
				action="지정한경로-업로드 파일을 처리할 경로">	
	<input type="file" name="input 이름">  ->파일 업로드 
</form>
*/

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadMain</title>
</head>
<body>
   <script>
function validateForm(form) {
   if (form.name.value == "") {
      alert ("작성자를 입력해주세요.");
      form.name.focus();
      return false;
   }
   
   if(form.title.value=="" ) {
      alert("제목을 입력해주세요.");
      form.title.focus();
      return false;
   }
   
   if (form.attachedFile.value=="") {
      alert("파일 첨부는 필수입니다.");
      form.
      return false;
   }
}

</script>
</body>
<h3>파일 업로드</h3>
<span style="color: red;">${ errorMessage } </span>
<form name="fileForm" method="post" enctype="multipart/form-data"
   action="UploadProcess.jsp" onsubmit="return validateForm(this);">
   작성자 : <input type="text" name="name" value="순이" /><br/>
   제목 : <input type="text" name="title" value="일탈" /><br/>
   카테고리(선택사항): 
      <input type="checkbox" name="cate" value="사진" checked/>사진
      <input type="checkbox" name="cate" value="과제" />과제
      <input type="checkbox" name="cate" value="음원" />음원
      <input type="checkbox" name="cate" value="워드" />워드<br/>
   첨부파일 : <input type="file" name="attachedFile"/><br/>
   
   <input type = "submit" value="전송"/>

</html>



<!--  
기존 form 태그 -> getsParameter()
multipart / form-data -> MutipartRequest Class
여러 생성자 중 상황에 맞는 걸 활용하면 됨.
-->


