package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreBoardDao {
   private static StoreBoardDao instance;
   private StoreBoardDao() {}
   public static StoreBoardDao getInstance() {
	   if(instance == null) {
		   instance = new StoreBoardDao();
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
   
   
}
