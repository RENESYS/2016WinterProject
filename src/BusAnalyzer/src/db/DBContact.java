package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContact {

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost";
	String uId = "root";
	String uPwd = "1q2w3e";

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public DBContact() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uId, uPwd);

			if (con != null) {
				System.out.println("DB connected");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("Driver loading error");
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB connection fail");
			System.out.println(e.getMessage());
		}
	}
	
	public Connection getConnection(){
		return con;
	}

	public void chooseDB(String query){
		try{
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		}catch(SQLException e){
			System.out.println("Query execution fail");
			System.out.println(e.getMessage());
		}
	}

	public ResultSet select(String sql) {
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
		} catch (SQLException e) {
			System.out.println("Query execution fail");
			System.out.println(e.getMessage());
		}
		return rs;
	}

}
