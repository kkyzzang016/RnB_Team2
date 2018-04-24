package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserVO;
import util.DBManager;

public class JoinDao {

	private JoinDao() {

	}

	public static JoinDao instance = new JoinDao();

	public static JoinDao getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public String confirmId(String userId) {
		String sql = "select userId from user where userId=?";
		String tempId="";
		String result="";

		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,userId);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            tempId=rs.getString("userId");
	            System.out.println(tempId);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

		if(tempId.equals(userId)) {
			result="false";
		}
		else result="true";


		return result;
	}

	public void addUser(UserVO uVo) {

		String sql = "insert into user values(?,?,?,?,?,?)";
		int cnt = 0 ;
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,uVo.getUserID());
	         pstmt.setString(2,uVo.getUserPassword());
	         pstmt.setString(3,uVo.getUserName());
	         pstmt.setString(4,uVo.getUserEmail());
	         pstmt.setString(5,uVo.getUserCarnum());
	         pstmt.setString(6,uVo.getUserPhone());
	         cnt = pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
	}
}
