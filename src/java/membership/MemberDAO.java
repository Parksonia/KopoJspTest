package membership;

import java.sql.SQLException;

import common.JDBConnect;

//DAO : DB에 접근하기 위한 객체(DB CRUD 위함)
public class MemberDAO extends JDBConnect {

	
	//DB의 연결이 완료된 DAO 객체 생성 
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv,url,id,pw);
		
	}
	// 아이디 패스워드 일치하는 회원 정보를 반환 (DB에 있는지 검증 하게 됨)
	public MemberDTO getMemberDTO (String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query ="SELECT * FROM member WHERE id=? AND pass = ?"; //IN PARAMETER가 있는 쿼리문
	
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rset = psmt.executeQuery();
			
			//쿼리문 결과 데이터 
			if(rset.next()) {
				dto.setId(rset.getString("id"));
				dto.setPass(rset.getString("pass"));
				dto.setName(rset.getString("name"));
				dto.setRegidate(rset.getString("regidate"));
			}
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	 return dto; // DTO 객체 반환 함
	}
}
