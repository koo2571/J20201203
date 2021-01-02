package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentsDao {
	private static CommentsDao instance;
	private CommentsDao() {}
	public static CommentsDao getInstance() {
		if(instance == null) {
			instance = new CommentsDao();
		}
		return instance;
	}
	
	public Connection getConnaction() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("CommentsDao getConnaction Exception->"+e.getMessage());
		}
		return conn;
	}
	
	public int getCommTotalCnt(int bd_num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from comments where type_num = 200 and bd_num=?";
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_num);
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getCommTotalCnt Exception->"+e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	public List<Comments> commList(int commStartRow,int commEndRow,int bd_num) throws SQLException{
		List<Comments> commList = new ArrayList<Comments>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * from (select rownum rn ,a.*"
				+ "from  (select * from comments where type_num = 200 and bd_num=? order by comm_num desc) a )"
				+ "WHERE rn between ? and ?";
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_num);
			pstmt.setInt(2, commStartRow);
			pstmt.setInt(3, commEndRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Comments comments = new Comments();
					comments.setId(rs.getString(2));
					comments.setBd_num(rs.getInt(3));
					comments.setComm_num(rs.getInt(4));
					comments.setType_num(rs.getInt(5));
					comments.setComm_like(rs.getInt(6));
					comments.setComm_date(rs.getString(7));
					comments.setComm_cont(rs.getString(8));
					comments.setComm_id(rs.getString(9));
					commList.add(comments);
				}while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("commList Exception->"+e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return commList;
	}
	public int update(Comments comments) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="update comments set comm_cont=? where bd_num=? and comm_id=? and comm_num=?";
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments.getComm_cont());
			pstmt.setInt(2, comments.getBd_num());
			pstmt.setString(3, comments.getComm_id());
			pstmt.setInt(4, comments.getComm_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("update Exception->"+e.getMessage());
		}finally {
			
		}
		return result;
	}
	public Comments select(int type_num,int comm_num, String id) throws SQLException {
		Comments comments = new Comments();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from comments where type_num=? and comm_num=? and comm_id=?";
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type_num);
			pstmt.setInt(2, comm_num);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				comments.setId(rs.getString(1));
				comments.setBd_num(rs.getInt(2));
				comments.setComm_num(rs.getInt(3));
				comments.setType_num(rs.getInt(4));
				comments.setComm_like(rs.getInt(5));
				comments.setComm_date(rs.getString(6));
				comments.setComm_cont(rs.getString(7));
				comments.setComm_id(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println("select Exception->"+e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return comments;
	}
	public int insert(Comments comments) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql2 = "insert into comments values(?,?,comm_num_seq.nextval,?,?,to_char(sysdate,'yy/mm/dd hh24:mi'),?,?)";
		System.out.println(sql2);
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, comments.getId());
			pstmt.setInt(2, comments.getBd_num());
			pstmt.setInt(3, comments.getType_num());
			pstmt.setInt(4, comments.getComm_like());
			pstmt.setString(5, comments.getComm_cont());
			pstmt.setString(6, comments.getComm_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert Exception->"+e.getMessage());
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	public int delete(String id,int bd_num, int type_num, int comm_num, String comm_id) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from comments where id=? and bd_num=? and type_num=? and comm_num=? and comm_id=?";
		try {
			System.out.println("id "+id);
			System.out.println("type_num "+ type_num);
			System.out.println("comm_id "+comm_id);
			System.out.println("comm_num "+comm_num);
			System.out.println("bd_num "+bd_num);
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, bd_num);
			pstmt.setInt(3, type_num);
			pstmt.setInt(4, comm_num);
			pstmt.setString(5, comm_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete Exception->"+e.getMessage());
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	public void like(int bd_num,int type_num,int comm_num, String comm_id,String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update comments set comm_like = comm_like+1 where bd_num=? and type_num=? and comm_num=? and comm_id=? and id=?";
		try {
			conn = getConnaction();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_num);
			pstmt.setInt(2, type_num);
			pstmt.setInt(3, comm_num);
			pstmt.setString(4, comm_id);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		} catch (Exception e) {	
			System.out.println("like Exception->"+e.getMessage());
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
