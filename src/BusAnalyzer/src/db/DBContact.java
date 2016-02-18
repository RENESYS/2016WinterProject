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

	//DB control class construction
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

	//selectDB when access
	public void chooseDB(String query){
		try{
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		}catch(SQLException e){
			System.out.println("Query execution fail");
			System.out.println(e.getMessage());
		}
	}
	
	//make SQL query from user's input
	public String makeSQLquery(String hour, String mon, String type){
		String ride = "Ride" + hour;
		String alight = "Alight" + hour;
		String sel = type + hour;
		String sql = "select StopName, sum(" + ride + "), sum(" + alight + "), gpsX, gpsY from bus where UseMon=" 
				+ mon + " group by StopName order by sum( " + sel + ") desc";
		return sql;
	}

	//execute query and return result list
	public ResultSet selectStopInfo(String hour, String mon, String type) {
		String sql = makeSQLquery(hour, mon, type);
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//rs.next();
		} catch (SQLException e) {
			System.out.println("Query execution fail");
			System.out.println(e.getMessage());
		}
		return rs;
	}

}
