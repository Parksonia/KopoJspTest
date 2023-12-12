package model1;


import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect {  // db연결 

	public BoardDAO(ServletContext application) {
		super(application);
	}


    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rset = stmt.executeQuery(query);  // 쿼리 실행
            rset.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rset.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<BoardDTO> selectList(Map<String, Object> map) {   // Hashmap value를Object 로 두는것은 모든 유형을 저장 하기 위함
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM board "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rset = stmt.executeQuery(query);  // 쿼리 실행

            while (rset.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO(); 

                dto.setNum(rset.getString("num"));          // 일련번호
                dto.setTitle(rset.getString("title"));      // 제목
                dto.setContent(rset.getString("content"));  // 내용
                dto.setPostdate(rset.getDate("postdate"));  // 작성일
                dto.setId(rset.getString("id"));            // 작성자 아이디
                dto.setVisitcount(rset.getString("visitcount"));  // 조회수

                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수
        
        // 쿼리문 템플릿  
        String query = " SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM board ";

        // 검색 조건 추가 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' "; // Like-> map.get("searchWord")를 포함하는 map.get("searchField")가 조건이 됨  
        }
        
        query += "      ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?"; 

        try {
            // 쿼리문 완성 
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            
            // 쿼리문 실행 
            rset = psmt.executeQuery();
            
            while (rset.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rset.getString("num"));
                dto.setTitle(rset.getString("title"));
                dto.setContent(rset.getString("content"));
                dto.setPostdate(rset.getDate("postdate"));
                dto.setId(rset.getString("id"));
                dto.setVisitcount(rset.getString("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        // 목록 반환
        return bbs;
    }
    
    public int insertWirte(BoardDTO dto) {
    	int result =0;
    	try {
    		String query ="INSERT INTO board ("
    				+ "num,title,content,id,visitcount)"
    				+"VALUES("
    				+ "seq_board_num.NEXTVAL,?,?,?,0)";
    		  		
    		psmt = con.prepareStatement(query);
    		psmt.setString(1, dto.getTitle());  //inParameter 1,2,3번 
    		psmt.setString(2, dto.getContent());
    		psmt.setString(3, dto.getId());
    		
    	
    		result = psmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    
    return result;
    }
    public BoardDTO selectView(String num) {  //primary key =num 값이 넘어옴
    	BoardDTO dto = new BoardDTO();
    	
    	 String query = "SELECT B.*, M.name " 
                 + " FROM member M INNER JOIN board B " 
                 + " ON M.id=B.id "
                 + " WHERE num=?";
    	
    	try {
    		psmt = con.prepareStatement(query);
    		psmt.setString(1, num);
    		rset =psmt.executeQuery(); // 쿼리 실행
    	
    		if(rset.next()) {
    			dto.setNum(rset.getString(1));
    			dto.setTitle(rset.getString(2));
    			dto.setContent(rset.getString(3));
    			dto.setPostdate(rset.getDate("postdate"));
    			dto.setId(rset.getString(4));
    			dto.setVisitcount(rset.getString(6));
    			dto.setName(rset.getString("name"));
    		}
    		
    	}catch(Exception e) {
    	 e.printStackTrace();	
    	}
    	return dto;
    }

    public void updateVisitCount(String num) {
    	
    	String query = "UPDATE board SET visitcount = visitcount+1 WHERE num =?";
    	
    	try {
    		psmt =con.prepareStatement(query);
    		psmt.setString(1,num);
    		psmt.executeQuery();  // Update가 아닌 Query로 하면 리턴값을 돌려주지 않음
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    public int updateEdit(BoardDTO dto) {

    	int result =0;
    	
    	try {
    		String query ="UPDATE board SET title =?, content =? WHERE num =?";
    		
    		psmt = con.prepareStatement(query);
    		
    		psmt.setString(1,dto.getTitle());
    		psmt.setString(2,dto.getContent());
    		psmt.setString(3,dto.getNum());
    		
    		//쿼리문 적용 , 결과값 리턴됨
    		result = psmt.executeUpdate();
    		
    	}catch(Exception e ) {
    		e.printStackTrace();
    	}
    	return result;
    }
    public int deletePost(BoardDTO dto) {
    	int result = 0;
    	
    	try {
    		
    		String query ="Delete FROM board WHERE num = ?";
    		
    		psmt =con.prepareStatement(query);
    		psmt.setString(1, dto.getNum());
    		
    		result = psmt.executeUpdate();  //데이터에 변경을 주니까 update로!,executeUpdate 반환->int : row count 관련된 레코드의 수가 반환되는것 따라서 1만 리턴됨 
    		System.out.println(result);
    		
    	}catch(Exception e) {
    		
    	}
   	return result;
    }
}




