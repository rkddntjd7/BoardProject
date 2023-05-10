package board;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnect {
	// 필드
	private DataSource dataSource;

	// 생성자
	public DBConnect() {
		try {
			// Context, lookup
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/board");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 메소드
	public Connection getConn() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			System.out.println("접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

//   private final String uid = "root";
//   private final String pass = "uskang0208!";
//   private final String url = "jdbc:mysql://localhost:3306/board?useUnicode=truecharacterEncoding=UTF-8";
//   private final String driver = "com.mysql.cj.jdbc.Driver";
//   
//   private Connection conn;
//   
//   //생성자에서 Connection 
//   public DBConnect() {
//      try {
//         Class.forName(driver);
//         conn = DriverManager.getConnection(url, uid, pass);
//         System.out.println("DB접속 성공");  
//      }catch(Exception e) {
//         e.printStackTrace();
//      }
//   }
//   
//   //메소드
//   public Connection getConn() {
//      return this.conn;
//   }
//  

//     private static String uid = "root";
//      private static String pass = "uskang0208!";
//      private static String url = "jdbc:mysql://localhost:3306/board";
//      private static String opt = "useUnicode=true&characterEncoding=UTF-8";
//      static {
//         url = url + "?" + opt;
//      }
//      
//      public static Connection initConnection() {
//        
//         Connection conn = null;
//         try {
//            //JDBC 클래스를 찾는다.
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            
//            //DB연결
//            conn = DriverManager.getConnection(url, uid, pass);
//            System.out.println("접속 성공");
//            
//         }catch(ClassNotFoundException e) {
//            e.printStackTrace();
//         }catch(SQLException e) {
//            e.printStackTrace();
//         }
//         return conn;
//      }
}