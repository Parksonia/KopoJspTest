<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - out</title></head>
<body>
    <%
    // 버퍼 내용 삭제하기
    out.print("출력되지 않는 텍스트");  // 버퍼에 저장됨 -out.flush() 버퍼에 저장된 내용 출력
    out.clearBuffer();  // 버퍼를 비움(윗 줄의 출력 결과 사라짐) 
    out.print("<h2>out 내장 객체</h2>"); //버퍼가 HTML 해석해서 출력됨 
    // 버퍼 크기 정보 확인
    out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
    out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>"); 
    out.flush();  // 버퍼 내용 출력 
    out.print("flush 후 버퍼의 크기 : " + out.getRemaining() + "<br>");
    
    // 다양한 타입의 값 출력
    out.print(1); // out내장객체에서 println(enter)적용 안됨 
    %><br> <!-- 자바코드 표현식을 종료하고 HTML태그 사용할 수 있다 -->
    <% 
    out.print(false + "<br>");
    out.print('가');
    %>
</body>
</html>