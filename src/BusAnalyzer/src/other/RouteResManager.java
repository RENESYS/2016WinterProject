package other;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RouteResManager {
	ResultSet rs;
	
	public RouteResManager(){ rs = null; }

	public void setResultSet(ResultSet r){
		rs = r;
	}
	public void getNext() throws SQLException{
		rs.next();
	}
	
	//check input value for prevent SQL injection
	public String checkInput(String str){
		if(str.contains(";") || str.contains("'")){
			str = "-1";
		}
		return str;
	}
}
