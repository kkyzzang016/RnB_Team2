package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        try {
        	conn=DBManager.getConnection();
            pstmt = conn.prepareStatement(SQL);
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

    public int join(UserVO user) {
    	String SQL = "insert into user value (?,?,?,?,?,?)";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, user.getUserID());
    		pstmt.setString(2, user.getUserPassword());
    		pstmt.setString(3, user.getUserName());
    		pstmt.setString(4, user.getUserEmail());
    		pstmt.setString(5, user.getUserCarnum());
    		pstmt.setString(6, user.getUserPhone());

    		return pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return -1;
    }


}