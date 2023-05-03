package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class MemberDDL {
	
	// 멤버 테이블에 글 등록 하는 메소드
	public boolean insert(MembersDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn =  DBConnect.initConnection(); // Connection 객체에서 conn 받아오기
			String query = "insert into members"
							+ "(userid, userpass, username, useremail, postcode, addr, detailaddr, tel, uip)"
							+ "values"
							+ "(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpass());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getUseremail());
			pstmt.setInt(5, dto.getPostcode());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getDetailaddr());
			pstmt.setString(8, dto.getTel());
			pstmt.setString(9, dto.getUip());
			System.out.println(pstmt);
			flag = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { 
				if (pstmt != null) pstmt.close(); 
				if (conn != null) conn.close();
			} catch (SQLException e) {}
		}
		if (flag > 0) { // 성공
			return true;
		} else { // 실패
			return false;
		}
	}
	
	   //회원로그인 성공 실패 판단
    public boolean checkLoging(MembersDTO dto) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	boolean checkUser = false;
    	String sql = "select * from members where userid=? and userpass=?";
    	try {
    	   conn = DBConnect.initConnection();  //Connection 객체에서 conn 받아오기	
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, dto.getUserid());
		   ps.setString(2, dto.getUserpass());
		   rs = ps.executeQuery();
		   if(rs.next()) {
			 checkUser = true;
		   }
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}finally {
    		try { 
    			if(rs != null) rs.close();
    			if(ps != null) ps.close(); 
    		    if(conn != null) conn.close();
    		}catch(SQLException e) {}
    	}
    	return checkUser;
    }
}
