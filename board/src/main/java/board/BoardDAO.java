package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDAO {
	
	Connection con; // 데이터베이스에 접근
	PreparedStatement pstmt; // 데이터베이스에서 퀴리 실행
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장
	
	// 게시글 저장 메소드
	public void insertBoard(BoardBean bean) {
		con = new DBConnect().getConn();
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야한다.
		int ref = 0; // 글 그룹을 의미 = 쿼리를 실행시켜서 가장 큰 ref값을 가져온 후 + 1을 더해줌
		int re_step = 1; // 새 글이기에 = 부모 글이기에
		int re_level = 1;
		
		try {
			// 가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from bboard";
			// 쿼리 실행객체
			pstmt = con.prepareStatement(refsql);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과값이 있다면
				ref = rs.getInt(1) + 1; // 최대값에 + 1을 더해서 글 그룹을 설정
			}
			// 게시글 저장하는 쿼리
			String sql = "insert into bboard values(num, ?, ?, ?, ?, sysdate(), ?, ?, ?, 0, ?)";
			// 쿼리 실행객체
			pstmt = con.prepareStatement(sql);
			// ?에 값을 매핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			
			// 쿼리 실행
			pstmt.executeUpdate();
			// 자원 반납
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 모든 게시글을 리턴해주는 메소드
	public Vector<BoardBean> getAllBoard() {
		
		// 리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();
		
		// 데이터베이스 연결
		con = new DBConnect().getConn();
		
		try {
			// 쿼리 준비
			String sql = "select * from bboard order by ref desc , re_step asc";
			// 쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 추출
			while (rs.next()) { // 결과값이 있다면
				// 데이터를 패키징 (가방 = BoardBean 클래스를 이용)
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
				// 패키징 한 데이터를 백터에 저장
				v.add(bean);
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	// BoardInfo 하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		// 리턴 타입 선언
		BoardBean bean = new BoardBean();
		
		// 데이터베이스 연결
		con = new DBConnect().getConn();
		
		try {
			// 조회수 증가 쿼리
			String readsql = "update bboard set readcount = readcount + 1 where num = ?";
			// 쿼리 실행 객체 선언
			pstmt =con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 쿼리 준비
			String sql = "select * from bboard where num = ?";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
}
