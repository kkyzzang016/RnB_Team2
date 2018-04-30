package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserVO;
import util.DBManager;

public class UserDao {

    public UserDao() {

    }

    public static UserDao instance = new UserDao();

    public static UserDao getInstance() {

    	return instance;

    }

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    public int login(String userID, String userPassword) {

        String sql = "SELECT userPassword FROM user WHERE userID = ?";

        try {
        	conn=DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음

        } catch (Exception e) {

            e.printStackTrace();
        }
        return -2; // DB 오류

    }

    public UserVO getUserInfo(String userID, String userPassword) {

    	String sql = "select * from user where userId =? AND userPassword =?";
    	UserVO uVo = new UserVO();

    	try {
    		conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				uVo.setUserID(rs.getString("userID"));
				uVo.setUserName(rs.getString("userName"));
				uVo.setUserEmail(rs.getString("userEmail"));
				uVo.setUserCarnum(rs.getString("userCarnum"));
				uVo.setUserPhone(rs.getString("userPhone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return uVo;
    }

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