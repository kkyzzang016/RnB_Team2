package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.PayVO;
import util.DBManager;

public class PayDao {
	   private  PayDao() {

	   }

	   private static  PayDao instance = new PayDao();

	   public static PayDao getInstance() {
	      return instance;
	   }

	   private Connection conn = null;
	   private PreparedStatement pstmt = null;
	   private ResultSet rs = null;


	   public void purchasedCommuterTicketInfo(PayVO payVo) {
		   String sql = "insert into commuterTicket values(?,?,?,?)";
		   int cnt=0;
		   try {
		         conn = DBManager.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1,payVo.getUserCarnum());
		         pstmt.setString(2,payVo.getUserName());
		         pstmt.setString(3,payVo.getStartDate());
		         pstmt.setString(4,payVo.getEndDate());
		         cnt = pstmt.executeUpdate();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         DBManager.close(conn, pstmt);
		      }
	   }

	   public void updateCommuterTicketInfo(PayVO payVo) {
		   String sql = "update commuterTicket set startDate=?, endDate=? where userCarnum=?";

		   try {
		         conn = DBManager.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1,payVo.getStartDate());
		         pstmt.setString(2,payVo.getEndDate());
		         pstmt.setString(3,payVo.getUserCarnum());
		         pstmt.executeUpdate();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         DBManager.close(conn, pstmt);
		      }
	   }
}
