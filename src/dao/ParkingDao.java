package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.ParkingVO;
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

   public ParkingVO fselect(String floor) {


      ParkingVO parking = new ParkingVO();
      String sql = "select * from parking where floor=?";

      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,floor);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            parking.setSpare(rs.getInt("spare"));
            System.out.println(parking.getSpare());
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return parking;
   }

public int pSpare(ParkingVO vo) {
   String sql=null;
   int cnt = 0;
/*if(cancel버튼이 눌리면)
{sql = "update parking set spare=spare+1 where floor=?";
   }else if(예약 버튼이 눌리면){*/
      sql = "update parking set spare=spare-1 where floor=?";
      /*}*/


      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,vo.getFloor());
         cnt=pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return cnt;
   }

public int mSpare(ParkingVO vo) {
   String sql=null;
   int cnt1 = 0;
      sql = "update parking set spare=spare+1 where floor=?";
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,vo.getFloor());
         System.out.println("층층층층"+vo.getFloor());
         cnt1=pstmt.executeUpdate();


      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }

      return cnt1;
   }
}