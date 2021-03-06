package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.ParkingVO;
import dto.UserVO;
import util.DBManager;
public class ParkingDao {

   private  ParkingDao() {

   }

   private static  ParkingDao instance = new  ParkingDao();

   public static ParkingDao getInstance() {
      return instance;
   }

   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;

   public int floorSelect(String floor) {

      int spare=0;
      String sql = "select * from parking where floor=?";

      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,floor);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            spare = rs.getInt("spare");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return spare;
   }

	public void pSpare(String floor) {
	   String sql=null;
	/*if(cancel버튼이 눌리면)
	{sql = "update parking set spare=spare+1 where floor=?";
	   }else if(예약 버튼이 눌리면){*/
	      sql = "update parking set spare=spare-1 where floor=?";
	      /*}*/


	      try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,floor);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

	   }

	public int mSpare(String floor) {
	   String sql=null;
	   int cnt1 = 0;
	      sql = "update parking set spare=spare+1 where floor=?";
	      try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,floor);
	         cnt1=pstmt.executeUpdate();


	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

	      return cnt1;
	   }

	public int getDiscountInfo(String discountName) {
		int discountMinute=0;
		String sql = "select discountMinute from discount where discountName=?";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,discountName);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 discountMinute = rs.getInt("discountMinute");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
		return discountMinute;
	}
}