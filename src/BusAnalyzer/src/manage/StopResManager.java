package manage;

import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBContact;


public class StopResManager {
	ResultSet rs;
	DBContact db;
	int cnt;
	
	public StopResManager(){ 
		rs = null; 
		db = new DBContact();
		db.chooseDB("use sample");
		cnt = 1;
	}
	
	public void setResultSet(String hour, String mon, String type){
		rs = db.selectStopInfo(hour, mon, type);	
	}
	
	//ResultSet Control functions
	public void getNext() throws SQLException{
		rs.next();
		cnt++;
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
	public boolean isLimit(){
		return cnt <= 500;
	}
	
	//select proper image
	public String getImageURL(){
		String url = null;
		if(cnt <= 100){
			url="http://localhost:8080/BusAnalyzer2/img/red.png";
		}else if(cnt > 100 && cnt <= 250){
			url="http://localhost:8080/BusAnalyzer2/img/yellow.png";
		}else
			url="http://localhost:8080/BusAnalyzer2/img/green.png";
		
		return url;
	}
	
	//check input value for prevent SQL injection
		public String checkInput(String str){
			if(str.contains(";") || str.contains("'")){
				str = "-1";
			}
			return str;
		}
	
}
