package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnPool {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rset;

	
	//file-> context.xml->server.xml 수정해야함 (자바 네이밍 서비스 이용할 수 있음)
	public DBConnPool() {  //계속 연결 했다 끊었다 하는 것 아니고 필요할 때 사용하고 반납하는 개념  
		try {
			
			//커넥션 풀을 얻어오기
			Context initCtx = new InitialContext();
			Context ctx =(Context)initCtx.lookup("java:comp/env"); //웹 루트 경로
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");  //lookup 메서드로 이름을 찾아 source에 담음..?
			
			//커넥션풀로 연결
			con = source.getConnection();
			System.out.println("커넥션 풀로 연결");


		} catch (Exception  e) {
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

			System.out.println("커넥션풀 자원 반납");


		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}

