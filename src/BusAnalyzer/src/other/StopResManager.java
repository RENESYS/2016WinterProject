package other;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StopResManager {
	ResultSet rs;
	
	public StopResManager(){ rs = null; }
	
	public void setResultSet(ResultSet r){
		rs = r;
	}
	public void getNext() throws SQLException{
		rs.next();
	}
	public String getStop() throws SQLException{
		return rs.getString(1);
	}
	public String getRide() throws SQLException{
		return rs.getString(2);
	}
	public String getAlight() throws SQLException{
		return rs.getString(3);
	}
	public String getGpsx() throws SQLException{
		return rs.getString(4);
	}
	public String getGpsy() throws SQLException{
		return rs.getString(5);
	}
	
	//select proper image
	public String getImageURL(int cnt){
		String url = null;
		if(cnt <= 100){
			url="http://localhost:8080/BusAnalyzer2/img/red.png";
		}else if(cnt > 100 && cnt <= 250){
			url="http://localhost:8080/BusAnalyzer2/img/yellow.png";
		}else
			url="http://localhost:8080/BusAnalyzer2/img/green.png";
		
		return url;
	}
	
}
