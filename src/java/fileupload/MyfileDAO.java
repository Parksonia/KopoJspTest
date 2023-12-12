package fileupload;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyfileDAO  extends DBConnPool{ //db 연결

	/*
	 * form 데이터를 받아서 저장하는 insertFile() 메서드 
	 * public int insertFile(myfileDTO dto)
	 * int applyResult = 0;
	 * 
	 * -쿼리문작성
	 * -인파라미터 삽입
	 * -업데이트
	 * 
	 * return applyResult;
	 * */
	
	public int insertFile(MyfileDTO dto) {
	int applyResult = 0; // 몇개의 행이 저장됐는지 리턴해 줄 변수 
	
	try {
		String query = "INSERT INTO myfile(idx,name,title,cate,ofile,sfile)"
				+ "		VALUES(seq_board_num.nextval,?,?,?,?,?)";
		
		psmt =con.prepareStatement(query);  // inparmeter가 있는 쿼리문 
		psmt.setString(1, dto.getName());
		psmt.setString(2, dto.getTitle());
		psmt.setString(3, dto.getCate());
		psmt.setString(4, dto.getOfile());
		psmt.setString(5, dto.getSfile());
	
		applyResult = psmt.executeUpdate();  // 반환값이 1이면 성공(한 개씩 집어넣으니까!ㄴ )
		
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	
	return applyResult;	
	}
	
	//파일 목록 반환
	
	public List<MyfileDTO> myFileList() {
		List<MyfileDTO> fileList = new Vector<MyfileDTO>(); 
		
		/*1.쿼리문 작성 -최신 게시물이 먼저 출력되도록 idx 정렬을 DESC
		2.쿼리실행
		3.목록 추가
		*/
		try {
			String query ="SELECT * FROM myfile ORDER BY idx DESC"; //inParameter가 없는 쿼리문
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				
				MyfileDTO dto = new MyfileDTO();
				
				dto.setIdx(rset.getString(1));
				dto.setName(rset.getString(2));
				dto.setTitle(rset.getString(3));
				dto.setCate(rset.getString(4));
				dto.setOfile(rset.getString(5));
				dto.setSfile(rset.getString(6));
				dto.setPostdate(rset.getString(7));
				
				fileList.add(dto);
			}
		
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return fileList; // 목록 반환
				
	}
	
	
	}


