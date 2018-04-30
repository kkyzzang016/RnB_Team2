package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import dto.ReservationVO;
import util.DBManager;

public class ReservationDao {

   private ReservationDao() {

   }

   private static ReservationDao instance = new ReservationDao();

   public static ReservationDao getInstance() {
      return instance;
   }
   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;


   public void reservationInsert(ReservationVO vo) {

      String sql = "insert into reservation values(?,?,?)";
      int cnt = 0 ;

      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,vo.getFloor());
         pstmt.setString(2,vo.getUserCarnum());
         pstmt.setString(3,vo.getI_car_t());
         cnt = pstmt.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
      }

   }
   public ReservationVO rselectone(String n) {


      ReservationVO reservation = new ReservationVO();
      String sql = "select * from reservation where userCarnum=?";

      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,n);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            reservation.setUserCarnum(rs.getString("userCarnum"));
            reservation.setFloor(rs.getString("floor"));
            reservation.setI_car_t(rs.getString("i_car_t"));

         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return reservation;
   }

   public int rdelete(ReservationVO vo){
      String sql = "delete from reservation where userCarnum=?";
      int cnt = 0 ;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,vo.getUserCarnum());
         cnt = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return cnt;
   } // memberDelete

   public String getReserveTime(String userCarnum) {
	   String sql = "select i_car_t from reservation where userCarnum=?";
	   String result=null;
	   try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,userCarnum);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 result = rs.getString("i_car_t");
	        	 System.out.println(result);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

	   return result;
   }

}