package common;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	public Connection con;  //DB 연결
	public Statement stmt;  // IN파마미터 '없는' 쿼리문 (변하지 않는 값, 고정적일 때, 정적)
	public PreparedStatement psmt; // IN파라미터가 '있는' 쿼리문 (페이지의 변화가 있는 값,동적,'?'로 표현)
	public ResultSet rset;  // 쿼리문 결과 저장
	
	
	//생성자 (기본 생성자로 연결)
	public JDBConnect() {
		try {
			// 드라이버 로드 
			Class.forName("oracle.jdbc.OracleDriver"); //Class 라는 Class가 존재 
				
			//드라이버 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "kopo15";
			String pwd ="5150";
			
			con = DriverManager.getConnection(url,id,pwd);  //연결
						
			System.out.println("DB 연결 성공");
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//web xml 파일에 key-value로 url,id,pwd를 저장, 활용하여 연결
	public JDBConnect(String driver,String url,String id,String pwd) {
		
	
			 try {
				 //드라이버 로드 -application 내장객체 이용하여 parameter 받아옴?
				 Class.forName(driver);
				 
					//드라이버 연결
					/*String url = "jdbc:oracle:thin:@localhost:1521:xe";
					String id = "kopo15";
					String pwd ="5150";*/
				 
				con =DriverManager.getConnection(url,id,pwd);
				 System.out.println("DB 연결 성공");
			
			 } catch (ClassNotFoundException e) {
			
				e.printStackTrace();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		
	}
	
	//application 내장 객체 함수를 이용하여 web xml에 저장된 파라미터를 불러와서 연결하기
	public JDBConnect(ServletContext application) {  //ServletContext java에서 사용하려면 파라미터로 불러와야함
		
		try {
			String driver =application.getInitParameter("OracleDriver");
			Class.forName(driver);
			String url =application.getInitParameter("OracleURL");
			String id =application.getInitParameter("OracleId");
			String pwd =application.getInitParameter("OraclePwd");
			
			con =DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공 -application 직접 접근 ");
			
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
		
	//연결 해제- 자원 반납
	public void close() { 
	
		try {
			
			if(rset !=null) rset.close();
			if(stmt !=null) stmt.close();
			if(psmt !=null) psmt.close();
			if(con !=null) con.close();
			
			System.out.println("자원 해제");
		
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
}
