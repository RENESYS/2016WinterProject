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
				System.out.println("������ ���̽� ���� ����");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �ε� ����");
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("������ ���̽� ���� ����");
			System.out.println(e.getMessage());
		}
	}
	
	public void chooseDB(String query){
		try{
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		}catch(SQLException e){
			System.out.println("���� ���� ����");
			System.out.println(e.getMessage());
		}
	}

	public void insertLocation(String gpsX, String gpsY, String ID) {
		if(ID.length() == 5 && ID.charAt(0) == '0'){
			ID = ID.substring(1, 5);
		}
		else if(ID.charAt(0) == '0')
			return;
		
		//�̹� DB�� �� ���������� Ȯ��
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
			System.out.println("���� ���� ����");
			System.out.println(e.getMessage());
			return;
		}
		
		//������ ��ǥ ����
		sql = "update bus set gpsX = " + gpsX + ", gpsY = " + gpsY + " where StopID = '" + ID + "';";
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("���� ���� ����");
			System.out.println(e.getMessage());
		}
	}
}
