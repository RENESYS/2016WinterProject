package manage;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONObject;

import data.StopList;
import db.DBContact;

public class RouteResManager {
	ResultSet rs;
	DBContact db;
	int passenger;
	int formerPass;
	boolean access;
	boolean first;
	String dest;
	
	public RouteResManager(){ 
		rs = null; 
		db = new DBContact();
		db.chooseDB("use busapp");
		passenger = 0;
		formerPass = 0;
		access = true;
		first = true;
		dest = "";
	}
	
	public boolean getNext() throws SQLException{
		boolean b = rs.next();
		if(first){
			dest = getDir();
			System.out.println(dest);
			first = false;
		}
		return b;
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
	public String getDir() throws SQLException{
		return rs.getString(6);
	}
	public boolean getAccess(){
		return access;
	}
	
	//search the value from DB
	public void setResultSet(String routeNo, String mon, String hour) throws SQLException{
		rs = db.selectRouteInfo(hour, mon, routeNo);
	}
	
	public void setAccess(String bound) throws SQLException{
		if(bound.equals("down") && !dest.equals(getDir())){
			access = false;
		}
		else if(bound.equals("up") && !dest.equals(getDir())){
			access = true;
		}
		else if(bound.equals("up")){
			access = false;
		}
	}
	
	//calculate bus congestion
	public void calcCongestion() throws SQLException{
		formerPass = passenger;
		passenger += Integer.parseInt(rs.getString(2)) - Integer.parseInt(rs.getString(3));
		if (passenger < 0)
			passenger = 0;
		System.out.println(rs.getString(1) + " : " + passenger);
	}
	
	//set the line color to show congestion
	public String setColor(){
		String color = null;
		if(formerPass < 2000) 	color = "#0033ff";
		else if (formerPass >= 2000 && formerPass < 4000) 	color = "#006600";
		else if (formerPass >= 4000 && formerPass < 6000) 	color = "#ffcc00";
		else if (formerPass >= 6000 && formerPass < 7000) 	color = "#ff6600";
		else	color = "#ff0000";
		return color;
	}
	
	//check input value for prevent SQL injection
	public String checkInput(String str){
		if(str.contains(";") || str.contains("'")){
			str = "-1";
		}
		return str;
	}
	
	
	
}
