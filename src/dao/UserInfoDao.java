package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserInfoDao {
	private static UserInfoDao instance;
	private UserInfoDao() {}
	public static UserInfoDao getInstance() {
		if(instance == null) {
			instance = new UserInfoDao();
		}
		return instance;
	}
	 public Connection getConnection() {
		   Connection conn = null;
		   try {
			    Context ctx = new InitialContext();
			   DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			   conn = ds.getConnection();
		   }catch(Exception e) {
			   System.out.println("StoreBoardDao getConnection 오류" + e.getMessage());
			   e.printStackTrace();
		   }
		   return conn;
	   }
	 public int selectId(String id, String pw) throws SQLException {
	    	int result = 0;
	    	String SQL = "SELECT PW FROM USERINFO WHERE ID = ?";
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	try {
	    		 conn = getConnection();
	    		 pstmt = conn.prepareStatement(SQL);
	    		 pstmt.setString(1, id);
	    		 rs = pstmt.executeQuery();
	    		 if(rs.next()) {
	    			 String pwCheck = rs.getString(1);
	    			 if(pwCheck.equals(pw)) {
	    				  result = 1;
	    			 }else {
	    				 result = -1;
	    			 }
	    			 
	    		 }else {
	    			 result = -2;
	    		 }
	    	}catch(Exception e) {
	    		System.out.println("selectId 메소드에서 에러 : " + e.getMessage());
	    		e.printStackTrace();
	    	}finally {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(conn != null) conn.close();
	    	}
	    	
	    	
	    	return result;
	    }
}
