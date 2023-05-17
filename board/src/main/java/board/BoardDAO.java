package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDAO {
	Connection con; // 데이터베이스에 접근
	PreparedStatement pstmt; // 데이터베이스에 쿼리 실행
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장

	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		con = new DBConnect().getConn();

		int ref = 0;
		int re_Step = 1;
		int re_level = 1;

		try {

			// 가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from bboard";
			// 쿼리 실행객체
			pstmt = con.prepareStatement(refsql);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과값이있다면
				ref = rs.getInt(1) + 1; // 최대값에 +1을 더해서 글 그룹을 설정
			}
			// 실제로 게시글 전체값을 데이터 테이블에 저장
			String sql = "insert into bboard values(num, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			// ?에 값을 매핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_Step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bean.getContent());

			// 쿼리 실행
			pstmt.executeUpdate();
			// 자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 모든 게시글을 리턴해주는 메소드 작성
	public Vector<BoardBean> getAllBoard() {

		// 리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();
		
		con = new DBConnect().getConn();
		
		try {
			
			// 쿼리 준비
			String sql = "select * from board order by ref desc, re_step asc";
			// 쿼리를 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			// 데이터 개수를 모르기에 반복문을 이용하여 추출
			while (rs.next()) {
				// 데이터를 패키징
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				// ㅠ
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
