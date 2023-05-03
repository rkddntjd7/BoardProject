package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
/*
   private final String uid = "root";
   private final String pass = "good6617";
   private final String url = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&amp;characterEncoding=UTF-8";
   private final String driver = "com.mysql.cj.jdbc.Driver";
   
   private Connection conn=null;
   
   //생성자에서 Connection 
   public DBConnect() {
      try {
         Class.forName(driver);
         conn = DriverManager.getConnection(url, uid, pass);
         System.out.println("DB접속 성공");  
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   //메소드
   public Connection getConn() {
      return this.conn;
   }
 */  
   
     private static String uid = "root";
      private static String pass = "uskang0208!";
      private static String url = "jdbc:mysql://localhost:3306/board";
      private static String opt = "useUnicode=true&characterEncoding=UTF-8";
      static {
         url = url + "?" + opt;
      }
      
      public static Connection initConnection() {
        
         Connection conn = null;
         try {
            //JDBC 클래스를 찾는다.
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //DB연결
            conn = DriverManager.getConnection(url, uid, pass);
            System.out.println("접속 성공");
            
         }catch(ClassNotFoundException e) {
            e.printStackTrace();
         }catch(SQLException e) {
            e.printStackTrace();
         }
         return conn;
      }
}