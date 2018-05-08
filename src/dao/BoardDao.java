package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dto.BoardVO;
import util.DBManager;

public class BoardDao {

   private BoardDao() {

   }

   private static BoardDao instance = new BoardDao();

   public static BoardDao getInstance() {
      return instance;
   }



   public List<BoardVO> selectAllBoards(){
      String sql = "SELECT * FROM board ORDER BY num DESC";
      List<BoardVO> list = new ArrayList<BoardVO>();
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;

      try {
         conn = DBManager.getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         while(rs.next()) {
            BoardVO bVo = new BoardVO();
            bVo.setNum(rs.getInt("num"));
            bVo.setUserID(rs.getString("userID"));
            bVo.setUserEmail(rs.getString("userEmail"));
            bVo.setPass(rs.getString("pass"));
            bVo.setTitle(rs.getString("title"));
            bVo.setContent(rs.getString("content"));
            bVo.setWritedate(rs.getTimestamp("writedate"));
            bVo.setReadcount(rs.getInt("readcount"));
            list.add(bVo);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn,stmt,rs);
      }

      return list;
   }
   public void insertBoard(BoardVO bVo) {
      String sql = "INSERT INTO board("+"num,userID,userEmail,pass,title,content,writedate,readcount) VALUES(num,?,?,?,?,?,?,?)";
      Timestamp register = new Timestamp(System.currentTimeMillis());
      Connection conn =null;
      PreparedStatement pstmt =null;
      try {
         conn= DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, bVo.getUserID());
         pstmt.setString(2, bVo.getUserEmail());
         pstmt.setString(3, bVo.getPass());
         pstmt.setString(4, bVo.getTitle());
         pstmt.setString(5, bVo.getContent());
         pstmt.setTimestamp(6, register);
         pstmt.setInt(7, bVo.getReadcount());

         pstmt.executeUpdate();

      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn,pstmt);
      }
   }

   public void updateReadCount(String num) {
      String sql ="UPDATE board SET readcount = readcount+1 WHERE num=?";
      Connection conn =null;
      PreparedStatement pstmt = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, num);
         pstmt.executeUpdate();

      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn,pstmt);
      }
   }

   public BoardVO selectOneBoardByNum(String num) {
      String sql = "SELECT * FROM board WHERE num =?";
      BoardVO bVo = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, num);
         rs =pstmt.executeQuery();
         if(rs.next()) {
            bVo = new BoardVO();
            bVo.setNum(rs.getInt("num"));
            bVo.setUserID(rs.getString("userID"));
            bVo.setPass(rs.getString("pass"));
            bVo.setUserEmail(rs.getString("userEmail"));
            bVo.setTitle(rs.getString("title"));
            bVo.setContent(rs.getString("content"));
            bVo.setWritedate(rs.getTimestamp("writedate"));
            bVo.setReadcount(rs.getInt("readcount"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn,pstmt,rs);
      }
      return bVo;

   }
   public void updateBoard(BoardVO bVo) {
      String sql="UPDATE board SET userID =?,pass=?,userEmail=?,title=?,content=? WHERE num=?";
      Connection conn =null;
      PreparedStatement pstmt =null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, bVo.getUserID());
         pstmt.setString(2, bVo.getPass());
         pstmt.setString(3, bVo.getUserEmail());
         pstmt.setString(4, bVo.getTitle());
         pstmt.setString(5, bVo.getContent());
         pstmt.setInt(6, bVo.getNum());
         pstmt.executeUpdate();

      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn,pstmt);
      }
   }

   public BoardVO checkPassWord(String pass, String num) {
      String sql = "SELECT * FROM board WHERE pass = ? AND num=?";
      Connection conn = null;
      PreparedStatement pstmt =null;
      ResultSet rs = null;
      BoardVO bVo = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, pass);
         pstmt.setString(2, num);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            bVo=new BoardVO();
            bVo.setNum(rs.getInt("num"));
            bVo.setUserID(rs.getString("userID"));
            bVo.setUserEmail(rs.getString("userEmail"));
            bVo.setPass(rs.getString("pass"));
            bVo.setTitle(rs.getString("title"));
            bVo.setContent(rs.getString("content"));
            bVo.setReadcount(rs.getInt("readcount"));
            bVo.setWritedate(rs.getTimestamp("writedate"));
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }
      return null;

   }
   public void deleteBoard(String num) {
      String sql = "DELETE FROM board WHERE num= ?";
      Connection conn=null;
      PreparedStatement pstmt = null;
      try {
         conn=DBManager.getConnection();
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1, Integer.parseInt(num));
         pstmt.executeUpdate();

      }catch(SQLException e) {
         e.printStackTrace();
      }
   }


}