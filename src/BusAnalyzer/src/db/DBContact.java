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
				System.out.println("데이터 베이스 접속 성공");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터 베이스 접속 실패");
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
			System.out.println("쿼리 수행 실패");
			System.out.println(e.getMessage());
		}
	}

	public ResultSet select(String sql) {
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패");
			System.out.println(e.getMessage());
		}
		return rs;
	}

	public String func() {
		return "안녕";
	}

}
