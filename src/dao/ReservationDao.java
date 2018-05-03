package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dto.ReservationVO;
import dto.TicketVO;
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

      String sql = "insert into reservation(floor, userCarnum, i_car_t) values(?,?,?)";
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
      String sql = "select userCarnum, floor, i_car_t from reservation where userCarnum=? AND inOrOut='in'";

      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,n);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            reservation.setUserCarnum(rs.getString("userCarnum"));
            reservation.setFloor(rs.getString("floor"));
            reservation.setI_car_t(rs.getString("i_car_t"));
         }
         else {
        	reservation.setFloor("error");
        	reservation.setI_car_t("notime");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return reservation;
   }
   public TicketVO rtselectone(String n) {


       TicketVO ticket = new TicketVO();
       String sql = "select * from commuterTicket where userCarnum=?";

       try {
          conn = DBManager.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1,n);
          rs = pstmt.executeQuery();
          while (rs.next()) {
             ticket.setUserCarnum(rs.getString("userCarnum"));
             ticket.setUserName(rs.getString("userName"));
             ticket.setStartDate(rs.getString("startDate"));
             ticket.setEndDate(rs.getString("endDate"));
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          DBManager.close(conn, pstmt, rs);
       }

       return ticket;
    }



   public String getReserveTime(String userCarnum) {
	   String sql = "select i_car_t from reservation where userCarnum=? AND inOrOut='in'";
	   String result=null;
	   try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,userCarnum);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 result = rs.getString("i_car_t");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

	   return result;
   }
	public void updateOutCarTime(String userCarnum,int money, String o_car_t, String bill) {
		String sql = "update reservation set o_car_t=?, money=?, inOrOut='out', discountInfo=? where userCarnum=? AND inOrOut='in'";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, o_car_t);
	         pstmt.setInt(2,money);
	         pstmt.setString(3, bill);
	         pstmt.setString(4,userCarnum);
	         pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
	}
	public String userReserveInfo(String userCarnum) {

		String result=null;
		String sql = "select i_car_t from reservation where userCarnum=? AND inOrOut='in'";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         if(userCarnum!=null) {
	         pstmt.setString(1,userCarnum);
	         }
	         else {
	         pstmt.setString(1,"55555");
	         }
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            result = rs.getString("i_car_t");
	         }
	         else {
	        	 result="null";
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

		return result;
	}

	public void updateReserveCancel(String userCarnum, String o_car_t) {
		String sql = "update reservation set o_car_t=?, money=0, inOrOut='cancel' where userCarnum=? AND inOrOut='in'";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, o_car_t);
	         pstmt.setString(2,userCarnum);
	         pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
	}

	public String selectFloor(String userCarnum) {
		String result=null;
		String sql = "select floor from reservation where userCarnum=? AND inOrOut='in'";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,userCarnum);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 result = rs.getString("floor");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
		return result;
	}

	public List<ReservationVO> getUsageList(String userCarnum){

		List<ReservationVO> usageList = new ArrayList<>();
		String sql = "select userCarnum, i_car_t, o_car_t, money, inOrOut, discountInfo from reservation where userCarnum=?";
		try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,userCarnum);
	         rs = pstmt.executeQuery();
	         ReservationVO rVo = null;
	         while(rs.next()) {
	        	 rVo = new ReservationVO();
	        	 rVo.setUserCarnum(rs.getString("userCarnum"));
	        	 rVo.setI_car_t(rs.getString("i_car_t"));
	        	 rVo.setO_car_t(rs.getString("o_car_t"));
	        	 rVo.setMoney(rs.getInt("money"));
	        	 rVo.setInOrOut(rs.getString("inOrOut"));
	        	 rVo.setDiscountInfo(rs.getString("discountInfo"));
	        	 usageList.add(rVo);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }

		return usageList;
	}
}