import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost";
	String uId = "root";
	String uPwd = "1q2w3e";

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public DBManager() {
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
	
	public void chooseDB(String query){
		try{
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		}catch(SQLException e){
			System.out.println("쿼리 수행 실패");
			System.out.println(e.getMessage());
		}
	}

	public void insertLocation(String gpsX, String gpsY, String ID) {
		if(ID.length() == 5 && ID.charAt(0) == '0'){
			ID = ID.substring(1, 5);
		}
		else if(ID.charAt(0) == '0')
			return;
		
		//이미 DB에 들어간 정보인지를 확인
		String sql = "select gpsX from bus where StopID= '" + ID + "';";
		try {
			//System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			String test = rs.getString(1);
			if(test != null){
				System.out.println("---Already filled---");
				return;
			}	
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패");
			System.out.println(e.getMessage());
			return;
		}
		
		//경위도 좌표 삽입
		sql = "update bus set gpsX = " + gpsX + ", gpsY = " + gpsY + " where StopID = '" + ID + "';";
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("쿼리 수행 실패");
			System.out.println(e.getMessage());
		}
	}
}
