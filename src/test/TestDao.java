package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Vector;

import util.DBManager;

public class TestDao {

	private TestDao() {

	}

	private static TestDao instance = new TestDao();

	public static TestDao getInstance() {
		return instance;
	}

	public String getClient() {

		String result=null;
		String name="강광용";
		String sql = "select clientName from test where clientName='"+name+"'";

		Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DBManager.getConnection();
	         stmt = (Statement) conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         while (rs.next()) {
	           result = rs.getString("clientName");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, stmt, rs);
	      }

	      return result;
	}
}
